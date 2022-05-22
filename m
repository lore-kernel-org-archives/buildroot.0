Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF875C433F5
	for <buildroot@archiver.kernel.org>; Sun, 22 May 2022 01:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 588114048F;
	Sun, 22 May 2022 01:17:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLebevI-Ps_t; Sun, 22 May 2022 01:17:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1331E402DC;
	Sun, 22 May 2022 01:17:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ECC511BF3BE
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 01:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA50E418AE
 for <buildroot@lists.busybox.net>; Sun, 22 May 2022 01:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvIzO40CeqDo for <buildroot@lists.busybox.net>;
 Sun, 22 May 2022 01:17:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6E6A41823
 for <buildroot@buildroot.org>; Sun, 22 May 2022 01:17:32 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id e194so12139648iof.11
 for <buildroot@buildroot.org>; Sat, 21 May 2022 18:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yIoY6S5nWEuytKRT6wo6s00J+sYOql2cbcBClUJSe5Y=;
 b=JV2u8p+C7QNy//IiMOJfGoWpjPsCOkgLGi2VtIW1ktBPrid7YRgg47uLYo1CrdUauc
 lct9RSfkSN7GI1Z6SRSvfB6BGblsHagF/SvEXPg959vYAAxBvMju+4LC68cVo3ZehWi4
 OlVQxvS9/9tUPQoyOioSfIf+AwNr8gImnDbohEZkcjrxRoFITxDEmi4rdJf/l83Dkdsv
 nJ+aI/qKcefR1f0YNdcvHr26QR2sAa4FhrazQir9OK4bKERb6pCUivtNP7f9Y6EyQJzb
 Z82oLEryhrx5okrgnPCDOPjR4Ou/yiMqrDnEdOtFkLe8EI8u/RR6vCDgQvg3uTEAgSW/
 KGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yIoY6S5nWEuytKRT6wo6s00J+sYOql2cbcBClUJSe5Y=;
 b=wmsE8/Gi3tUbrjScC4c/IM7Ra0q77y/IppeC/WRfanGEmYqR6OP3Y/CkJS7GjaTqLh
 N5d3IbIBddC05eY1FMw57pLPBbAie9He5nVaPJnjcK9ZzZf2VlRvsmqwwGNZcvCIt3BO
 p8l3tLmb4UOPyjcaVf614KTKGqvU3ApGY3DamO2wy6AXU96UvKn/raD/bTpuEqb1int2
 z2qEmGDrEhSWonRp68Y8LpR3ajJh/ljVtTsMRZbg9kvXw0ZxgbXkTxOWHeHL8whZKOkZ
 eA7wNKbmE0gpR1NbZ7yhnHtWhgMPcGKexwDy/Gi0nJpNjSy2TkzZIklo55+qnaYstbDY
 HdEw==
X-Gm-Message-State: AOAM531JR+1TW+Meh6bxinlY52pwWzKnxEY1tFJW5w9jPdUdZbN+SxaA
 Ja5juIi8oGuime1gzGQnReddyifGbQM=
X-Google-Smtp-Source: ABdhPJwIZ3bQCH6xoCtzUPWuhW9ayT5ovPJ1qeizLUCOYOlwA9v1ENR9LmF7TQhA2CKh8/w3XiE5xg==
X-Received: by 2002:a5d:9d06:0:b0:65e:5162:475b with SMTP id
 j6-20020a5d9d06000000b0065e5162475bmr5158094ioj.149.1653182251458; 
 Sat, 21 May 2022 18:17:31 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 o21-20020a05660213d500b0065a47e16f61sm2554817iov.51.2022.05.21.18.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 18:17:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 19:17:29 -0600
Message-Id: <20220522011729.117324-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 251
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch that is now upstream.

Readme hash changed due to config files being licensed CC0:
https://github.com/systemd/systemd/commit/418e1f2892290bbbf58cd8ceb87ab6a07f32fe3e

Minimum header version bumped to 4.15.

Add support for new sysupdate feature.

Set -Ddbus=false to ensure dbus dependency is runtime only.

Set -Ddbus-interfaces-dir=no as interface XML file generation is
not supported when cross compiling.

Set the default-user-shell to /bin/sh instead of default /bin/bash.

Set -Ddefault-dnssec=allow-downgrade if openssl is available as both
openssl and gcrypt are now supported for dnssec.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 -------------------
 package/systemd/Config.in                     | 14 +++++++-
 package/systemd/systemd.hash                  |  4 +--
 package/systemd/systemd.mk                    | 26 ++++++++++++---
 system/Config.in                              |  6 ++--
 5 files changed, 40 insertions(+), 43 deletions(-)
 delete mode 100644 package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch

diff --git a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
deleted file mode 100644
index 0934886acb..0000000000
--- a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 16c132a6a0389e0eaea70c4ad95dbfd1637ec5ba Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Fri, 7 Jan 2022 22:25:23 +0100
-Subject: [PATCH] missing-syscall: define MOVE_MOUNT_T_EMPTY_PATH if missing
-
-MOVE_MOUNT_T_EMPTY_PATH has been added to systemd 250 by [1]
-but it's defined in kernel headers since version 5.2.
-
-[1] c7bf079bbc19e3b409acc0c7acc3e14749211fe2
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/basic/missing_syscall.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 8267b1a90c..793d111c55 100644
---- a/src/basic/missing_syscall.h
-+++ b/src/basic/missing_syscall.h
-@@ -569,6 +569,10 @@ static inline int missing_open_tree(
- #define MOVE_MOUNT_F_EMPTY_PATH 0x00000004 /* Empty from path permitted */
- #endif
- 
-+#ifndef MOVE_MOUNT_T_EMPTY_PATH
-+#define MOVE_MOUNT_T_EMPTY_PATH 0x00000040 /* Empty to path permitted */
-+#endif
-+
- static inline int missing_move_mount(
-                 int from_dfd,
-                 const char *from_pathname,
--- 
-2.31.1
-
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index d5d88404de..3309c87aaf 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
@@ -475,6 +475,18 @@ config BR2_PACKAGE_SYSTEMD_SYSEXT
 
 	  https://www.freedesktop.org/software/systemd/man/systemd-sysext.html
 
+config BR2_PACKAGE_SYSTEMD_SYSUPDATE
+	bool "enable sysupdate support"
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
+	select BR2_PACKAGE_UTIL_LINUX_LIBFDISK
+	help
+	  systemd-sysupdate atomically updates the host OS, container
+	  images, portable service images or other sources, based on
+	  the transfer configuration files described in sysupdate.d(5).
+
+	  https://www.freedesktop.org/software/systemd/man/systemd-sysupdate.html
+
 config BR2_PACKAGE_SYSTEMD_SYSUSERS
 	bool "enable sysusers support"
 	help
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 3572b25965..20497e3032 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
+sha256  d1e45d7f10bd799696ea27a2d6a51d3a68ff5b6b3cea3ff76326740ffae384e5  systemd-251.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
@@ -11,4 +11,4 @@ sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENS
 sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
 sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
 sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
-sha256  11801e931f252252a16eac8299465510d0a82c36bfd9ac8aea9b202b76d2f82b  LICENSES/README.md
+sha256  177ff657698bc940f9888b7f69e5d734b0933c2859ea264fde8de1700cec40dd  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b309507e12..a496dd2bc7 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 250.4
+SYSTEMD_VERSION = 251
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
@@ -70,6 +70,8 @@ SYSTEMD_CONF_OPTS += \
 	-Dlink-boot-shared=true \
 	-Dloadkeys-path=/usr/bin/loadkeys \
 	-Dman=false \
+	-Ddbus-interfaces-dir=no \
+	-Ddbus=false \
 	-Dmount-path=/usr/bin/mount \
 	-Dmode=release \
 	-Dnss-systemd=true \
@@ -80,6 +82,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dsplit-bin=true \
 	-Dsplit-usr=false \
 	-Dsulogin-path=/usr/sbin/sulogin \
+	-Ddefault-user-shell=/bin/sh \
 	-Dsystem-gid-max=999 \
 	-Dsystem-uid-max=999 \
 	-Dsysvinit-path= \
@@ -232,9 +235,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 SYSTEMD_DEPENDENCIES += libgcrypt
-SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade -Dgcrypt=true
+SYSTEMD_CONF_OPTS += -Dgcrypt=true
 else
-SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no -Dgcrypt=false
+SYSTEMD_CONF_OPTS += -Dgcrypt=false
 endif
 
 ifeq ($(BR2_PACKAGE_P11_KIT),y)
@@ -431,6 +434,13 @@ else
 SYSTEMD_CONF_OPTS += -Duserdb=false
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD_SYSUPDATE),y)
+SYSTEMD_CONF_OPTS += -Dsysupdate=true
+SYSTEMD_DEPENDENCIES += openssl
+else
+SYSTEMD_CONF_OPTS += -Dsysupdate=false
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD_COREDUMP),y)
 SYSTEMD_CONF_OPTS += -Dcoredump=true
 SYSTEMD_COREDUMP_USER = systemd-coredump -1 systemd-coredump -1 * - - - systemd core dump processing
@@ -498,6 +508,12 @@ else
 SYSTEMD_CONF_OPTS += -Dnss-resolve=false -Dresolve=false
 endif
 
+ifneq ($(BR2_PACKAGE_LIBGCRYPT)$(BR2_PACKAGE_LIBOPENSSL),)
+SYSTEMD_CONF_OPTS += -Ddefault-dnssec=allow-downgrade
+else
+SYSTEMD_CONF_OPTS += -Ddefault-dnssec=no
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 SYSTEMD_CONF_OPTS += \
 	-Dgnutls=false \
@@ -546,7 +562,6 @@ SYSTEMD_DEPENDENCIES += gnu-efi
 SYSTEMD_CONF_OPTS += \
 	-Defi=true \
 	-Dgnu-efi=true \
-	-Defi-cc=$(TARGET_CC) \
 	-Defi-ld=bfd \
 	-Defi-libdir=$(STAGING_DIR)/usr/lib \
 	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
@@ -789,6 +804,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dbinfmt=false \
 	-Drepart=false \
 	-Dcoredump=false \
+	-Dsysupdate=false \
 	-Dpstore=false \
 	-Doomd=false \
 	-Dlogind=false \
@@ -820,6 +836,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Drfkill=false \
 	-Dman=false \
 	-Dhtml=false \
+	-Ddbus-interfaces-dir=no \
 	-Dsmack=false \
 	-Dpolkit=false \
 	-Dblkid=false \
@@ -831,6 +848,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dima=false \
 	-Dtests=false \
 	-Dglib=false \
+	-Ddbus=false \
 	-Dacl=false \
 	-Dsysvinit-path='' \
 	-Dinitrd=false \
diff --git a/system/Config.in b/system/Config.in
index 888c24ce81..e2b5eab977 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -125,19 +125,19 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_13
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5
 	select BR2_ROOTFS_MERGED_USR
 	select BR2_PACKAGE_SYSTEMD
 	select BR2_PACKAGE_SKELETON_INIT_SYSTEMD if BR2_ROOTFS_SKELETON_DEFAULT
 
-comment "systemd needs a glibc toolchain w/ SSP, headers >= 3.10, host and target gcc >= 5"
+comment "systemd needs a glibc toolchain w/ SSP, headers >= 4.15, host and target gcc >= 5"
 	depends on BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_TOOLCHAIN_HAS_SSP || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_HOST_GCC_AT_LEAST_5
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
