Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12FCC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 22:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A7C60D54;
	Tue,  1 Feb 2022 22:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wfykQgN9SNl3; Tue,  1 Feb 2022 22:04:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99AC060C20;
	Tue,  1 Feb 2022 22:04:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E565E1BF424
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3BF7415A2
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 22:03:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uD40gNbTou7u for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 22:03:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE57541594
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 22:03:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l129-20020a1c2587000000b0035394fedf14so3004583wml.5
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 14:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RigTqja0vn0VHhL/BIw6R15OJotIDym1FN/JmilMbvs=;
 b=C4vV6ujU1Y2MPz7jSDl4GPo5KVjndt09R9uBz5VF9mcdZsHhgmnK5MeWVyatswrWOB
 3Vpph1I67IJ5oI1569ksyEe/pcNgvOfzipXlgjggH+bYRC42GqUFHxf5+/R/pJ1lsrEi
 a75CpVpZtRrzWCkv4du3PpvIWujc2sIPPPWY9rvIb1+pDo2AYbOzC8b/sTTP8kcg0oIG
 Fg3WnEOr+lW2R2eUooQ4phsvv0peukGSb0u2FweGnd/z2Fp5QuwSzqRoJcah6F/6YuLT
 E8RHGFE8Ys7b2mfTCU8L3MHc2C5r/eAE9ePaBGnI/F3vuapa3u5oIUFYkfp/lyk8+CVN
 /WDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RigTqja0vn0VHhL/BIw6R15OJotIDym1FN/JmilMbvs=;
 b=3Gvfa4CMg2+dWOIShC22jovXvB2Xjd3tb/QXJRDb6h0MS40DFFyaD9/ZYQMokJqgXy
 Kk3AcQ32SiiuBZ3fEXbVWBr77IxuYpcgFokcacY3ObUyXTkj+ldGwsN+XNE8hmQfev8P
 MWWaZM/au0nak7Zpawf3pRzQgYi/AS5uK9DtZLWd+j05q43FOCA2uQRrLZ5ZvJXfcFkd
 MNqyiqF6ujfOTTAAgfq9CFTu1siqcOzTk0u3O/IVNfDC0EISsjkS6SqUQcj4xicnsD0l
 gnsSsO6+2ur+Zi1b9LoNTaUIwqHwv3R4bOGV6tKBlBY1TWLwBjDWbndZFfYztwg70Xiu
 UE7w==
X-Gm-Message-State: AOAM530uGEUbJG+9ZrjnrSL4pxGy5ptASUWxhh4cBFfn0CFUVztNKDXE
 16HtdPB36XOsR/GIjRQYjlfNjbZ7ebw=
X-Google-Smtp-Source: ABdhPJy666EhAmcjtzcP4tCtMHi4XNVXrVvzVVnOJXiJybWlAA/nXDmF6ACVVG7kjVfgufOWK7Wh7A==
X-Received: by 2002:a05:600c:1509:: with SMTP id
 b9mr3511545wmg.144.1643753032742; 
 Tue, 01 Feb 2022 14:03:52 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id l40sm3423175wms.0.2022.02.01.14.03.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 14:03:52 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  1 Feb 2022 23:01:51 +0100
Message-Id: <20220201220151.350153-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libusb: bump to version 1.0.25
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://github.com/libusb/libusb/blob/v1.0.25/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...parsing-of-descriptors-for-multi-con.patch | 62 -------------------
 package/libusb/libusb.hash                    |  2 +-
 package/libusb/libusb.mk                      |  2 +-
 3 files changed, 2 insertions(+), 64 deletions(-)
 delete mode 100644 package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch

diff --git a/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch b/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch
deleted file mode 100644
index 55e6a1494e..0000000000
--- a/package/libusb/0001-linux_usbfs-Fix-parsing-of-descriptors-for-multi-con.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 623e2a995d156e115c91f56a3ec691bdc333df8b Mon Sep 17 00:00:00 2001
-From: Chris Dickens <christopher.a.dickens@gmail.com>
-Date: Sun, 13 Dec 2020 15:49:19 -0800
-Subject: [PATCH] linux_usbfs: Fix parsing of descriptors for
- multi-configuration devices
-
-Commit e2be556bd2 ("linux_usbfs: Parse config descriptors during device
-initialization") introduced a regression for devices with multiple
-configurations. The logic that verifies the reported length of the
-configuration descriptors failed to count the length of the
-configuration descriptor itself and would truncate the actual length by
-9 bytes, leading to a parsing error for subsequent descriptors.
-
-Closes #825
-
-Signed-off-by: Chris Dickens <christopher.a.dickens@gmail.com>
-(cherry picked from commit f6d2cb561402c3b6d3627c0eb89e009b503d9067)
-Signed-off-by: John Keeping <john@metanate.com>
----
- libusb/os/linux_usbfs.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/libusb/os/linux_usbfs.c b/libusb/os/linux_usbfs.c
-index fb2ed53..4d2dc8d 100644
---- a/libusb/os/linux_usbfs.c
-+++ b/libusb/os/linux_usbfs.c
-@@ -641,7 +641,12 @@ static int seek_to_next_config(struct libusb_context *ctx,
- 	uint8_t *buffer, size_t len)
- {
- 	struct usbi_descriptor_header *header;
--	int offset = 0;
-+	int offset;
-+
-+	/* Start seeking past the config descriptor */
-+	offset = LIBUSB_DT_CONFIG_SIZE;
-+	buffer += LIBUSB_DT_CONFIG_SIZE;
-+	len -= LIBUSB_DT_CONFIG_SIZE;
- 
- 	while (len > 0) {
- 		if (len < 2) {
-@@ -718,7 +723,7 @@ static int parse_config_descriptors(struct libusb_device *dev)
- 		}
- 
- 		if (priv->sysfs_dir) {
--			 /*
-+			/*
- 			 * In sysfs wTotalLength is ignored, instead the kernel returns a
- 			 * config descriptor with verified bLength fields, with descriptors
- 			 * with an invalid bLength removed.
-@@ -727,8 +732,7 @@ static int parse_config_descriptors(struct libusb_device *dev)
- 			int offset;
- 
- 			if (num_configs > 1 && idx < num_configs - 1) {
--				offset = seek_to_next_config(ctx, buffer + LIBUSB_DT_CONFIG_SIZE,
--							     remaining - LIBUSB_DT_CONFIG_SIZE);
-+				offset = seek_to_next_config(ctx, buffer, remaining);
- 				if (offset < 0)
- 					return offset;
- 				sysfs_config_len = (uint16_t)offset;
--- 
-2.30.1
-
diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
index 6169a186a5..a18935fe03 100644
--- a/package/libusb/libusb.hash
+++ b/package/libusb/libusb.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7efd2685f7b327326dcfb85cee426d9b871fd70e22caa15bb68d595ce2a2b12a  libusb-1.0.24.tar.bz2
+sha256  8a28ef197a797ebac2702f095e81975e2b02b2eeff2774fa909c78a74ef50849  libusb-1.0.25.tar.bz2
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
index 28efcadefc..1e82cb9a85 100644
--- a/package/libusb/libusb.mk
+++ b/package/libusb/libusb.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBUSB_VERSION_MAJOR = 1.0
-LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).24
+LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).25
 LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
 LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
 LIBUSB_LICENSE = LGPL-2.1+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
