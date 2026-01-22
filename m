Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E55D3F09E
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D057840ACC;
	Wed, 28 Jan 2026 17:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zuGfUfrztVbz; Wed, 28 Jan 2026 17:22:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F93E40AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620922;
	bh=WkvcPeTAffbH+pwbWn+LOLxHXGw1LvvcQlwmKRdwLgA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iW9aM/QVaLW2QNXZ+8y8EZlp7kgGl/O5N8pewBj/+GF3LCwW2LvNqyT1/jws4feCK
	 4KOTgJCMqrOMmj5+ThdRwjPJuPrpirBZIc2I6TZKQZqBuWusW2ENbVJdhUT8tmHjS9
	 FmoKYi5iMn7yqHY1cRYcj/TpOh0Zdfoy7zSHJ/v5ZTUrM04BsDtfMT29KVC4mapymq
	 n3cIWCvmrIm5wbNqTlT43jQh3noQm9cNPSIJzcOjEopl+EYnbkj424ZxgNMkziWEbt
	 S6hf52U2O/sFTcD0iwBfSQKZhORB70CPUXc/YquhyhJnFzpkVnf36OwUqnX5Lljx4Y
	 KorjJXmTSdc6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F93E40AE9;
	Wed, 28 Jan 2026 17:22:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C005118
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 192F160782
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 96qlAfvKAzPc for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DF6760785
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DF6760785
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 379DC841F1; Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:51:23 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: d834a1771ba86e0c7258d6578615b7fe1a553fad
X-Git-Newrev: accd41e28955f3b40d11a2891002492c27ad3a55
X-Patchwork-Hint: ignore
Message-Id: <20260128172152.379DC841F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/dbus-triggerd:
 remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=accd41e28955f3b40d11a2891002492c27ad3a55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Analysis of https://rg42.org/gitweb/?p=dbustriggerd.git:
last commit: 2014

Musl libc 1.2.5 removed the definition of the basename() function from
string.h and only provides it in libgen.h as the POSIX standard
defines it.

Instead of fixing an unmaintainted package we remove it from buildroot,
no other package depends on it.

Fixes:
https://autobuild.buildroot.net/results/811/81170fe89e1f5b70c63657684de43175e621f762/

dbus-triggerd.c:150:27: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
  150 |     argv[argc++] = strdup(basename(handler_cmd));

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 12b6fbf40f3303b2d3463a00f874c6b2cbb3eac2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy                         |  7 +++++++
 package/Config.in                        |  1 -
 package/dbus-triggerd/Config.in          | 15 ---------------
 package/dbus-triggerd/dbus-triggerd.hash |  3 ---
 package/dbus-triggerd/dbus-triggerd.mk   | 21 ---------------------
 5 files changed, 7 insertions(+), 40 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 07f87525c2..182292eb18 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.11.2"
 
+config BR2_PACKAGE_DBUS_TRIGGERD
+	bool "dbus-triggerd removed"
+	select BR2_LEGACY
+	help
+	  dbus-triggerd was no longer maintained upstream, so it has
+	  been dropped.
+
 config BR2_PACKAGE_CVS
 	bool "cvs has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 8418426a33..ef741b4a7a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -485,7 +485,6 @@ endmenu
 	source "package/dbus-cxx/Config.in"
 	source "package/dbus-glib/Config.in"
 	source "package/dbus-python/Config.in"
-	source "package/dbus-triggerd/Config.in"
 	source "package/dfu-programmer/Config.in"
 	source "package/dfu-util/Config.in"
 	source "package/dmidecode/Config.in"
diff --git a/package/dbus-triggerd/Config.in b/package/dbus-triggerd/Config.in
deleted file mode 100644
index 331c414704..0000000000
--- a/package/dbus-triggerd/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_PACKAGE_DBUS_TRIGGERD
-	bool "dbus-triggerd"
-	depends on BR2_USE_MMU # fork(), dbus
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
-	depends on BR2_PACKAGE_DBUS
-	help
-	  dbus-triggerd is a tool to trigger shell-commands upon
-	  receiving a given dbus-signal.
-
-	  http://gareus.org/oss/dbustriggerd/start
-
-comment "dbus-triggerd needs a toolchain w/ threads"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_DBUS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/dbus-triggerd/dbus-triggerd.hash b/package/dbus-triggerd/dbus-triggerd.hash
deleted file mode 100644
index c5127133fb..0000000000
--- a/package/dbus-triggerd/dbus-triggerd.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  73dbd92e89eee223928b5cbf414affb5913f70c1ca7e3f8ab733a4696436dae3  dbus-triggerd-ba3dbec805cb707c94c54de21666bf18b79bcc09-git4.tar.gz
-sha256  30d135650639af9019633690fc1aecbfc150aeeef9446347d4286a58338d10b0  dbus-triggerd.c
diff --git a/package/dbus-triggerd/dbus-triggerd.mk b/package/dbus-triggerd/dbus-triggerd.mk
deleted file mode 100644
index 7d73a6c98f..0000000000
--- a/package/dbus-triggerd/dbus-triggerd.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# dbus-triggerd
-#
-################################################################################
-
-DBUS_TRIGGERD_VERSION = ba3dbec805cb707c94c54de21666bf18b79bcc09
-DBUS_TRIGGERD_SITE = git://rg42.org/dbustriggerd.git
-DBUS_TRIGGERD_LICENSE = GPL-2.0+
-DBUS_TRIGGERD_LICENSE_FILES = dbus-triggerd.c
-DBUS_TRIGGERD_DEPENDENCIES = host-pkgconf dbus
-
-define DBUS_TRIGGERD_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) all
-endef
-
-define DBUS_TRIGGERD_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR="$(TARGET_DIR)" -C $(@D) install
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
