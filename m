Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0D2C6FD19
	for <buildroot@archiver.kernel.org>; Thu,  9 Mar 2023 21:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C6D182268;
	Thu,  9 Mar 2023 21:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C6D182268
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuBDI2JboT7w; Thu,  9 Mar 2023 21:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 310B28225C;
	Thu,  9 Mar 2023 21:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 310B28225C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A4B831BF97F
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ED2C405CE
 for <buildroot@lists.busybox.net>; Thu,  9 Mar 2023 21:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7ED2C405CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2kf_YYhd7etm for <buildroot@lists.busybox.net>;
 Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42CAE404F8
 for <buildroot@buildroot.org>; Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42CAE404F8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 306A286C8F; Thu,  9 Mar 2023 21:21:00 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 9 Mar 2023 21:38:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9cdccfdaae3395a8f3de0712175b1e60c2e62a2c
X-Git-Newrev: 9b078380384f8ecd74857260d911e267c7a788b3
X-Patchwork-Hint: ignore
Message-Id: <20230309212100.306A286C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsigc2: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b078380384f8ecd74857260d911e267c7a788b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the version of libsigc needed for gtkmm3.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 DEVELOPERS                              |  1 +
 package/Config.in                       |  1 +
 package/libsigc/Config.in               |  2 +-
 package/{libsigc => libsigc2}/Config.in | 13 ++++++++-----
 package/libsigc2/libsigc2.hash          |  5 +++++
 package/libsigc2/libsigc2.mk            | 19 +++++++++++++++++++
 6 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 82aeb6fe25..2786b1c050 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -642,6 +642,7 @@ F:	package/dacapo/
 N:	Daniel Lang <d.lang@abatec.at>
 F:	package/dbus-cxx/
 F:	package/libsigc/
+F:	package/libsigc2/
 F:	package/paho-mqtt-cpp/
 
 N:	Damien Lanson <damien@kal-host.com>
diff --git a/package/Config.in b/package/Config.in
index 3ace25c665..522a22b76a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2095,6 +2095,7 @@ menu "Other"
 	source "package/libseccomp/Config.in"
 	source "package/libshdata/Config.in"
 	source "package/libsigc/Config.in"
+	source "package/libsigc2/Config.in"
 	source "package/libsigsegv/Config.in"
 	source "package/libsolv/Config.in"
 	source "package/libspatialindex/Config.in"
diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
index 428774a3ab..4bea596579 100644
--- a/package/libsigc/Config.in
+++ b/package/libsigc/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_LIBSIGC
-	bool "libsigc++"
+	bool "libsigc++ (latest)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
diff --git a/package/libsigc/Config.in b/package/libsigc2/Config.in
similarity index 59%
copy from package/libsigc/Config.in
copy to package/libsigc2/Config.in
index 428774a3ab..e302e27af0 100644
--- a/package/libsigc/Config.in
+++ b/package/libsigc2/Config.in
@@ -1,6 +1,6 @@
-config BR2_PACKAGE_LIBSIGC
-	bool "libsigc++"
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+config BR2_PACKAGE_LIBSIGC2
+	bool "libsigc++ (2.x.x)"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libsigc++ implements a typesafe callback system for standard
@@ -8,7 +8,10 @@ config BR2_PACKAGE_LIBSIGC
 	  signals to any callback function, either global or a member
 	  function, regardless of whether it is static or virtual.
 
+	  This is the last version before the API and ABI change
+	  introduced in 3.0.0 which requires C++17.
+
 	  https://libsigcplusplus.github.io/libsigcplusplus/
 
-comment "libsigc++ needs a toolchain w/ C++, gcc >= 7"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+comment "libsigc++ (2.x.x) needs a toolchain w/ C++, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libsigc2/libsigc2.hash b/package/libsigc2/libsigc2.hash
new file mode 100644
index 0000000000..4811213568
--- /dev/null
+++ b/package/libsigc2/libsigc2.hash
@@ -0,0 +1,5 @@
+# From https://download.gnome.org/sources/libsigc++/2.12/libsigc++-2.12.0.sha256sum
+sha256  1c466d2e64b34f9b118976eb21b138c37ed124d0f61497df2a90ce6c3d9fa3b5  libsigc++-2.12.0.tar.xz
+
+# Locally calculated
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
diff --git a/package/libsigc2/libsigc2.mk b/package/libsigc2/libsigc2.mk
new file mode 100644
index 0000000000..845d03ba85
--- /dev/null
+++ b/package/libsigc2/libsigc2.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libsigc2
+#
+################################################################################
+
+LIBSIGC2_VERSION_MAJOR = 2.12
+LIBSIGC2_VERSION = $(LIBSIGC2_VERSION_MAJOR).0
+LIBSIGC2_SOURCE = libsigc++-$(LIBSIGC2_VERSION).tar.xz
+LIBSIGC2_SITE = https://download.gnome.org/sources/libsigc++/$(LIBSIGC2_VERSION_MAJOR)
+LIBSIGC2_INSTALL_STAGING = YES
+LIBSIGC2_LICENSE = LGPL-2.1+
+LIBSIGC2_LICENSE_FILES = COPYING
+LIBSIGC2_CONF_OPTS = \
+	-Dbuild-examples=false \
+	-Dbuild-tests=false \
+	-Dvalidation=false
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
