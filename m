Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7ABC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Dec 2021 21:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE40660C2B;
	Sat, 25 Dec 2021 21:45:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nciT7B3LVk1b; Sat, 25 Dec 2021 21:45:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9D3A60C2E;
	Sat, 25 Dec 2021 21:45:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D6C11BF2EB
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 21:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99C4260C2E
 for <buildroot@lists.busybox.net>; Sat, 25 Dec 2021 21:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHqDgwqLLpus for <buildroot@lists.busybox.net>;
 Sat, 25 Dec 2021 21:45:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BACD60C2B
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 21:45:39 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id l3so12328438iol.10
 for <buildroot@buildroot.org>; Sat, 25 Dec 2021 13:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7qM8PhxH7sYAi9OH5rCCT4C7LLqKvO8Zl/ToqCfk7KA=;
 b=njnNtroaGHmsjyXssLw+NA6CDXQSaRCUKsfEFUTyZoOu+YJxeMXNSyDPsK5bRwkO7Q
 2urlXg1X8ywzPTP1YeE3rQP+EY+ZKMv1f7ja1YGAnS6m8yun/upSvelz8xEg99TOhqfw
 gxp5Qnx41/AeC5KUcG99+wwzKVxfi4Phd6b7xB2zUP/bE/BBGZGaKRNN76DJH69L6Ol/
 EfDVyBpbjOrExQcc07If3BUTaUAhgHAFdt1Yqh05Ez7cUdhvc/Uz15YdpQRfGwhe7Ts6
 1/8CymRtThHm41f/Jioe07JrGBhOVjyjoW2weIKWXnnprbWYEFJ3DOkhThXgTM0oef7b
 mzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7qM8PhxH7sYAi9OH5rCCT4C7LLqKvO8Zl/ToqCfk7KA=;
 b=7vuG/XAHRRgSGC8pEphWCVr3uvPmKvGSrc/CkgTLwY6WCq+kvYYAYaWF0hMpFFYxS3
 Ob6Z/TJHSFsm/OTeD1TV/eWYy4OShEZpKulH2saSXHFjb1vyxsIoOta3W72WKSGqKCu2
 gtDXwJCSungpQ22oaxRlI6SCuXRvlY6DrXrPpLQgucj1ymG4pXigOvWXBKa62VdVV/pM
 28hB+62K4W/oBFopvFO2H1I3n5g+eM5v1uGWSQbQ8jxQJY1Rn20y2D/pu1fLsIx0iNZJ
 dXNfc50pLL4qfV54//IjxjbIsuy2pSm1w9dODjns+/0S5WUm9Nk8GCPAqOZ0x3MOT+Jm
 DeKA==
X-Gm-Message-State: AOAM5320Q0aTp1tgPzIJzu/KPRqkgNDY/iJ+nSIigsGLifWbLcIKsoT4
 JrgUeactYpnLVK1eMHGjVb1TXwb/WCrrtg==
X-Google-Smtp-Source: ABdhPJwN2GerjHAH0Kg0vte9j7Bf7fk1XSNJA5nBUAR17Dw8Iit+6mswFyA2QD2gFi2yqgxNmJm+cg==
X-Received: by 2002:a05:6638:1307:: with SMTP id
 r7mr4889101jad.317.1640468738184; 
 Sat, 25 Dec 2021 13:45:38 -0800 (PST)
Received: from james-x399.localdomain (71-218-252-115.hlrn.qwest.net.
 [71.218.252.115])
 by smtp.gmail.com with ESMTPSA id q17sm6363140ilm.32.2021.12.25.13.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 13:45:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Dec 2021 14:45:33 -0700
Message-Id: <20211225214533.1509713-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211225214533.1509713-1-james.hilliard1@gmail.com>
References: <20211225214533.1509713-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/systemd: bump to version 250
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
 Norbert Lange <nolange79@gmail.com>, Martin Hicks <mort@bork.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop disable urlify patch that is now upstream.

Backport missing-syscall: define all MOUNT_ATTR_* if missing patch.

Update license info based on LICENSES/README.md.

Most licenses are moved to SPDX LICENSES folder.

Add libcryptsetup-plugins support.

The efi-ld option expects either "bfd" or "gold", since we don't
support "gold" set it to "bfd" which is also the default fallback.

Set link-boot-shared to true since we build systemd at the same time
as the boot tools.

See link-boot-shared details:
https://github.com/systemd/systemd/commit/7964702007ae1ae1180dc9ff12f97a9b7651c8ab

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add define all MOUNT_ATTR_* if missing patch
---
 ...1-Add-meson-option-to-disable-urlify.patch | 67 ---------------
 ...ll-define-all-MOUNT_ATTR_-if-missing.patch | 84 +++++++++++++++++++
 package/systemd/systemd.hash                  | 14 +++-
 package/systemd/systemd.mk                    | 34 ++++++--
 4 files changed, 123 insertions(+), 76 deletions(-)
 delete mode 100644 package/systemd/0001-Add-meson-option-to-disable-urlify.patch
 create mode 100644 package/systemd/0001-missing-syscall-define-all-MOUNT_ATTR_-if-missing.patch

diff --git a/package/systemd/0001-Add-meson-option-to-disable-urlify.patch b/package/systemd/0001-Add-meson-option-to-disable-urlify.patch
deleted file mode 100644
index b0a59a9f0f..0000000000
--- a/package/systemd/0001-Add-meson-option-to-disable-urlify.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From e5d86ebed5624ef62342c820a5868b1075deb300 Mon Sep 17 00:00:00 2001
-From: James Hilliard <james.hilliard1@gmail.com>
-Date: Sun, 11 Jul 2021 04:39:33 -0600
-Subject: [PATCH] Add meson option to disable urlify.
-
-Useful for systems that don't use a version of less with hyperlink
-support.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-e5d86ebed5624ef62342c820a5868b1075deb300]
----
- meson.build               | 1 +
- meson_options.txt         | 2 ++
- src/shared/pretty-print.c | 4 ++++
- 3 files changed, 7 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index 5735cfc7ad..a2ee15bf32 100644
---- a/meson.build
-+++ b/meson.build
-@@ -278,6 +278,7 @@ conf.set_quoted('USER_PRESET_DIR',                            userpresetdir)
- conf.set_quoted('VENDOR_KEYRING_PATH',                        join_paths(rootlibexecdir, 'import-pubring.gpg'))
- 
- conf.set('ANSI_OK_COLOR',                                     'ANSI_' + get_option('ok-color').underscorify().to_upper())
-+conf.set10('ENABLE_URLIFY',                                   get_option('urlify'))
- conf.set10('ENABLE_FEXECVE',                                  get_option('fexecve'))
- conf.set10('MEMORY_ACCOUNTING_DEFAULT',                       memory_accounting_default)
- conf.set('STATUS_UNIT_FORMAT_DEFAULT',                        'STATUS_UNIT_FORMAT_' + status_unit_format_default.to_upper())
-diff --git a/meson_options.txt b/meson_options.txt
-index 163c8df87d..b60261ac24 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -444,6 +444,8 @@ option('ok-color', type : 'combo',
-                   'highlight-cyan', 'highlight-white'],
-        value : 'green',
-        description: 'color of the "OK" status message')
-+option('urlify', type : 'boolean', value : 'true',
-+       description : 'enable pager Hyperlink ANSI sequence support')
- option('fexecve', type : 'boolean', value : 'false',
-        description : 'use fexecve() to spawn children')
- 
-diff --git a/src/shared/pretty-print.c b/src/shared/pretty-print.c
-index 137ba77b3a..7983c0a33a 100644
---- a/src/shared/pretty-print.c
-+++ b/src/shared/pretty-print.c
-@@ -19,6 +19,7 @@
- #include "util.h"
- 
- bool urlify_enabled(void) {
-+#if ENABLE_URLIFY
-         static int cached_urlify_enabled = -1;
- 
-         if (cached_urlify_enabled < 0) {
-@@ -32,6 +33,9 @@ bool urlify_enabled(void) {
-         }
- 
-         return cached_urlify_enabled;
-+#else
-+        return 0;
-+#endif
- }
- 
- int terminal_urlify(const char *url, const char *text, char **ret) {
--- 
-2.25.1
-
diff --git a/package/systemd/0001-missing-syscall-define-all-MOUNT_ATTR_-if-missing.patch b/package/systemd/0001-missing-syscall-define-all-MOUNT_ATTR_-if-missing.patch
new file mode 100644
index 0000000000..d0c4f6eaa0
--- /dev/null
+++ b/package/systemd/0001-missing-syscall-define-all-MOUNT_ATTR_-if-missing.patch
@@ -0,0 +1,84 @@
+From 0764e3a327573e7bda2f0e1a914f28482ab00574 Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Fri, 24 Dec 2021 09:15:51 +0900
+Subject: [PATCH] missing-syscall: define all MOUNT_ATTR_* if missing
+
+Fixes #21876.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+0764e3a327573e7bda2f0e1a914f28482ab00574]
+---
+ src/basic/missing_syscall.h | 48 ++++++++++++++++++++++++++++++++-----
+ 1 file changed, 42 insertions(+), 6 deletions(-)
+
+diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
+index 3da30e6f0e..0b0cc3cec2 100644
+--- a/src/basic/missing_syscall.h
++++ b/src/basic/missing_syscall.h
+@@ -462,20 +462,56 @@ struct mount_attr {
+ struct mount_attr;
+ #endif
+ 
++#ifndef MOUNT_ATTR_RDONLY
++#define MOUNT_ATTR_RDONLY       0x00000001 /* Mount read-only */
++#endif
++
++#ifndef MOUNT_ATTR_NOSUID
++#define MOUNT_ATTR_NOSUID       0x00000002 /* Ignore suid and sgid bits */
++#endif
++
++#ifndef MOUNT_ATTR_NODEV
++#define MOUNT_ATTR_NODEV        0x00000004 /* Disallow access to device special files */
++#endif
++
++#ifndef MOUNT_ATTR_NOEXEC
++#define MOUNT_ATTR_NOEXEC       0x00000008 /* Disallow program execution */
++#endif
++
++#ifndef MOUNT_ATTR__ATIME
++#define MOUNT_ATTR__ATIME       0x00000070 /* Setting on how atime should be updated */
++#endif
++
++#ifndef MOUNT_ATTR_RELATIME
++#define MOUNT_ATTR_RELATIME     0x00000000 /* - Update atime relative to mtime/ctime. */
++#endif
++
++#ifndef MOUNT_ATTR_NOATIME
++#define MOUNT_ATTR_NOATIME      0x00000010 /* - Do not update access times. */
++#endif
++
++#ifndef MOUNT_ATTR_STRICTATIME
++#define MOUNT_ATTR_STRICTATIME  0x00000020 /* - Always perform atime updates */
++#endif
++
++#ifndef MOUNT_ATTR_NODIRATIME
++#define MOUNT_ATTR_NODIRATIME   0x00000080 /* Do not update directory access times */
++#endif
++
+ #ifndef MOUNT_ATTR_IDMAP
+-#define MOUNT_ATTR_IDMAP 0x00100000
++#define MOUNT_ATTR_IDMAP        0x00100000 /* Idmap mount to @userns_fd in struct mount_attr. */
+ #endif
+ 
+ #ifndef MOUNT_ATTR_NOSYMFOLLOW
+-#define MOUNT_ATTR_NOSYMFOLLOW 0x00200000
++#define MOUNT_ATTR_NOSYMFOLLOW  0x00200000 /* Do not follow symlinks */
+ #endif
+ 
+-#ifndef AT_RECURSIVE
+-#define AT_RECURSIVE 0x8000
++#ifndef MOUNT_ATTR_SIZE_VER0
++#define MOUNT_ATTR_SIZE_VER0    32 /* sizeof first published struct */
+ #endif
+ 
+-#ifndef MOUNT_ATTR_SIZE_VER0
+-#define MOUNT_ATTR_SIZE_VER0 32
++#ifndef AT_RECURSIVE
++#define AT_RECURSIVE 0x8000
+ #endif
+ 
+ static inline int missing_mount_setattr(
+-- 
+2.25.1
+
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index a83ff7d989..cc33cd4c52 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,6 +1,14 @@
 # sha256 locally computed
-sha256  773ee546ad6df0921ea6f9e12294eb102bf68c1ac9eb3dcaca1764f8306d6e13  systemd-249.5.tar.gz
+sha256  41317fb443f7555de427aea69fda36c74661e77b58203cd6587eb8e1f612f46b  systemd-250.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
-sha256  f5645b4b846479859d6618fa7a5a1722681aa7fc43c1e45f8bf8e1fe5738d618  README
-sha256  83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  tools/chromiumos/LICENSE
+sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
+sha256  83bb6bd9ccd2cf5230cb1807ed16258289768dc4d9cb80069a814e04415a1275  LICENSES/BSD-3-Clause.txt
+sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
+sha256  61778e80a2fd85955b626b29aa2bcf06144c714277bded65633e4a81479d9fb3  LICENSES/LGPL-2.0-or-later.txt
+sha256  5bcef4fedbfc08776630e65d5d0d074dd31208037eddb167ca46a9ec4f737764  LICENSES/Linux-syscall-note.txt
+sha256  790ac93fb2859097bdda4cf08b5a4feb5e479d0cb2c74f403248241bc3e7c216  LICENSES/lookup3-public-domain.txt
+sha256  b85dcd3e453d05982552c52b5fc9e0bdd6d23c6f8e844b984a88af32570b0cc0  LICENSES/MIT.txt
+sha256  2a98749f6bec00dfaed86fa9c1edea871aaae4f11ee4d100b671aaf4ce353a73  LICENSES/murmurhash2-public-domain.txt
+sha256  1a7adaa2c86cedfd6c7f5c0c7c72fd6d3e02cd0c9593f21fdb53c89bb2b130ec  LICENSES/OFL-1.1.txt
+sha256  11801e931f252252a16eac8299465510d0a82c36bfd9ac8aea9b202b76d2f82b  LICENSES/README.md
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 619c2b48c9..3b0356ac9a 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,10 +4,31 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 249.5
+SYSTEMD_VERSION = 250
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
-SYSTEMD_LICENSE = LGPL-2.1+, GPL-2.0+ (udev), Public Domain (few source files, see README), BSD-3-Clause (tools/chromiumos)
-SYSTEMD_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1 README tools/chromiumos/LICENSE
+SYSTEMD_LICENSE = \
+	LGPL-2.1+, \
+	GPL-2.0+ (udev), \
+	Public Domain (few source files, see LICENSES/README.md), \
+	BSD-2-Clause (eBPF instruction mini library), \
+	BSD-3-Clause (tools/chromiumos), \
+	CC0-1.0 (few source files, see LICENSES/README.md), \
+	GPL-2.0 with Linux-syscall-note (linux kernel headers), \
+	MIT (few source files, see LICENSES/README.md), \
+	OFL-1.1 (Heebo fonts)
+SYSTEMD_LICENSE_FILES = \
+	LICENSE.GPL2 \
+	LICENSE.LGPL2.1 \
+	LICENSES/BSD-2-Clause.txt \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/CC0-1.0.txt \
+	LICENSES/LGPL-2.0-or-later.txt \
+	LICENSES/Linux-syscall-note.txt \
+	LICENSES/lookup3-public-domain.txt \
+	LICENSES/MIT.txt \
+	LICENSES/murmurhash2-public-domain.txt \
+	LICENSES/OFL-1.1.txt \
+	LICENSES/README.md
 SYSTEMD_CPE_ID_VENDOR = freedesktop
 SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
@@ -31,6 +52,7 @@ SYSTEMD_CONF_OPTS += \
 	-Dkexec-path=/usr/sbin/kexec \
 	-Dkmod-path=/usr/bin/kmod \
 	-Dldconfig=false \
+	-Dlink-boot-shared=true \
 	-Dloadkeys-path=/usr/bin/loadkeys \
 	-Dman=false \
 	-Dmount-path=/usr/bin/mount \
@@ -81,9 +103,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_CRYPTSETUP),y)
 SYSTEMD_DEPENDENCIES += cryptsetup
-SYSTEMD_CONF_OPTS += -Dlibcryptsetup=true
+SYSTEMD_CONF_OPTS += -Dlibcryptsetup=true -Dlibcryptsetup-plugins=true
 else
-SYSTEMD_CONF_OPTS += -Dlibcryptsetup=false
+SYSTEMD_CONF_OPTS += -Dlibcryptsetup=false -Dlibcryptsetup-plugins=false
 endif
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
@@ -505,7 +527,7 @@ SYSTEMD_CONF_OPTS += \
 	-Defi=true \
 	-Dgnu-efi=true \
 	-Defi-cc=$(TARGET_CC) \
-	-Defi-ld=$(TARGET_LD) \
+	-Defi-ld=bfd \
 	-Defi-libdir=$(STAGING_DIR)/usr/lib \
 	-Defi-includedir=$(STAGING_DIR)/usr/include/efi
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
