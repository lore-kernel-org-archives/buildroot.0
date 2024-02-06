Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EEDC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 20:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76A6861065;
	Tue,  6 Feb 2024 20:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78TgyCVRxO3t; Tue,  6 Feb 2024 20:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FAEA6114D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FAEA6114D;
	Tue,  6 Feb 2024 20:42:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C3631BF298
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 098F06114D
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 20:42:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxtEMf1wRMKC for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 20:42:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92F2661065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92F2661065
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92F2661065
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 20:42:14 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40ff802496cso4855045e9.3
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 12:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707252132; x=1707856932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Nm4e0TV2j7GOeyx6sRAspwpuQzH4/ae85qysSY/3dM=;
 b=acmk9sBCoh4JVramngV2RtEA5YNRNNg+Dr987ru9ylFfqwOXQN/3buQem17ncUYIiX
 ntnp70nU/roXzHK8FFi6DsXsL0QKXtcNDD1VMy4Et8RuhaGr4gZmkZd/cmiwOm1MR+Pv
 uXpOhogFuIxKUHm5B+fZWveCrFUjf2Tw5w92k/t9snELVq9rl/8yLglsKkNg59bmYJBR
 9BhLbtbxM+ASIkh5X+DzVoe/RQKGQ0Y7dpxDsFT1Ny/ElJGAxIr9MDNdtcoDXAZ9GB4f
 crZfaHbgs4T08U9Jp84I03Y2ZxaGcz25jNn1Qn1R0hVivbVIsx8LXs27rZ0uMkyndJY2
 +fuw==
X-Gm-Message-State: AOJu0YyJajsyTGH6QbqBm3WIyL7F30IecsoUUxbRmpokBOQzQk9QvNyB
 dm17mYWniOe7LixVPios9wp9W2O33W8EnwTpntgOHilCSO+TGk7lx2ICanln+bM=
X-Google-Smtp-Source: AGHT+IEY3Us5K6DhQdnsi/WjoWlnB+L4N4Cv76j1VfAIqMwl5LfFY+BfN2LBmy7dZ4Ck4oF1Zn3j4Q==
X-Received: by 2002:a05:600c:4688:b0:40f:d1e4:6074 with SMTP id
 p8-20020a05600c468800b0040fd1e46074mr2573150wmo.8.1707252131900; 
 Tue, 06 Feb 2024 12:42:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c300600b0040fdd8f5e18sm2933361wmh.34.2024.02.06.12.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 12:42:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 21:42:08 +0100
Message-ID: <20240206204209.864622-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707252132; x=1707856932; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9Nm4e0TV2j7GOeyx6sRAspwpuQzH4/ae85qysSY/3dM=;
 b=GNAAEb0Zuw/6kRU3NKAoOHC6kqsmxYWyS3oaWJFLtjMerJDhHgxifYLd2T0JajW27Z
 LkR5On6+Xe0LEmV/jaD8qapiFCAseDGaJmoR3lBvD1CYNSy7QCIl56Hkzw6dpM6tWAfz
 DOqBueZD5Un8mJAo1DQdn+JWC46VSNLmctAGg6YfS2lplKcCuNVBZqxfhMPJytfFzPEd
 Lu65xinehLA12Mr1M0ri5c/9nl/uIfhh+/xRL+D74LcTKiEIEZwchL/wMC1NdjBKOS8/
 /XcWR/g46SFVSc7zqOxgcvWyPdznE7hUQfAYOwRi3d3D/t7cNxBEGtkw3JRXx4auMZ+5
 R4BA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GNAAEb0Z
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump to version
 2.6.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Security fixes:
 - CVE-2023-52425: Fix quadratic runtime issues with big tokens that can
   cause denial of service, in partial where dealing with compressed XML
   input. Applications that parsed a document in one go -- a single call
   to functions XML_Parse or XML_ParseBuffer -- were not affected. The
   smaller the chunks/buffers you use for parsing previously, the bigger
   the problem prior to the fix.
 - CVE-2023-52426: Fix billion laughs attacks for users compiling
   *without* XML_DTD defined (which is not common). Users with XML_DTD
   defined have been protected since Expat >=2.4.0 (and that was
   CVE-2013-0340 back then).

https://blog.hartwork.org/posts/expat-2-6-0-released/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index c6c25aa3e0..043501378b 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.5.0/
-md5  ac6677b6d1b95d209ab697ce8b688704  expat-2.5.0.tar.xz
-sha1  5178e13c1e34f4643d5118d5758babfe0e836fe2  expat-2.5.0.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.6.0/
+md5  bd169cb11f4b9bdfddadf9e88a5c4d4b  expat-2.6.0.tar.xz
+sha1  d87e8ab2a3c1deb858c6b22e5ade9d5673086004  expat-2.6.0.tar.xz
 
 # Locally calculated
-sha256  ef2420f0232c087801abf705e89ae65f6257df6b7931d37846a193ef2e8cdcbe  expat-2.5.0.tar.xz
+sha256  cb5f5a8ea211e1cabd59be0a933a52e3c02cc326e86a4d387d8d218e7ee47a3e  expat-2.6.0.tar.xz
 sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 6f22024cc0..5f4016e0d1 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.5.0
+EXPAT_VERSION = 2.6.0
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
