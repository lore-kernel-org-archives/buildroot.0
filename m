Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E122C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 21:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5102160A89;
	Sat,  8 Jan 2022 21:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q5jcNBJlLej2; Sat,  8 Jan 2022 21:51:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A46C860A7F;
	Sat,  8 Jan 2022 21:51:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 523BB1BF283
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:51:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C29040868
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GbQi-tI0Aona for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 21:51:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8CA8C40761
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 21:51:01 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k18so18568413wrg.11
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 13:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d2RJPFEpodsdnv7t44vmM2btzIChKC5Yjo2xmQROB80=;
 b=m1fhFKo5iXUM/6U6JeqZN+3A5HkxVM4Jc3AjjF7immLKV6g3YVbgtL0vA40I73rUZn
 JrspGKw9K+le6vwBthaluB3XkUd7fc0G6FhS3NGkeNT40ZTreFDUG4Si/fyHvOJSQ7NW
 SX2Eon0qxR2rXMfiCP3WY4Zk9XQJKYDpEg7cPIpSE3Or7uzB960Unoe/gnjsaIixTNXf
 JrKk7OcTuFqWAAtssb2Uk1w7nD5F/6NExIEDibBjlQno91TskuJ8UHyF3uTDDjgJDUVy
 57rN20/aCTFXTznRGWWFVeO2agsFAiFWim0L+gxV2UJY5/9j5z26i4U9hPLc/vHaTRHx
 zPbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d2RJPFEpodsdnv7t44vmM2btzIChKC5Yjo2xmQROB80=;
 b=B9xY3gYXLR1TDQXeb8ZU8A10CkGYpZ4QBlVf/LItbUTFMdleMazm4wUB+DMZozobO/
 y79b20QuLHZvRkT9x+OSFHGa+BnCDk+ELfJ1lGYeuSyBLKRXFRP5CljDKWkkytapsxp9
 Qp0Fa789jsjxTYrpdKJMscUj6uXC5bDRtbo/5++3122KMku4MN1CwejpzxEe5yLvvfsQ
 21QQQ9W/Nk20xh91DDehmuywP/vfO/h686s9eKQ7RLPpXddSLbtanNpev6+kfU5CO3OJ
 bRudm3SwB8whbS1GQx8R3x408FWvWYwX1gprkx3QGYPrO/eUS9hoSQ3dCVCCiGm4U7p5
 TjrA==
X-Gm-Message-State: AOAM531ForLtcDLpBsRZfOZ1ziUqcS/KtlLzs4MjVogB1AGD+7OoPG/V
 srEmLOOsRjegcevDGlurB7tlr1SPzQM=
X-Google-Smtp-Source: ABdhPJzbshBu9cJDIR5FE5mIUWRH39Hhwv0FkAKvLy/KP4HQW92vNN7trT4Ou/SZ57Uk4hD7Wrb1fg==
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr6337467wri.300.1641678659463; 
 Sat, 08 Jan 2022 13:50:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id f13sm2835354wri.51.2022.01.08.13.50.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 13:50:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 22:49:52 +0100
Message-Id: <20220108214952.3493782-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/btrfs-progs: add zstd support
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

zstd is supported since version 4.13.1 and
https://github.com/kdave/btrfs-progs/commit/717a8b1e5d1ba69154ef84b35be75c9cf7730e1d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/btrfs-progs/btrfs-progs.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 4c26cf0df5..b010a0e0be 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -8,7 +8,7 @@ BTRFS_PROGS_VERSION = 5.15.1
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
-BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-zstd --disable-python
+BTRFS_PROGS_CONF_OPTS = --disable-backtrace --disable-python
 BTRFS_PROGS_LICENSE = GPL-2.0, LGPL-2.1+ (libbtrfsutil)
 BTRFS_PROGS_LICENSE_FILES = COPYING libbtrfsutil/COPYING
 BTRFS_PROGS_INSTALL_STAGING = YES
@@ -30,6 +30,13 @@ else
 BTRFS_PROGS_CONF_OPTS += --disable-convert
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+BTRFS_PROGS_CONF_OPTS += --enable-zstd
+BTRFS_PROGS_DEPENDENCIES += zstd
+else
+BTRFS_PROGS_CONF_OPTS += --disable-zstd
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 BTRFS_PROGS_CONF_OPTS += --enable-libudev
 BTRFS_PROGS_DEPENDENCIES += udev
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
