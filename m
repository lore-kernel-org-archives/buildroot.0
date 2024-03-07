Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4452C54E41
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 01:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5121F6063E;
	Thu,  7 Mar 2024 01:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E1dAdwYJgrmB; Thu,  7 Mar 2024 01:45:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5277E608D3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5277E608D3;
	Thu,  7 Mar 2024 01:45:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D066C1BF5B5
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 01:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BD23A4043E
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 01:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N_p7nSR7e2uj for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 01:45:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4896401F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4896401F3
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4896401F3
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 01:45:53 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1dcc7f4717fso3519645ad.0
 for <buildroot@buildroot.org>; Wed, 06 Mar 2024 17:45:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709775953; x=1710380753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wm2lSFUVUUo2WJA1TyBFNtFTYwmNMc46hMoKku6+40A=;
 b=LaA4k64TIwAi2yd3mRJ3LTBKwl1ILaPn4b1wGfRZ+vp0lKklJp7rpdalNlB+GoKeLC
 +EsK3x1mYtv4NysT69q58CAOsoE1kgYA1sxQTKnO+4eTRbV0UDy/EJJeWTNxFgFydmEc
 19vhbxIuElzUwrC5XtBdLVyZNsAuyZZud+XrL0IWDl/ZDd/lBsvCnTrH8ojN8oDanesn
 rjlLNOF+SZEKOIXeOxAkUBye1xyq+BDRDRz0VvPaSqMHQRgMePE++N8tX943+1svOMPx
 INf5s3kxR/BZvmHlM2+FpxmfbvQIGa/iI3Cv97at2r7zk0wGKU0UMPoQqfHYxeIrlTnH
 WkhA==
X-Gm-Message-State: AOJu0YxhnVc4RUo1YWTXfj8yzBTB8PQJvdiWl+P89w6ynVOT8u5egTAu
 8t3sK4VTDmYAImaqqoFA8AbHGIDg93Q4QMb3A6piRghirw4J4UDRveQ/vQbUsNn/Ve6V9YGTLFz
 LylA=
X-Google-Smtp-Source: AGHT+IFkRt+ucWFy3i3AwxcA8/Nl8akAXQ87suJdMiswOCEvs/jVN6/fewPVM2MDJ1JtoeQ0pLTe8Q==
X-Received: by 2002:a17:903:1245:b0:1dc:abeb:22fe with SMTP id
 u5-20020a170903124500b001dcabeb22femr7959438plh.65.1709775952671; 
 Wed, 06 Mar 2024 17:45:52 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 l13-20020a170903244d00b001dcc28544dbsm13269621pls.78.2024.03.06.17.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Mar 2024 17:45:52 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 17:45:41 -0800
Message-ID: <20240307014541.2900022-2-christian@aperture.us>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307014541.2900022-1-christian@aperture.us>
References: <20240307014541.2900022-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1709775953; x=1710380753; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wm2lSFUVUUo2WJA1TyBFNtFTYwmNMc46hMoKku6+40A=;
 b=HQ2c+8yZMi1n7xZ/PyPlbag3YFTpOLjKj9V+zfls3q6HbYjTqPUdBnZqJaPfxQIck+
 88w+NoMK7MAEHuhaljC/J+6mUF/Po3lY2rvleafur8Y66oDSTQpgoNK0tPhtMKwOTObk
 bgCr8oQHm33tV4OyIZ5RKi9m21oA2sKopNxANgZKIFiOaHxw/vB9mGWxAoyF+8j3DYyJ
 tAwO2EGRFiRQI0WFhVVUDKuFSDOBEv6ZaPRvizwl6Wn2M1NYlFr54H4Pcq1dP/Kt5F2I
 9kep3XodWgnIj1AW6XF/vUxcBD3EGpR9EZrZaIDBloxdZAQ01z2qjmSWYr5q0qs3WQj3
 nKCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=HQ2c+8yZ
Subject: [Buildroot] [PATCH v1 1/1] package/nerdctl: bump version to v1.7.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/containerd/nerdctl/releases/tag/v1.7.3

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/nerdctl/nerdctl.hash | 2 +-
 package/nerdctl/nerdctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
index 1fb0649fb2..52e249824f 100644
--- a/package/nerdctl/nerdctl.hash
+++ b/package/nerdctl/nerdctl.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  574438dd7c88e6a607c6f82932f8ada174b1133a66ee0fa0f7510e7c3bebacb4  nerdctl-1.3.1.tar.gz
+sha256  fff8c348efa4ff6753e1aacded0dedddcb255c50b00d8b3a37a660b1fb1dd31a  nerdctl-1.7.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/nerdctl/nerdctl.mk b/package/nerdctl/nerdctl.mk
index 43e862f7f9..66b22df646 100644
--- a/package/nerdctl/nerdctl.mk
+++ b/package/nerdctl/nerdctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NERDCTL_VERSION = 1.3.1
+NERDCTL_VERSION = 1.7.3
 NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))
 
 NERDCTL_LICENSE = Apache-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
