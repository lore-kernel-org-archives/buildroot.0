Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A7EC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 07:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C93B41DEA;
	Thu,  4 May 2023 07:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C93B41DEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSDVJ8d840MH; Thu,  4 May 2023 07:37:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8955B41DDD;
	Thu,  4 May 2023 07:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8955B41DDD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CF971BF3C8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7248041EAA
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 07:37:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7248041EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wP7IvTkLsehF for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 07:37:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 742D441EA8
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 742D441EA8
 for <buildroot@buildroot.org>; Thu,  4 May 2023 07:37:14 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1aaec9ad820so981435ad.0
 for <buildroot@buildroot.org>; Thu, 04 May 2023 00:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683185834; x=1685777834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cL8rKSt8zhXWfNUZWphZS8vATaL19a/w4kRXqHUqAMU=;
 b=Vd4sHrBN0Rst+ZMT8tG/IQ6atAamZSa4BlZjx+tIekgRZWJVViRmS68WcuUpTm+abk
 5qu+kpT4iQ//zgrhCiuzYOuH97CvEK4+n2XSLP0+7/Tdqob/tHa+7z4FqKly0EigPhex
 LiOfrobHZyv0pUE1gJ7F08+sk3zDYZzzTaoCIIuZCgl7/kZvtCUQYc8dKhnTm2VWmzYF
 K16JmQUGjawacnkK1aP4W15sTigBh4OGnhMuQyKyPbDdJbQcXl2HuBSH/dTtQPzkpACy
 /U7cy95u1UJ/Fr1kZ7MXsfBVKm5trM8QaU7n93l/7n2GvU5hwqJl3kI2/ylVtm6+fpcH
 qIAQ==
X-Gm-Message-State: AC+VfDxMXem5dgbSGKyfRDIkYngFuUW07ETI7ggCLlhzV41PGzPH+8k1
 qmUyhvfQnQMTvd2kiwaLyGvHTAZqEnrATk0iRfeObqK7rRw=
X-Google-Smtp-Source: ACHHUZ4rTzYNX3hkjZ1SOvsRywBdGrozxxERaRJhF/iqMxz3G0goZ67HPI4+1kBmz284ltBexs7zkQ==
X-Received: by 2002:a17:903:1cb:b0:1a9:88a0:9b5d with SMTP id
 e11-20020a17090301cb00b001a988a09b5dmr3196977plh.57.1683185833801; 
 Thu, 04 May 2023 00:37:13 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 l9-20020a170902d34900b001a1c721f7f8sm22848848plk.267.2023.05.04.00.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 00:37:13 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  4 May 2023 00:37:11 -0700
Message-Id: <20230504073711.3469113-1-christian@aperture.us>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1683185834; x=1685777834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cL8rKSt8zhXWfNUZWphZS8vATaL19a/w4kRXqHUqAMU=;
 b=GJlYouJgPD3QZvOAdQrr69Q09N4KktdbLUpu6dPcR/ejfFUd79tA9P4PktHtI3LGEM
 rL7RnQ9iFiG3sWN5oW6+qN6ZhCCIwV27vTW1xoNpx8cisdcLICi+YhHYU6w5OFptyfh6
 BpjTlHDauNZ2yB8g6DTGyLv5wXEjFxbnY4UWLUp2IDqUNRhjlIo242BBxnG0wSVd33ZY
 GsnzQdxchq7xOZZj8NGoOQxJEJTYOSNlc+2VWmHshK5SK/e/help++cgDapc1LB+salY
 Fdeu3YG6WM4Qyd/q7/8PPsHopk4dJ61jxQiFFj/7hzCLqg31P1HarZ40pTt0Kh+b/QTB
 6QDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=GJlYouJg
Subject: [Buildroot] [PATCH v1 1/1] package/nerdctl: bump version to 1.3.1
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

Bugfixes and features.

https://github.com/containerd/nerdctl/releases/tag/v1.3.1

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/nerdctl/nerdctl.hash | 2 +-
 package/nerdctl/nerdctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
index 8f2c678198..1fb0649fb2 100644
--- a/package/nerdctl/nerdctl.hash
+++ b/package/nerdctl/nerdctl.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  08a84b9481b37dbd8cc6f955dbec0c18a1934bcffeb135fd5d2dc23987152b7c  nerdctl-1.2.0.tar.gz
+sha256  574438dd7c88e6a607c6f82932f8ada174b1133a66ee0fa0f7510e7c3bebacb4  nerdctl-1.3.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/nerdctl/nerdctl.mk b/package/nerdctl/nerdctl.mk
index 7556bcc391..43e862f7f9 100644
--- a/package/nerdctl/nerdctl.mk
+++ b/package/nerdctl/nerdctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NERDCTL_VERSION = 1.2.0
+NERDCTL_VERSION = 1.3.1
 NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))
 
 NERDCTL_LICENSE = Apache-2.0
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
