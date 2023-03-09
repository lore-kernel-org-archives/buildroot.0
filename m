Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22046C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C4FA18224B;
	Thu,  9 Mar 2023 21:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4FA18224B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dXJ7Vdg7L82i; Thu,  9 Mar 2023 21:21:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8D1A8225F;
	Thu,  9 Mar 2023 21:21:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8D1A8225F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D2C7A1BF366
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E89E60E7C
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E89E60E7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rIN_rWg9Pb18 for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 752B260E82
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 752B260E82
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 640E486C8F; Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 22:18:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a0f75f77b47b603b8abe727a27a0c5b97f00259
X-Git-Newrev: cd68e89c6c7d3bc3573ff5ae4eeedde4ca63003e
X-Patchwork-Hint: ignore
Message-Id: <20230309212100.640E486C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cairomm1_14: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cd68e89c6c7d3bc3573ff5ae4eeedde4ca63003e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the version needed by gtkmm3.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                           |  2 ++
 package/Config.in                    |  1 +
 package/cairomm/Config.in            |  2 +-
 package/cairomm1_14/Config.in        | 22 ++++++++++++++++++++++
 package/cairomm1_14/cairomm1_14.hash |  3 +++
 package/cairomm1_14/cairomm1_14.mk   | 16 ++++++++++++++++
 6 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index c2734f9c59..b9156aeaab 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -642,6 +642,8 @@ F:	package/dacapo/
 N:	Daniel Lang <d.lang@abatec.at>
 F:	package/atkmm/
 F:	package/atkmm2_28/
+F:	package/cairomm/
+F:	package/cairomm1_14/
 F:	package/dbus-cxx/
 F:	package/glibmm/
 F:	package/glibmm2_66/
diff --git a/package/Config.in b/package/Config.in
index bc6f98c6e1..14897df6c8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1561,6 +1561,7 @@ menu "Graphics"
 	source "package/bullet/Config.in"
 	source "package/cairo/Config.in"
 	source "package/cairomm/Config.in"
+	source "package/cairomm1_14/Config.in"
 	source "package/chipmunk/Config.in"
 	source "package/exempi/Config.in"
 	source "package/exiv2/Config.in"
diff --git a/package/cairomm/Config.in b/package/cairomm/Config.in
index dae52f01f7..75f6692b8a 100644
--- a/package/cairomm/Config.in
+++ b/package/cairomm/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_CAIROMM
-	bool "cairomm"
+	bool "cairomm (latest)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_WCHAR # libglib2
diff --git a/package/cairomm1_14/Config.in b/package/cairomm1_14/Config.in
new file mode 100644
index 0000000000..6e767d2428
--- /dev/null
+++ b/package/cairomm1_14/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_CAIROMM1_14
+	bool "cairomm (1.14.x)"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_USE_MMU # libglib2
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSIGC2
+	help
+	  The cairomm package is a set of C++ bindings for Cairo.
+
+	  This is the last version before the API and ABI change
+	  introduced in 1.16.0 which requires C++17.
+
+	  http://www.gtkmm.org/
+
+comment "cairomm (1.14.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/cairomm1_14/cairomm1_14.hash b/package/cairomm1_14/cairomm1_14.hash
new file mode 100644
index 0000000000..521e7cc546
--- /dev/null
+++ b/package/cairomm1_14/cairomm1_14.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  ee12b920b2d47cea1b6e20c367690d726eb22b4ca9fc711db329d03adcc0c8e0  cairomm-1.14.4.tar.gz
+sha256  bfe4a52dc4645385f356a8e83cc54216a293e3b6f1cb4f79f5fc0277abf937fd  COPYING
diff --git a/package/cairomm1_14/cairomm1_14.mk b/package/cairomm1_14/cairomm1_14.mk
new file mode 100644
index 0000000000..5d076ddf0a
--- /dev/null
+++ b/package/cairomm1_14/cairomm1_14.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# cairomm1_14
+#
+################################################################################
+
+CAIROMM1_14_VERSION = 1.14.4
+CAIROMM1_14_LICENSE = LGPL-2.0+
+CAIROMM1_14_LICENSE_FILES = COPYING
+CAIROMM1_14_SOURCE = cairomm-$(CAIROMM1_14_VERSION).tar.gz
+CAIROMM1_14_SITE = https://gitlab.freedesktop.org/cairo/cairomm/-/archive/$(CAIROMM1_14_VERSION)
+CAIROMM1_14_INSTALL_STAGING = YES
+CAIROMM1_14_DEPENDENCIES = cairo libglib2 libsigc2 host-pkgconf
+CAIROMM1_14_CONF_OPTS = -Dbuild-examples=false -Dbuild-tests=false
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
