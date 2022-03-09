Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EA5C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Mar 2022 22:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A9A84183B;
	Wed,  9 Mar 2022 22:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Exzv3MeAQbs3; Wed,  9 Mar 2022 22:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7176541828;
	Wed,  9 Mar 2022 22:04:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1995B1BF37E
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09B5F417CB
 for <buildroot@lists.busybox.net>; Wed,  9 Mar 2022 22:04:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mynjE-M5R4tn for <buildroot@lists.busybox.net>;
 Wed,  9 Mar 2022 22:04:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31E8F41828
 for <buildroot@buildroot.org>; Wed,  9 Mar 2022 22:04:07 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 r67-20020a1c4446000000b00389d73ceb43so787156wma.4
 for <buildroot@buildroot.org>; Wed, 09 Mar 2022 14:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XcgD8w5I2pF7o9icD4/iNa2V8fuDzzP91zs7MphwKQo=;
 b=nVw6+4kmeuB+bw4KAthBCT7PMh0pIkgryqPjjWOF1pwd+A7nKI6l/XNyrh436QF0Dd
 YRcbv2nFwGZ9GIn997i7k0VyfvQkGPpt2wZJRo+Cqqim0LJ0lTt1x1BTYbJmluQFOCWZ
 9hJbA4xVLNHQFdyWXsb4pGmDKZlWua/t6/TD383xBS1lV7aL+heV+TsHrZcm2sMyzovn
 dMOEAbpS1A02F7SjEmWRMJR7uatiad1yuJCjIbjq6o400aNTAVE3dmeENzmqv0gsq0IS
 7rzLurTOSe+sqvqt0ZPPfYSNhAII3oVbRKFJkZwsO3xpD19bRGRNBXubeSK2OX1ExBzU
 ELYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XcgD8w5I2pF7o9icD4/iNa2V8fuDzzP91zs7MphwKQo=;
 b=tU5Mmc7D6HvRA1SkCrKPDnNJ5tdvMTSRhokILD2VjLBeg4OTuhTTibEcXPHej/e1tr
 JPPGTCC/QHiBzIisFLoqxWgmhK0Pw4oa5MCH4nx3KANu+uoWGkqjd/ICFbYO5yyYaELL
 ZRj1KczY1KcBL7PxRBrW3V7BDpXR7UIoxPmIoKB+JVC51HyIXwCGnWLlHUxF1a5hbYjR
 sTsrcK5k6Z7WssJsW9W6gwLB7JJ6ErAC/Nk/DWGuRpH+hyaBmSNMKCl8NIEbR88tngsR
 lJqfRyBqbhY3UfeG/EsX8yAKQydYVw+O2GC21nsJlBCOTqSKKbFa7XLbZuTBsRvYsHK3
 Piug==
X-Gm-Message-State: AOAM531SKTixTiKX5TOXBunS7qF2k9jVW5zpgebfAe6odQQRaIpAhyqL
 fjPawaa8gD0b5XBAQ2c/8bmWgEGTD5s=
X-Google-Smtp-Source: ABdhPJzyDsfI8GbbJumDRjSRTgfh72cASkLmB12mzsiRfZERyAkX4WWhQVIW15KuDfWe0Q48YYQwqQ==
X-Received: by 2002:a7b:c5d6:0:b0:381:4127:84d3 with SMTP id
 n22-20020a7bc5d6000000b00381412784d3mr9201765wmk.24.1646863445277; 
 Wed, 09 Mar 2022 14:04:05 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b0038167e239a2sm3060685wmq.19.2022.03.09.14.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 14:04:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Mar 2022 23:03:20 +0100
Message-Id: <20220309220320.787799-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nbd: bump to version 3.24
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

https://github.com/NetworkBlockDevice/nbd/compare/nbd-3.21...nbd-3.24

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nbd/nbd.hash | 8 ++++----
 package/nbd/nbd.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index f0df35bc27..f58a89bf9a 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/nbd/files/nbd/3.21/
-md5  c51c4c500fe1ed84c3d5d5dd2ca71d23  nbd-3.21.tar.xz
-sha1  88c3296d43d20d7bda97e0f1bab0243a4f6fa880  nbd-3.21.tar.xz
+# From http://sourceforge.net/projects/nbd/files/nbd/3.24/
+md5  a6d9e7bbc311a2ed07ef84a58b82b5dd  nbd-3.24.tar.xz
+sha1  72c59ef5186ae355de6f539a1b348e18cbb8314e  nbd-3.24.tar.xz
 
 # Locally calculated
-sha256  e7688af39d91733bbcd2db08062c44fe503d004e51528740139c44aff6a6bef9  nbd-3.21.tar.xz
+sha256  6877156d23a7b33f75eee89d2f5c2c91c542afc3cdcb636dea5a88539a58d10c  nbd-3.24.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index 0a7f08b2cf..f0fb23910e 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.21
+NBD_VERSION = 3.24
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
