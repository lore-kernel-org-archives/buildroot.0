Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D504C433FE
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 19:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEBF04017F;
	Mon, 21 Feb 2022 19:23:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AXYO2Kqh_aRC; Mon, 21 Feb 2022 19:23:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C56D24017E;
	Mon, 21 Feb 2022 19:23:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A3CF1BF319
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 19:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 369D560B79
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 19:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AjIOTAPGEh5N for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 19:23:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 400F860B44
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 19:23:11 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso72258wmj.2
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 11:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TCaXyLEe1pN/umhD4CzDF5V6BsIPWfXhB9XKe9asK2k=;
 b=a9tR3VoRtxfFB6hvfltVVv7hg+kJONpWFOZcYhMFcleDalIyV66cfoiIqgZMmIOm5T
 mV0+bap09a8MUJo3VFEsb6acZgHHSkkqMunZnHzuF+Z3v0w6pa4vTCXscVU+qpKTjHcB
 uwWgtGkRomr2SnI6LZJbIussTJIX88v8NHxS5v4cO3X8gVJY9Y+KSPyNjVGZwgBBdBZB
 dkJL48FSnMVOmTrIVZmYqxJMrYekrKj7Fqol6Wz9XW7tKjL5cpmWJqf0WX5DJnZJyY5q
 YDoQqC/POtMnHqKSbWij0eBlb9w/xlt3TpLVTQ1QHOMD4AkEbA4KVP3G5NjpdudIZ3DV
 vHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TCaXyLEe1pN/umhD4CzDF5V6BsIPWfXhB9XKe9asK2k=;
 b=wsBYerQlE072ftebk3rXn4sI9QV+Twy8sD1YeRncer/BPZSBjR6Uc+7dR3p+eepbhK
 nJH9CPJ6xX00dF9F5sGTRxtye0228DbbApNRSZuFDHvFAX0UA6G2USg8IeiIadWJFqbQ
 B4VhV6BPo391Ag4CaiBW1kQl8LRTaxW1mdu/C2EFFJpFnORikRdhnwOeZPxU3XKUnY0i
 6XoNXeODeE1ScszTc6885aiC1DlWqKqJnem66QZUNv7tHAyShjv2P7ZSPhel8w+Euu44
 aVJMTcjWpfcThhwrbgf+bM2k4eXLncFwbcwtEj2xdAc8LAo/sMmeYe4IxXUqMsX8Pxez
 oAyw==
X-Gm-Message-State: AOAM533nDosXq5+ZY93PVH9/bn2u2HQBD4/HY6d4HGHdGx5L8vbkZ7oI
 VM6JW4gMeFl7nhSYsmf39p0me00eVD+0uw==
X-Google-Smtp-Source: ABdhPJzsdUSU0+yrFOyiOyANiNJRGKoQmY5nL6h4GSn/uSukPTcUM6gac64DKMnGI2a3p8eM6IH/wQ==
X-Received: by 2002:a1c:f415:0:b0:37f:ab4d:1df2 with SMTP id
 z21-20020a1cf415000000b0037fab4d1df2mr384086wma.75.1645471389304; 
 Mon, 21 Feb 2022 11:23:09 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id v8sm26782557wrf.115.2022.02.21.11.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 11:23:08 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 20:23:02 +0100
Message-Id: <20220221192302.20698-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/modem-manager: bump version to
 1.16.10
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested:

                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

                             andes-nds32 [ 1/45]: FAILED # not related to this change
                             arm-aarch64 [ 2/45]: OK
                   bootlin-aarch64-glibc [ 3/45]: OK
               bootlin-arcle-hs38-uclibc [ 4/45]: OK
                    bootlin-armv5-uclibc [ 5/45]: OK
                     bootlin-armv7-glibc [ 6/45]: OK
                   bootlin-armv7m-uclibc [ 7/45]: SKIPPED
                      bootlin-armv7-musl [ 8/45]: OK
             bootlin-microblazeel-uclibc [ 9/45]: OK
                   bootlin-mipsel-uclibc [10/45]: OK
                bootlin-mipsel32r6-glibc [11/45]: OK
                bootlin-m68k-5208-uclibc [12/45]: SKIPPED
               bootlin-m68k-68040-uclibc [13/45]: OK

 package/modem-manager/modem-manager.hash | 2 +-
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 14597215df..ea91f42fe0 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  2ccf1f716c2d121e8e6709bcf8af29ee86971a90adacca2e8d6288b30278862e  ModemManager-1.16.10.tar.xz
+sha256  d4f804b31cf504239c5f1d4973c62095c00cba1ee9abb503718dac6d146a470a  ModemManager-1.18.6.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index a881edc272..d7e2c55bf8 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.16.10
+MODEM_MANAGER_VERSION = 1.18.6
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
