Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE44C369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 21:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47C6161128;
	Thu, 24 Apr 2025 21:31:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcXB5pUKHw4W; Thu, 24 Apr 2025 21:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2195660EC1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2195660EC1;
	Thu, 24 Apr 2025 21:31:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17888968
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0989D83A74
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EbBGHQ7wucNJ for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 21:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E86F83487
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E86F83487
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 21:30:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 28FC5863E7; Thu, 24 Apr 2025 21:30:59 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Apr 2025 23:30:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 585cf21fa91147fe30ee48cdfef540bd7c9dd768
X-Git-Newrev: 3e65c8005ad36c605afa4d11800d0a94402de3d7
X-Patchwork-Hint: ignore
Message-Id: <20250424213059.28FC5863E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grout: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3e65c8005ad36c605afa4d11800d0a94402de3d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Grout is a Graph router based on DPDK.

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Reviewed-by: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  3 +++
 package/Config.in        |  1 +
 package/grout/Config.in  | 31 +++++++++++++++++++++++++++++++
 package/grout/grout.hash |  3 +++
 package/grout/grout.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 62 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1f0fc1903c..358626454d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2387,6 +2387,9 @@ F:	package/libtraceevent/
 F:	package/libtracefs
 F:	package/linux-tools/linux-tool-rtla.mk.in
 
+N:	Maxime Leroy <maxime@leroys.fr>
+F:	package/grout/
+
 N:	Meena Murthy <meena.murthy@amarulasolutions.com>
 F:	board/engicam/px30core/
 F:	configs/engicam_px30_core_defconfig
diff --git a/package/Config.in b/package/Config.in
index 93bb99c2d7..167965d64b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2503,6 +2503,7 @@ endif
 	source "package/gesftpserver/Config.in"
 	source "package/gloox/Config.in"
 	source "package/glorytun/Config.in"
+	source "package/grout/Config.in"
 	source "package/gupnp-tools/Config.in"
 	source "package/gutenprint/Config.in"
 	source "package/hans/Config.in"
diff --git a/package/grout/Config.in b/package/grout/Config.in
new file mode 100644
index 0000000000..4b3e89210f
--- /dev/null
+++ b/package/grout/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_GROUT
+	bool "grout"
+	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS # dpdk
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dpdk
+	depends on BR2_USE_MMU # dpdk, numactl, libecoli, util-linux-smartcols, libcap
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # dpdk
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19 # dpdk
+	depends on BR2_TOOLCHAIN_USES_GLIBC # dpdk
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC # numactl
+	depends on !BR2_STATIC_LIBS # libecoli
+	depends on BR2_USE_WCHAR # libecoli
+	select BR2_PACKAGE_DPDK
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBEVENT
+	select BR2_PACKAGE_NUMACTL
+	select BR2_PACKAGE_LIBECOLI
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
+	help
+	  Graph router based on DPDK
+
+	  NOTE: grout needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
+
+comment "grout needs a glibc toolchain w/ dynamic library, threads, wchar, gcc >= 4.9, headers >= 4.19"
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_DPDK_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
diff --git a/package/grout/grout.hash b/package/grout/grout.hash
new file mode 100644
index 0000000000..66b993efc4
--- /dev/null
+++ b/package/grout/grout.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  0470754b31922645177f4d15654fd345882fb6af4c415229b50b185eeeb8aa95  grout-0.9.1.tar.gz
+sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  LICENSE
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
new file mode 100644
index 0000000000..3466f84865
--- /dev/null
+++ b/package/grout/grout.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# grout
+#
+################################################################################
+
+GROUT_VERSION = 0.9.1
+GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
+GROUT_LICENSE = BSD-3-Clause
+GROUT_LICENSE_FILES = LICENSE
+
+# Avoid using buildroot commit hash
+GROUT_CONF_ENV = GROUT_VERSION=$(GROUT_VERSION)
+
+GROUT_DEPENDENCIES = \
+	host-pkgconf \
+	dpdk \
+	libcap \
+	libevent \
+	numactl \
+	libecoli \
+	util-linux
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
