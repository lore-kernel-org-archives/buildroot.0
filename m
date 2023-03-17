Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BB5C7618E
	for <buildroot@archiver.kernel.org>; Fri, 17 Mar 2023 14:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8E3561AE4;
	Fri, 17 Mar 2023 14:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8E3561AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SFb0iDuuvHkF; Fri, 17 Mar 2023 14:50:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D242861ADB;
	Fri, 17 Mar 2023 14:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D242861ADB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2321BF2BE
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 14:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E347C82143
 for <buildroot@lists.busybox.net>; Fri, 17 Mar 2023 14:50:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E347C82143
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NXBClEkxNqib for <buildroot@lists.busybox.net>;
 Fri, 17 Mar 2023 14:50:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD1D08213E
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD1D08213E
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 14:50:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 p13-20020a05600c358d00b003ed346d4522so3516644wmq.2
 for <buildroot@buildroot.org>; Fri, 17 Mar 2023 07:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679064604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OFxxUiaX8dxtwmwGF82J7veQIlDOu3dZePtHvy8H+uU=;
 b=BLbK6epSyMY7AnRZt9Xf+IZrrGQdVihuHmOF5aUiPdiin0RCc2IPb4MHRntACq9QOj
 mm7e90Hi++b4Ub8ihsPxRBUZ5O47Nm8/vBubGbNu4c/DUlcaXJJ7XpzLuFjqzacv+Wqw
 qMkLA+mDxait5SRXLqlPSz/SuaHhdRdipYTqIQ+kQ8/KVKwVNuq541cQNo4cKPlHrqHx
 BXyYXqwEYMSWQ4HhH9rwitw0FOfOafT7N4Xx6X0xEz2m1Vf4Hzdj2YGCxqYVQsBuAavf
 PaIn3BTp10D0y6RD2nPLKR2DKrWMubkfx0gsODCDhr/58MeXmkYDXK0rn6wiyQPrCI52
 wdhw==
X-Gm-Message-State: AO0yUKVIBMMIxrfjlKc2CMw6dPR5TDionCuS4jbNvt5WbWb1Iw73lHo/
 uL4ctJPcIawAgXcV5KQggfsqYh0IGiPSpXmmYPM=
X-Google-Smtp-Source: AK7set+nYOm4or3prhpk4w/gXcLjIsO+Oc4L7hivzu8bDRnSSOIfsCgitTvaOKCkr8D2BS11/YrpFg==
X-Received: by 2002:a05:600c:a4c:b0:3ea:d611:e1 with SMTP id
 c12-20020a05600c0a4c00b003ead61100e1mr25717170wmq.21.1679064604511; 
 Fri, 17 Mar 2023 07:50:04 -0700 (PDT)
Received: from P-NAN-LIMA.lan ([2001:861:5384:6b50:536:f783:8f4c:a6f1])
 by smtp.gmail.com with ESMTPSA id
 t25-20020a1c7719000000b003ecc64edf7esm2193659wmi.39.2023.03.17.07.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Mar 2023 07:50:04 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Fri, 17 Mar 2023 15:49:58 +0100
Message-Id: <20230317144959.1237604-1-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1679064604;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OFxxUiaX8dxtwmwGF82J7veQIlDOu3dZePtHvy8H+uU=;
 b=ywMOqw8kpYK7zvQW/Pppq6APgA2HKO3sL+dkVBr33niCxmE83q4eqLqDrtw5I4bE2f
 rHSmmtAAN6ax7JkylAh9XAijvAW2E72rsUiAkLtGdHfvKFDSU8ES0ok492JoQMXUKQln
 69AMFTdKgnOUfFhVGopc/ifMEKZfWe+xQDag6W0Wtv32v5DT4o0if7RiTYXnl8C8Uy7+
 9jkG0maGEBuLn+AzSvSelS5ha8fqTSGqTeHDQn+1+wKVAarw7d4U4xGKzjUdciuge/cf
 tVn62nJiCcKpbMUPgSBM2YENtcdjv+h5l/dXpRXLSnMdtSRvn1w1+K+MC+0M77Or/vC2
 Olfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ywMOqw8k
Subject: [Buildroot] [PATCH v2 1/2] package/uutils-coreutils: new package
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: multipart/mixed; boundary="===============9164783725549107481=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9164783725549107481==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

This package is an implementation of coreutils written completely in rust.

Using the gnu-coreutils-testsuite on this implementation of coreutils on
the target is sadly pretty difficult since it is very memory and
computation intensive.
In order to compare the two implementations I wrote a shell script that
just extracted the command line options of every command that is also
provided by the coreutils package.

These commands are the following: base64,
cat, chgrp, chmod, chown, cp, date, dd, df, dir, echo, false, join, kill,
link, ln, ls, mkdir, mknod, mktemp, mv, nice, printenv, pwd, rm, rmdir,
sleep, stty, sync, touch, true, uname, vdir

The changes I noticed were that the command "stty" is missing from this
implementation of coreutils. Furthermore I noticed the following
missing/changed arguments:

chmod   -> --silent becomes --quiet
cp      -> -Z option missing
date    -> --utc becomes --universal
dir     -> -D, --dired, --hyperlink missing
ln      -> -d, -F, --directory missing
ls      -> -D, --dired, --hyperlink, --indicator missing
mkdir   -> -Z, --context missing
mknod   -> -Z, --context missing
mv      -> -Z, --context missing
vdir    -> -D, --dired, --hyperlink, --indicator missing
uname   -> -i, --hardware-platform, -p, --processor missing

In this list I didn't include arguments that were newly added since they
wouldn't introduce breaking. I can not make any claim about the exact
behaviour of each of the commands with their respective arguments. The
maintainers of the project provide a page in their documentation,
detailling the compatibility with the gnu-coreutils-testsuite:
https://uutils.github.io/user/test_coverage.html

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
The installation (creating the symlinks pointing to the main binary) is done
using the project's Makefile. A patch was added to remove the build dependency
of the install step in said Makefile. Since install is always called after
build, this avoids the install step rebuilding the application.

The optional dependency in package/busybox/busybox.mk is necessary so that
when uutils-coreutils is selected, it will be built before busybox. Then
busybox will see the symlinks that are already placed in target/bin and will
not recreate them (noclobber).

v2:
- created dependency between coreutils and uutils-coreutils so one can't
- be activated at the same time as the other
- Fixed my name
- Added a patch that removes the generation of autocompletions for some
  shells
- using cargo infrastructure for building now. Installing is still done
  using the project's Makefile
- implemented release and debug profiles depending on what is chosen for
  BR2_DEBUG_ENABLE

Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 DEVELOPERS                                    |  3 ++
 package/Config.in                             |  1 +
 package/busybox/busybox.mk                    |  1 +
 package/coreutils/Config.in                   |  1 +
 ...ve-dependency-on-build-during-instal.patch | 29 +++++++++++++++++
 package/uutils-coreutils/Config.in            | 12 +++++++
 .../uutils-coreutils/uutils-coreutils.hash    |  3 ++
 package/uutils-coreutils/uutils-coreutils.mk  | 31 +++++++++++++++++++
 8 files changed, 81 insertions(+)
 create mode 100644 package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
 create mode 100644 package/uutils-coreutils/Config.in
 create mode 100644 package/uutils-coreutils/uutils-coreutils.hash
 create mode 100644 package/uutils-coreutils/uutils-coreutils.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b6d288c54f..2d23667953 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2583,6 +2583,9 @@ F:	support/misc/toolchainfile.cmake.in
 N:	Sam Voss <sam.voss@gmail.com>
 F:	package/ripgrep/
 
+N:	Sebastian Weyer <sebastian.weyer@smile.fr>
+F:	package/uutils-coreutils
+
 N:	Sébastien Szymanski <sebastien.szymanski@armadeus.com>
 F:	package/mmc-utils/
 F:	package/python-flask-jsonrpc/
diff --git a/package/Config.in b/package/Config.in
index 0f8dab3e71..79bbe0b44d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2725,6 +2725,7 @@ menu "System tools"
 	source "package/tpm2-totp/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
+	source "package/uutils-coreutils/Config.in"
 	source "package/watchdog/Config.in"
 	source "package/watchdogd/Config.in"
 	source "package/xdg-dbus-proxy/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1633ca525d..d8000ddbb4 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -68,6 +68,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_UNZIP),unzip) \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
+	$(if $(BR2_PACKAGE_UUTILS_COREUTILS),uutils-coreutils) \
 	$(if $(BR2_PACKAGE_VIM),vim) \
 	$(if $(BR2_PACKAGE_WATCHDOG),watchdog) \
 	$(if $(BR2_PACKAGE_WGET),wget) \
diff --git a/package/coreutils/Config.in b/package/coreutils/Config.in
index 705013bae0..9c1af1dc25 100644
--- a/package/coreutils/Config.in
+++ b/package/coreutils/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_COREUTILS
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_PACKAGE_UUTILS_COREUTILS
 	help
 	  All of the basic file/text/shell utilities. These are the
 	  core utilities which are expected to exist on every system.
diff --git a/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch b/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
new file mode 100644
index 0000000000..69bea4d0af
--- /dev/null
+++ b/package/uutils-coreutils/0001-GNUMakefile-remove-dependency-on-build-during-instal.patch
@@ -0,0 +1,29 @@
+From f65efa6db08e8118e40ea568ab8c6dc099b53894 Mon Sep 17 00:00:00 2001
+From: Sebastian Weyer <sebastian.weyer@smile.fr>
+Date: Thu, 16 Mar 2023 15:57:13 +0100
+Subject: [PATCH] GNUMakefile: remove dependency on build during install
+
+When building using buildroot, we only call install after having built
+already, therefore we don't want to have to rebuild.
+
+Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
+---
+ GNUmakefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/GNUmakefile b/GNUmakefile
+index b242bc8ce..faecf420b 100644
+--- a/GNUmakefile
++++ b/GNUmakefile
+@@ -334,7 +334,7 @@ clean:
+ distclean: clean
+ 	$(CARGO) clean $(CARGOFLAGS) && $(CARGO) update $(CARGOFLAGS)
+ 
+-install: build
++install:
+ 	mkdir -p $(INSTALLDIR_BIN)
+ ifeq (${MULTICALL}, y)
+ 	$(INSTALL) $(BUILDDIR)/coreutils $(INSTALLDIR_BIN)/$(PROG_PREFIX)coreutils
+-- 
+2.25.1
+
diff --git a/package/uutils-coreutils/Config.in b/package/uutils-coreutils/Config.in
new file mode 100644
index 0000000000..97ddd4b096
--- /dev/null
+++ b/package/uutils-coreutils/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_UUTILS_COREUTILS
+	bool "uutils-coreutils"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_RUSTC
+	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	help
+	  uutils is an attempt at writing universal (as in
+	  cross-platform) CLI utilities in Rust. While all programs have
+	  been implemented, some options might be missing or different
+	  behavior might be experienced.
+
+	  https://github.com/uutils/coreutils
diff --git a/package/uutils-coreutils/uutils-coreutils.hash b/package/uutils-coreutils/uutils-coreutils.hash
new file mode 100644
index 0000000000..ca90a0c9f2
--- /dev/null
+++ b/package/uutils-coreutils/uutils-coreutils.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  5bc773bcbc66851aa17979df44224c66c0b5323044c3c9cefb925b44ee9cd81b  uutils-coreutils-0.0.17.tar.gz
+sha256  a836eb3360d0e80f6a1620495543ad2a4e20e4cf72af89ff528fccf9e63be81e  LICENSE
diff --git a/package/uutils-coreutils/uutils-coreutils.mk b/package/uutils-coreutils/uutils-coreutils.mk
new file mode 100644
index 0000000000..12faf5a9ac
--- /dev/null
+++ b/package/uutils-coreutils/uutils-coreutils.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# uutils-coreutils
+#
+################################################################################
+
+UUTILS_COREUTILS_VERSION = 0.0.17
+UUTILS_COREUTILS_SITE = $(call github,uutils,coreutils,$(UUTILS_COREUTILS_VERSION))
+UUTILS_COREUTILS_LICENSE = MIT
+UUTILS_COREUTILS_LICENSE_FILES = LICENSE
+
+ifneq ($(BR2_ENABLE_DEBUG),y)
+UUTILS_COREUTILS_PROFILE = release
+else
+UUTILS_COREUTILS_PROFILE = debug
+endif
+
+UUTILS_COREUTILS_MAKE_OPTS = \
+	PROFILE=UUTILS_COREUTILS_PROFILE \
+	MULTICALL=y
+
+UUTILS_COREUTILS_CARGO_BUILD_OPTS = --features unix
+
+define UUTILS_COREUTILS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		$(UUTILS_COREUTILS_MAKE_OPTS) -C $(@D) \
+		BUILDDIR=$(@D)/target/$(RUSTC_TARGET_NAME)/$(UUTILS_COREUTILS_PROFILE) \
+		PREFIX=$(TARGET_DIR) install
+endef
+
+$(eval $(cargo-package))
-- 
2.25.1


--===============9164783725549107481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9164783725549107481==--
