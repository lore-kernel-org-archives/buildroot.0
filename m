Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C90C433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 18:29:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C00FA6FC02;
	Wed, 12 Jan 2022 18:29:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzcgqK5eB0hr; Wed, 12 Jan 2022 18:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DF726FBFE;
	Wed, 12 Jan 2022 18:29:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 713CE1BF578
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 18:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B9C784C1D
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 18:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HFf2CoXTU06s for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 18:29:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 817CC84C15
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 18:29:25 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l25so5767454wrb.13
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 10:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H5M1qaMZIFRIeeqH8VN9uBFEY6ti4RMQgxG9hDNpOrs=;
 b=Sq9pcIF5OZJR/UDGFiHeGXws7mIyEaowZoUgonjNqtDnCcJL2A1B8NoK96WC82PYMv
 ooh8bT7j1PHCGf/cdQhz/qJg6NzKOi9EuFx9ql0x5qEbsq1042dYdjHUqglf1iyY7nIu
 Ci7XU6gjOfyjwsfrAioNDgNAIf6kgHbnya20BjHgMaCDgZlLmCdBPaSJ69PH71NvoqlW
 eB/ULkjQr/Fpn2rHgMDLvQzT0WssWPrvLTAUl/CuEzQ0l0DfkxcroVO+udIx3AnZLnwc
 ygsD4gZInq1YjxfW/tq1SUOjnbmVbEONY0EUyUHBu2sdcU75IefLctkvfiPim9TjyBtH
 cbbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H5M1qaMZIFRIeeqH8VN9uBFEY6ti4RMQgxG9hDNpOrs=;
 b=q3L8L+xvNfWf/cWmCrmWxwE0QvCr4aXIJ8xodq37SNYQuKi86/y7283eoZRq+mcNfl
 vMbnYZXUK0jyaMHz8wRGHdImgs++JAWjqwiC3qlUkF1U7EQt6GjUlafAdERWXfDUxCIz
 Z0+Z6AntFhN0RAUSGM/v+MR9iHkmWG6huGFqcGDZu1PmmrAS/nFzR5R9Sh37zVL6/wcM
 x6dCHbIHHUst4i03mYHYtGsbFdgJfoFIpZSuQ7UsFLp8EKQfGxBGAXxRn4QhpVv5iFbn
 sVBABOEh/8/nlp8CElYI7WiNRJ54S8bBCNbW6DSvI5xbDIR8kxj/yV1gjjYp5TrujP/j
 ZLuQ==
X-Gm-Message-State: AOAM531sp4k3x4yOh04Vvw6S6IqVuWYVQglTzG5wUnzM2bVwuL+o+fbG
 F4vffAu7PmRCZmeSkbOCn6x/JiGzRVM=
X-Google-Smtp-Source: ABdhPJymAULrMV4FG0Lw6REAyOSt9LOc4lwd8C5GP92zaD1GjttIKN/micFH4ZceDzmR4fX6RwIy+w==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr843024wre.469.1642012163661;
 Wed, 12 Jan 2022 10:29:23 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id r13sm550231wmq.28.2022.01.12.10.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 10:29:23 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 19:28:00 +0100
Message-Id: <20220112182800.3128945-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/freerdp: bump to version 2.5.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/FreeRDP/FreeRDP/releases/tag/2.5.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freerdp/freerdp.hash | 4 ++--
 package/freerdp/freerdp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freerdp/freerdp.hash b/package/freerdp/freerdp.hash
index 637e57e8b0..e31b8d5b96 100644
--- a/package/freerdp/freerdp.hash
+++ b/package/freerdp/freerdp.hash
@@ -1,5 +1,5 @@
-# From https://pub.freerdp.com/releases/freerdp-2.4.1.tar.gz.sha256
-sha256  ef75c87926643a0d0041f6556e343ac037380d4260c64885e7cdd20da0147edf  freerdp-2.4.1.tar.gz
+# From https://pub.freerdp.com/releases/freerdp-2.5.0.tar.gz.sha256
+sha256  0fd9396068cda8e6d884d063a4993001f140f46c36464ccae261b9475050cd2b  freerdp-2.5.0.tar.gz
 
 # Locally calculated
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 40a3904024..c536f6cb1c 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREERDP_VERSION = 2.4.1
+FREERDP_VERSION = 2.5.0
 FREERDP_SITE = https://pub.freerdp.com/releases
 FREERDP_DEPENDENCIES = libglib2 openssl zlib
 FREERDP_LICENSE = Apache-2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
