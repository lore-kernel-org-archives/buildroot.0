Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E6FC64EC4
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FA088224A;
	Thu,  9 Mar 2023 21:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FA088224A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hBkNcnLXQBZg; Thu,  9 Mar 2023 21:21:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58D3C82246;
	Thu,  9 Mar 2023 21:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58D3C82246
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 72D8F1BF366
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DF5B405A8
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DF5B405A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJF5Tfqktxct for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 664D740278
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 664D740278
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51AC686C9B; Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 22:14:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1723771209106d80d9c673c6f8b99bd08c1b0967
X-Git-Newrev: 1a0f75f77b47b603b8abe727a27a0c5b97f00259
X-Patchwork-Hint: ignore
Message-Id: <20230309212100.51AC686C9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/atkmm2_28: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a0f75f77b47b603b8abe727a27a0c5b97f00259
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the version needed for gtkmm3.

Note that 2.28 is indeed the latest version before 2.36. They skipped
versions 2.30, 2.32 and 2.34.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                       |  2 ++
 package/Config.in                |  1 +
 package/atkmm/Config.in          |  2 +-
 package/atkmm2_28/Config.in      | 23 +++++++++++++++++++++++
 package/atkmm2_28/atkmm2_28.hash |  5 +++++
 package/atkmm2_28/atkmm2_28.mk   | 16 ++++++++++++++++
 6 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 32ab852084..c2734f9c59 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -640,6 +640,8 @@ N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
 
 N:	Daniel Lang <d.lang@abatec.at>
+F:	package/atkmm/
+F:	package/atkmm2_28/
 F:	package/dbus-cxx/
 F:	package/glibmm/
 F:	package/glibmm2_66/
diff --git a/package/Config.in b/package/Config.in
index 0f0980b57b..bc6f98c6e1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1556,6 +1556,7 @@ menu "Graphics"
 	source "package/at-spi2-core/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
+	source "package/atkmm2_28/Config.in"
 	source "package/bayer2rgb-neon/Config.in"
 	source "package/bullet/Config.in"
 	source "package/cairo/Config.in"
diff --git a/package/atkmm/Config.in b/package/atkmm/Config.in
index aa58f8d593..1f370356ea 100644
--- a/package/atkmm/Config.in
+++ b/package/atkmm/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_ATKMM
-	bool "atkmm"
+	bool "atkmm (latest)"
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libsigc
 	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
diff --git a/package/atkmm2_28/Config.in b/package/atkmm2_28/Config.in
new file mode 100644
index 0000000000..2340465b20
--- /dev/null
+++ b/package/atkmm2_28/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_ATKMM2_28
+	bool "atkmm (2.28.x)"
+	depends on BR2_INSTALL_LIBSTDCPP # glibmm
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS # atk/glibmm -> libglib2
+	depends on BR2_USE_MMU # atk/glibmm -> libglib2
+	depends on BR2_USE_WCHAR # atk/glibmm -> libglib2
+	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_GLIBMM2_66
+	select BR2_PACKAGE_LIBSIGC2
+
+	help
+	  The atkmm package is a set of C++ bindings for Atk.
+
+	  This is the last version before the API and ABI change
+	  introduced in 2.36.0 which requires C++17.
+
+	  http://www.gtkmm.org/
+
+comment "atkmm (2.28.x) needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/atkmm2_28/atkmm2_28.hash b/package/atkmm2_28/atkmm2_28.hash
new file mode 100644
index 0000000000..776c9851b8
--- /dev/null
+++ b/package/atkmm2_28/atkmm2_28.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/atkmm/2.28/atkmm-2.28.3.sha256sum
+sha256  7c2088b486a909be8da2b18304e56c5f90884d1343c8da7367ea5cd3258b9969  atkmm-2.28.3.tar.xz
+# locally computed
+sha256  a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  COPYING
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING.tools
diff --git a/package/atkmm2_28/atkmm2_28.mk b/package/atkmm2_28/atkmm2_28.mk
new file mode 100644
index 0000000000..dc57363cf5
--- /dev/null
+++ b/package/atkmm2_28/atkmm2_28.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# atkmm2_28
+#
+################################################################################
+
+ATKMM2_28_VERSION_MAJOR = 2.28
+ATKMM2_28_VERSION = $(ATKMM2_28_VERSION_MAJOR).3
+ATKMM2_28_SOURCE = atkmm-$(ATKMM2_28_VERSION).tar.xz
+ATKMM2_28_SITE = https://download.gnome.org/sources/atkmm/$(ATKMM2_28_VERSION_MAJOR)
+ATKMM2_28_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
+ATKMM2_28_LICENSE_FILES = COPYING COPYING.tools
+ATKMM2_28_INSTALL_STAGING = YES
+ATKMM2_28_DEPENDENCIES = atk glibmm2_66 libsigc2 host-pkgconf
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
