Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0590FD116EA
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDE0C402E3;
	Thu, 27 Nov 2025 20:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hqIHQKLKy1dV; Thu, 27 Nov 2025 20:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D542F402E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D542F402E4;
	Thu, 27 Nov 2025 20:36:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 25E802A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B42960A8F
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vESM0EorDgUF for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63EC461493
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63EC461493
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 62B6482386; Thu, 27 Nov 2025 20:36:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 26 Nov 2025 09:13:21 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: e1f43bf090e56d5f6c001bf3ce0d5a8b2c13403d
X-Git-Newrev: dc64f06421787f7ab4e2564c9c9b4afd99fbed89
X-Patchwork-Hint: ignore
Message-Id: <20251127203602.62B6482386@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/belr: remove
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc64f06421787f7ab4e2564c9c9b4afd99fbed89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

belr was only needed as a dependency of linphone, as is anyway bundled
in more recent versions of linphone, making a separate package
unnecessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit f88cb527da8ca251d2c495fb6f27f2a0aa1023bb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 Config.in.legacy       |  8 ++++++++
 DEVELOPERS             |  1 -
 package/Config.in      |  1 -
 package/belr/Config.in | 19 -------------------
 package/belr/belr.hash |  3 ---
 package/belr/belr.mk   | 25 -------------------------
 6 files changed, 8 insertions(+), 49 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4b081d844c..5821708c7c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.08.3"
 
+config BR2_PACKAGE_BELR
+	bool "belr has been removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as part of the linphone
+	  removal. In addition, newer version of linphone directly
+	  bundle belr making a separate package unnecessary.
+
 config BR2_PACKAGE_BELLE_SIP
 	bool "belle-sip has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 157951c2e0..ad3ba00078 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1014,7 +1014,6 @@ F:	package/openzwave/
 
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
 F:	package/bearssl/
-F:	package/belr/
 F:	package/boinc/
 F:	package/cairo/
 F:	package/daq3/
diff --git a/package/Config.in b/package/Config.in
index 7d2fca15a4..5d2c6ffd31 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2179,7 +2179,6 @@ menu "Other"
 	source "package/basu/Config.in"
 	source "package/bctoolbox/Config.in"
 	source "package/bdwgc/Config.in"
-	source "package/belr/Config.in"
 	source "package/boost/Config.in"
 	source "package/c-capnproto/Config.in"
 	source "package/capnproto/Config.in"
diff --git a/package/belr/Config.in b/package/belr/Config.in
deleted file mode 100644
index f3f742ad28..0000000000
--- a/package/belr/Config.in
+++ /dev/null
@@ -1,19 +0,0 @@
-config BR2_PACKAGE_BELR
-	bool "belr"
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_HAS_THREADS # bctoolbox
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # bctoolbox
-	select BR2_PACKAGE_BCTOOLBOX
-	help
-	  Belr is Belledonne Communications' language recognition
-	  library, written in C++11. It parses text inputs formatted
-	  according to a language defined by an ABNF grammar, such as
-	  the protocols standardized at IETF.
-
-	  https://gitlab.linphone.org/BC/public/belr
-
-comment "belr needs a toolchain w/ threads, C++"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-
-comment "belr needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/belr/belr.hash b/package/belr/belr.hash
deleted file mode 100644
index 00c733c7df..0000000000
--- a/package/belr/belr.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  6358aa680193d972c831d677da1652c7f57d7e00649b971d4d9fbdebf4331b48  belr-4.4.8.tar.gz
-sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/belr/belr.mk b/package/belr/belr.mk
deleted file mode 100644
index 26b949734f..0000000000
--- a/package/belr/belr.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# belr
-#
-################################################################################
-
-BELR_VERSION = 4.4.8
-BELR_SITE = https://gitlab.linphone.org/BC/public/belr/-/archive/$(BELR_VERSION)
-BELR_LICENSE = GPL-3.0+
-BELR_LICENSE_FILES = LICENSE.txt
-BELR_INSTALL_STAGING = YES
-BELR_DEPENDENCIES = bctoolbox
-BELR_CONF_OPTS = \
-	-DENABLE_STRICT=OFF \
-	-DENABLE_TESTS=OFF \
-	-DENABLE_TOOLS=OFF
-
-ifeq ($(BR2_STATIC_LIBS),y)
-BELR_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
-else
-# cannot build static and shared together
-BELR_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
-endif
-
-$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
