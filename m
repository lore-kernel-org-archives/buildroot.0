Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE1ECD5BB2
	for <buildroot@archiver.kernel.org>; Thu, 13 Nov 2025 09:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 840F040D51;
	Thu, 13 Nov 2025 09:53:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cWJyC92W8AH; Thu, 13 Nov 2025 09:53:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 896C940D52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 896C940D52;
	Thu, 13 Nov 2025 09:53:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62E22158
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64D0F40A11
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e5RtznfHg6DL for <buildroot@buildroot.org>;
 Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 589FB40A02
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 589FB40A02
 for <buildroot@buildroot.org>; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A2F1845F5; Thu, 13 Nov 2025 09:53:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 13 Nov 2025 10:38:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffa68244171fb16207f61953cfebdff9bb411d5d
X-Git-Newrev: f88cb527da8ca251d2c495fb6f27f2a0aa1023bb
X-Patchwork-Hint: ignore
Message-Id: <20251113095342.4A2F1845F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/belr: remove package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f88cb527da8ca251d2c495fb6f27f2a0aa1023bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

belr was only needed as a dependency of linphone, as is anyway bundled
in more recent versions of linphone, making a separate package
unnecessary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy       |  8 ++++++++
 DEVELOPERS             |  1 -
 package/Config.in      |  1 -
 package/belr/Config.in | 19 -------------------
 package/belr/belr.hash |  3 ---
 package/belr/belr.mk   | 25 -------------------------
 6 files changed, 8 insertions(+), 49 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 10433ccb88..c669c79782 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
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
index 358c952d91..91783a74e5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1020,7 +1020,6 @@ F:	package/openzwave/
 
 N:	Fabrice Fontaine <fontaine.fabrice@gmail.com>
 F:	package/bearssl/
-F:	package/belr/
 F:	package/boinc/
 F:	package/cairo/
 F:	package/daq3/
diff --git a/package/Config.in b/package/Config.in
index b21ba89b31..20e03e7389 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2167,7 +2167,6 @@ menu "Other"
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
