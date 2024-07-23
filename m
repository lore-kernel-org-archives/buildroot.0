Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB433C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 21:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44B17606BD;
	Tue, 23 Jul 2024 21:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6EdIZgUKJWbH; Tue, 23 Jul 2024 21:13:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66BB60880
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66BB60880;
	Tue, 23 Jul 2024 21:13:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4B33D1BF2F9
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F5DA40422
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 21:13:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rQkZlZYwYKHn for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 21:13:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63EE54021B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63EE54021B
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63EE54021B
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 21:13:06 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-427b4c621b9so40193765e9.1
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 14:13:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721769183; x=1722373983;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rwxm5W2koW3mtH97bdVBaSvg1i4ioU6jzT8VmRPd6wk=;
 b=CXmiWQ1YcIh1BYjFzNplCoYAsRd/ExMID90z+CpIvP9SPS5oV5yJcaFQE5gDs7MZ5J
 xKOdovibTedHSPz3YgSBObutNZD+wRD7QcwsZaLYRX75ijb6Nt0ixBxAmk/7YSY8406i
 /ZgofpOsRbRgHRnAnsz9Ut9QkPDD4f981wcpFmXKYHO0NxAoQpMxHotTJ58+aypsmYEv
 TvEyGXXHHjWfXdAr+HU3EiHCA9UrkFoDJkX/hLoMaSCgW5wp6sFAf0ivQXYUKcNkNv8C
 1ZGHKWN7CcEOp/poV6FHfhUYHoK3NQcGeyvmDRhzZp4DXrLaY0g+ACMVRDvIV1IjccF9
 YFJA==
X-Gm-Message-State: AOJu0Yxq9lpo1AmJJire1/hKSSQr62/SCHmywhCMZKHPdpRuswCP+tHc
 yjs1lAH9NSBQba2oq7MIGxjcTpFgoZ/GZ7kuXIJ84dVuMJntc0VesgUeug==
X-Google-Smtp-Source: AGHT+IGwv/dS6f7gpj/M91/z4207efj2K6WDJ//VBSsnJP9X4MNlrL5rUygrJFckymvgpim+0q0U7w==
X-Received: by 2002:a05:600c:154e:b0:426:6f48:2dad with SMTP id
 5b1f17b1804b1-427f95b73a5mr335545e9.35.1721769183197; 
 Tue, 23 Jul 2024 14:13:03 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f92c7cb3sm1806625e9.0.2024.07.23.14.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 14:13:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 23:13:00 +0200
Message-ID: <20240723211300.702319-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721769183; x=1722373983; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rwxm5W2koW3mtH97bdVBaSvg1i4ioU6jzT8VmRPd6wk=;
 b=i69TfTM1047l0QexiGwlrnEN4e52FRgUBbuEy71KtqjMPEMYanwVZo4yGecG9Dc000
 BLVwq9Jh2gS+J4xMKx524YbFX3nDRB32ZemH9VgYiUV7g0edPSGpDvU25Kez5MVRg+LF
 j1g7n8b+AoLaTYhEs1JSO467+Tgb9MJ/tHpGau3EKO+eZbFEyro+wJKBthvRYIS3QVFs
 wC0noNkc0t2PVFGZgDoPJj3p5L2hVb1oC2aIygozYhNJMans9b40vhdwk3+jAKjGp0eY
 jNpsvUaqEFOKW+cgPx3/iNQ6fg14/fzMQCr2XGnP5WF4bj9BWoCa2XqmI3ubpoROTpwm
 1AgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=i69TfTM1
Subject: [Buildroot] [PATCH 1/1] package/dvb-apps: drop package
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

As advocated by Thomas Petazzoni [1], drop dvb-apps as package is not
maintained anymore.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20240723162533.549929-1-fontaine.fabrice@gmail.com

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .checkpackageignore                           |  6 ---
 Config.in.legacy                              |  7 +++
 DEVELOPERS                                    |  1 -
 package/Config.in                             |  1 -
 .../dvb-apps/0001-Fix-generate-keynames.patch | 30 -----------
 .../0002-Fix-compiler-warning-flags.patch     | 44 ----------------
 ...0003-handle-static-shared-only-build.patch | 44 ----------------
 .../dvb-apps/0004-Makefile-remove-test.patch  | 27 ----------
 ...s-fix-build-with-kernel-headers-4.14.patch | 52 -------------------
 package/dvb-apps/0006-fix-glibc-2.31.patch    | 23 --------
 package/dvb-apps/Config.in                    | 14 -----
 package/dvb-apps/dvb-apps.hash                |  6 ---
 package/dvb-apps/dvb-apps.mk                  | 44 ----------------
 13 files changed, 7 insertions(+), 292 deletions(-)
 delete mode 100644 package/dvb-apps/0001-Fix-generate-keynames.patch
 delete mode 100644 package/dvb-apps/0002-Fix-compiler-warning-flags.patch
 delete mode 100644 package/dvb-apps/0003-handle-static-shared-only-build.patch
 delete mode 100644 package/dvb-apps/0004-Makefile-remove-test.patch
 delete mode 100644 package/dvb-apps/0005-utils-fix-build-with-kernel-headers-4.14.patch
 delete mode 100644 package/dvb-apps/0006-fix-glibc-2.31.patch
 delete mode 100644 package/dvb-apps/Config.in
 delete mode 100644 package/dvb-apps/dvb-apps.hash
 delete mode 100644 package/dvb-apps/dvb-apps.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 84d7dcb8d1..5a2d96a274 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -469,12 +469,6 @@ package/dropbear/S50dropbear Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/dt/0001-adjust-os-symlink.patch lib_patch.Upstream
 package/dt/0002-dt-default-source-define.patch lib_patch.Upstream
 package/dtc/0001-Fix-include-guards-for-older-kernel-u-boot-sources.patch lib_patch.Upstream
-package/dvb-apps/0001-Fix-generate-keynames.patch lib_patch.Upstream
-package/dvb-apps/0002-Fix-compiler-warning-flags.patch lib_patch.Upstream
-package/dvb-apps/0003-handle-static-shared-only-build.patch lib_patch.Upstream
-package/dvb-apps/0004-Makefile-remove-test.patch lib_patch.Upstream
-package/dvb-apps/0005-utils-fix-build-with-kernel-headers-4.14.patch lib_patch.Upstream
-package/dvb-apps/0006-fix-glibc-2.31.patch lib_patch.Upstream
 package/dvblast/0001-missing-lm.patch lib_patch.Upstream
 package/dvblast/0002-fix-int-types.patch lib_patch.Upstream
 package/dvbsnoop/0001-musl-types-h.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 94ac60b668..da6f24366c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_DVB_APPS
+	bool "dvb-apps package removed"
+	select BR2_LEGACY
+	help
+	  The dvb-apps package was removed as it is not maintained
+	  anymore (no commit since 2014).
+
 config BR2_PACKAGE_GAMIN
 	bool "gamin package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index a5db331904..ecde309891 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3340,7 +3340,6 @@ F:	package/dahdi-tools/
 F:	package/dbus-broker/
 F:	package/dtc/
 F:	package/dtv-scan-tables/
-F:	package/dvb-apps/
 F:	package/freerdp/
 F:	package/keyutils/
 F:	package/libbsd/
diff --git a/package/Config.in b/package/Config.in
index 1b314ca965..b5aa0bd3fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -502,7 +502,6 @@ endmenu
 	source "package/dtbocfg/Config.in"
 	source "package/dtv-scan-tables/Config.in"
 	source "package/dump1090/Config.in"
-	source "package/dvb-apps/Config.in"
 	source "package/dvbsnoop/Config.in"
 	source "package/edid-decode/Config.in"
 	source "package/edk2-non-osi/Config.in"
diff --git a/package/dvb-apps/0001-Fix-generate-keynames.patch b/package/dvb-apps/0001-Fix-generate-keynames.patch
deleted file mode 100644
index 498607d97d..0000000000
--- a/package/dvb-apps/0001-Fix-generate-keynames.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Fix generate-keynames.sh script for cross-compilation
-
-generate-keynames.sh reads /usr/include/linux to find the keyname
-symbols. However, when cross-compiling, the include path points
-somewhere else. Allow the user to pass CROSS_ROOT to point to the
-root of the cross-compilation environment.
-
-Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
----
-diff -rup dvb-apps-83c746462ccb.orig/util/av7110_loadkeys/generate-keynames.sh dvb-apps-83c746462ccb/util/av7110_loadkeys/generate-keynames.sh
---- dvb-apps-83c746462ccb.orig/util/av7110_loadkeys/generate-keynames.sh	2012-12-06 10:38:07.000000000 +0100
-+++ dvb-apps-83c746462ccb/util/av7110_loadkeys/generate-keynames.sh	2013-08-29 21:47:09.717991439 +0200
-@@ -18,7 +18,7 @@ echo "};" >> $1
- echo >> $1
- echo >> $1
- echo "static struct input_key_name key_name [] = {" >> $1
--for x in $(cat /usr/include/linux/input.h input_fake.h | \
-+for x in $(cat ${CROSS_ROOT}/usr/include/linux/input.h input_fake.h | \
-            egrep "#define[ \t]+KEY_" | grep -v KEY_MAX | \
-            cut -f 1 | cut -f 2 -d " " | sort -u) ; do
-     echo "        { \"$(echo $x | cut -b 5-)\", $x }," >> $1
-@@ -26,7 +26,7 @@ done
- echo "};" >> $1
- echo >> $1
- echo "static struct input_key_name btn_name [] = {" >> $1
--for x in $(cat /usr/include/linux/input.h input_fake.h | \
-+for x in $(cat ${CROSS_ROOT}/usr/include/linux/input.h input_fake.h | \
-            egrep "#define[ \t]+BTN_" | \
-            cut -f 1 | cut -f 2 -d " " | sort -u) ; do
-      echo "        { \"$(echo $x | cut -b 5-)\", $x }," >> $1
diff --git a/package/dvb-apps/0002-Fix-compiler-warning-flags.patch b/package/dvb-apps/0002-Fix-compiler-warning-flags.patch
deleted file mode 100644
index 9c6276beb7..0000000000
--- a/package/dvb-apps/0002-Fix-compiler-warning-flags.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9b8f1df41f7579da63c27763ff184d351e4c7fef Mon Sep 17 00:00:00 2001
-From: Simon Dawson <spdawson@gmail.com>
-Date: Sun, 4 Jan 2015 12:06:18 +0100
-Subject: [PATCH] Fix compiler warning flags
-
-  When building for bfin, the build fails as follows.
-
-  cc1: error: unrecognized command line option "-Wno-packed-bitfield-compat"
-
-An example of an autobuild failure arising from this is the following.
-
-  http://autobuild.buildroot.net/results/92e/92e472004812a3616f62d766a9ea07a997a66e89/
-  http://autobuild.buildroot.net/results/6e7/6e7b48ad9768349d983985c3067c4267cde80541/
-
-Clearly, not all toolchains provide a gcc that understands
-the -Wno-packed-bitfield-compat flag; remove usage of this flag.
-
-Wno-packed-bitfield-compat option was added in gcc 4.4.
-
-[Romain:
-  - This patch is also needed for bfin toolchains which use gcc 4.3.5
-  - Add a link to bfin build failure]
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- util/scan/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util/scan/Makefile b/util/scan/Makefile
-index d48c478..88667c5 100644
---- a/util/scan/Makefile
-+++ b/util/scan/Makefile
-@@ -14,7 +14,7 @@ inst_bin = $(binaries)
- 
- removing = atsc_psip_section.c atsc_psip_section.h
- 
--CPPFLAGS += -Wno-packed-bitfield-compat -D__KERNEL_STRICT_NAMES
-+CPPFLAGS += -D__KERNEL_STRICT_NAMES
- 
- .PHONY: all
- 
--- 
-1.9.3
-
diff --git a/package/dvb-apps/0003-handle-static-shared-only-build.patch b/package/dvb-apps/0003-handle-static-shared-only-build.patch
deleted file mode 100644
index 4dc7c68ac2..0000000000
--- a/package/dvb-apps/0003-handle-static-shared-only-build.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From a826c7c722db40bfedf00e51ce38411550ae8216 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Thu, 25 Dec 2014 19:22:16 +0100
-Subject: [PATCH] Make.rules: Handle static/shared only build
-
-Do not build .a library when enable_static is set to "no"
-Do not build .so library when enable_shared is set to "no"
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Make.rules | 10 ++++++++--
- 1 file changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/Make.rules b/Make.rules
-index 3410d7b..d274e16 100644
---- a/Make.rules
-+++ b/Make.rules
-@@ -9,7 +9,13 @@ ifneq ($(lib_name),)
- CFLAGS_LIB ?= -fPIC
- CFLAGS += $(CFLAGS_LIB)
- 
--libraries = $(lib_name).so $(lib_name).a
-+ifneq ($(enable_static),no)
-+libraries += $(lib_name).a
-+endif
-+
-+ifneq ($(enable_shared),no)
-+libraries += $(lib_name).so
-+endif
- 
- .PHONY: library
- 
-@@ -23,7 +29,7 @@ prerequisites = $(subst .o,.d,$(objects)) $(addsuffix .d,$(binaries))
- 
- .PHONY: clean install
- 
--ifeq ($(static),1)
-+ifneq ($(enable_static),no)
- LDFLAGS += -static
- endif
- 
--- 
-1.9.3
-
diff --git a/package/dvb-apps/0004-Makefile-remove-test.patch b/package/dvb-apps/0004-Makefile-remove-test.patch
deleted file mode 100644
index 45bfad914c..0000000000
--- a/package/dvb-apps/0004-Makefile-remove-test.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From c578772d6abc5fdf3ec83f632c371373e5baf9f1 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@openwide.fr>
-Date: Fri, 26 Dec 2014 01:04:58 +0100
-Subject: [PATCH] Makefile: remove test
-
-Tests needs static libraries, remove them for shared only build.
-
-Signed-off-by: Romain Naour <romain.naour@openwide.fr>
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 65a2273..105c460 100644
---- a/Makefile
-+++ b/Makefile
-@@ -10,7 +10,6 @@ DVB_API_MINOR := $(word 3, $(shell grep -m1 "DVB_API_VERSION_MINOR" $(VERSION_FI
- 
- all clean install:
- 	$(MAKE) -C lib $@
--	$(MAKE) -C test $@
- 	$(MAKE) -C util $@
- 
- update:
--- 
-1.9.3
-
diff --git a/package/dvb-apps/0005-utils-fix-build-with-kernel-headers-4.14.patch b/package/dvb-apps/0005-utils-fix-build-with-kernel-headers-4.14.patch
deleted file mode 100644
index 279cdecb77..0000000000
--- a/package/dvb-apps/0005-utils-fix-build-with-kernel-headers-4.14.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-# HG changeset patch
-# User "Yann E. MORIN" <yann.morin.1998@free.fr>
-# Date 1511772629 -3600
-#      Mon Nov 27 09:50:29 2017 +0100
-# Branch yem/fixes
-# Node ID 0848fa96c6eb13cf37249d317eff12cbd2f59ff7
-# Parent  3d43b280298c39a67d1d889e01e173f52c12da35
-utils: fix build with kernel headers >= 4.14
-
-In kernel 4.14, CA_SET_PID was removed, in commit 833ff5e7feda (media:
-ca.h: get rid of CA_SET_PID).
-
-Fix dst-util to not fail the build when this is missing.
-
-Fiuxes build failures such as:
-    http://autobuild.buildroot.org/results/708/708f11809b2cafc2a3375dc515803c87b376ed4d/build-end.log
-    http://autobuild.buildroot.org/results/e39/e3939d44376e92e8a35fb179d9890510334d8304/build-end.log
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff --git a/util/dst-utils/dst_test.c b/util/dst-utils/dst_test.c
---- a/util/dst-utils/dst_test.c
-+++ b/util/dst-utils/dst_test.c
-@@ -111,6 +111,7 @@
- 	return 0;
- }
- 
-+#if defined CA_SET_PID
- static int dst_set_pid(int cafd)
- {
- 	if ((ioctl(cafd, CA_SET_PID)) < 0) {
-@@ -120,6 +121,7 @@
- 
- 	return 0;
- }
-+#endif
- 
- static int dst_get_descr(int cafd)
- {
-@@ -230,8 +232,12 @@
- 				dst_reset(cafd);
- 				break;
- 			case 'p':
-+#if defined CA_SET_PID
- 				printf("%s: PID\n", __FUNCTION__);
- 				dst_set_pid(cafd);
-+#else
-+				printf("%s: PID not supported\n", __FUNCTION__);
-+#endif
- 				break;
- 			case 'g':
- 				printf("%s: Get Desc\n", __FUNCTION__);
diff --git a/package/dvb-apps/0006-fix-glibc-2.31.patch b/package/dvb-apps/0006-fix-glibc-2.31.patch
deleted file mode 100644
index 51c03d3e2e..0000000000
--- a/package/dvb-apps/0006-fix-glibc-2.31.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-dvbdate: fix compilation error with glibc 2.31
-
-as stime func doesn't exists anymore in newer versions of glibc >= 2.31 due
-to obseletion, a replacment with clock_settime is inorder to fix the issue.
-
-Signed-off-by: Dagg Stompler <daggs@gmx.com>
-[Fabrice: fix for gcc >= 14]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-
---- a/util/dvbdate/dvbdate.c
-+++ b/util/dvbdate/dvbdate.c
-@@ -309,7 +309,10 @@
-  */
- int set_time(time_t * new_time)
- {
--	if (stime(new_time)) {
-+	struct timespec s = {0};
-+	s.tv_sec = *new_time;
-+
-+	if (clock_settime(CLOCK_REALTIME, &s)) {
- 		perror("Unable to set time");
- 		return -1;
- 	}
diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
deleted file mode 100644
index 75cc14eb9b..0000000000
--- a/package/dvb-apps/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_DVB_APPS
-	bool "dvb-apps"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	help
-	  Install a small number of DVB test and utility programs,
-	  including szap and dvbscan.
-
-	  http://linuxtv.org/projects.php
-	  http://linuxtv.org/hg/dvb-apps
-
-comment "dvb-apps utils needs a toolchain w/ threads, headers >= 3.3"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
diff --git a/package/dvb-apps/dvb-apps.hash b/package/dvb-apps/dvb-apps.hash
deleted file mode 100644
index d394ced131..0000000000
--- a/package/dvb-apps/dvb-apps.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# Locally computed:
-sha256  926208b7e711b4bab1a909ff9bf4e6ae54acdd30a46f5d5bd700ecb088fe1f57  dvb-apps-3d43b280298c39a67d1d889e01e173f52c12da35.tar.gz
-
-# Hash for license files:
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
-sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/dvb-apps/dvb-apps.mk b/package/dvb-apps/dvb-apps.mk
deleted file mode 100644
index 161c1f8495..0000000000
--- a/package/dvb-apps/dvb-apps.mk
+++ /dev/null
@@ -1,44 +0,0 @@
-################################################################################
-#
-# dvb-apps
-#
-################################################################################
-
-DVB_APPS_VERSION = 3d43b280298c39a67d1d889e01e173f52c12da35
-DVB_APPS_SITE = http://linuxtv.org/hg/dvb-apps
-DVB_APPS_SITE_METHOD = hg
-DVB_APPS_LICENSE = GPL-2.0, GPL-2.0+, LGPL-2.1+
-DVB_APPS_LICENSE_FILES = COPYING COPYING.LGPL
-
-ifeq ($(BR2_ENABLE_LOCALE),)
-DVB_APPS_DEPENDENCIES += libiconv
-DVB_APPS_LDLIBS += -liconv
-endif
-
-DVB_APPS_MAKE_OPTS = PERL5LIB=$(@D)/util/scan
-
-ifeq ($(BR2_STATIC_LIBS),y)
-DVB_APPS_MAKE_OPTS += enable_shared=no
-else ifeq ($(BR2_SHARED_LIBS),y)
-DVB_APPS_MAKE_OPTS += enable_static=no
-endif
-
-DVB_APPS_INSTALL_STAGING = YES
-
-define DVB_APPS_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) LDLIBS="$(DVB_APPS_LDLIBS)" \
-		$(MAKE1) -C $(@D) CROSS_ROOT=$(STAGING_DIR) \
-		$(DVB_APPS_MAKE_OPTS)
-endef
-
-define DVB_APPS_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		$(DVB_APPS_MAKE_OPTS) DESTDIR=$(STAGING_DIR) install
-endef
-
-define DVB_APPS_INSTALL_TARGET_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		$(DVB_APPS_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
