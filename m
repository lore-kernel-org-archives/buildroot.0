Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E644C282C6
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20E6F6FBE4;
	Fri, 28 Feb 2025 17:13:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMWIS-bc65VH; Fri, 28 Feb 2025 17:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 223B870B53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 223B870B53;
	Fri, 28 Feb 2025 17:13:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DEB71DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E52A042F35
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2zXVQ744rBZ for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 203394249C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 203394249C
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D1B185FAE; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 17:43:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d5471a2316dec1f29c5566d5c16deaf0f1dcc193
X-Git-Newrev: dc55e7eb518e1c0d81d1ed1cb9b0f0ae6f75a454
X-Patchwork-Hint: ignore
Message-Id: <20250228163032.1D1B185FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/utfcpp: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc55e7eb518e1c0d81d1ed1cb9b0f0ae6f75a454
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Needed for taglib 2.x:
https://github.com/taglib/taglib/commit/6ed0ca28db0d12a75572c0f5dcefdc5ebb34cc21

Upstream discourages the use of CMakeList.txt to install the package:
https://github.com/nemtrif/utfcpp/commit/4965d378fb141a21c8afa7c283a8af4725e6a57e

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/utfcpp/Config.in   | 10 ++++++++++
 package/utfcpp/utfcpp.hash |  3 +++
 package/utfcpp/utfcpp.mk   | 23 +++++++++++++++++++++++
 5 files changed, 38 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d48b4c5500..0c9f2126a4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -509,6 +509,7 @@ F:	package/tor/
 F:	package/transmission/
 F:	package/tvheadend/
 F:	package/unixodbc/
+F:	package/utfcpp/
 F:	package/vlc/
 F:	package/wget/
 F:	package/wireless-regdb/
diff --git a/package/Config.in b/package/Config.in
index a4a8bd394f..b76d37e4a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2364,6 +2364,7 @@ menu "Text and terminal handling"
 	source "package/tclap/Config.in"
 	source "package/termcolor/Config.in"
 	source "package/utf8proc/Config.in"
+	source "package/utfcpp/Config.in"
 endmenu
 
 endmenu
diff --git a/package/utfcpp/Config.in b/package/utfcpp/Config.in
new file mode 100644
index 0000000000..19e1f21688
--- /dev/null
+++ b/package/utfcpp/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_UTFCPP
+	bool "utfcpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  UTF-8 with C++ in a Portable Way
+
+	  https://github.com/nemtrif/utfcpp
+
+comment "taglib needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/utfcpp/utfcpp.hash b/package/utfcpp/utfcpp.hash
new file mode 100644
index 0000000000..65b3ad2a88
--- /dev/null
+++ b/package/utfcpp/utfcpp.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  6920a6a5d6a04b9a89b2a89af7132f8acefd46e0c2a7b190350539e9213816c0  utfcpp-4.0.6.tar.gz
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE
diff --git a/package/utfcpp/utfcpp.mk b/package/utfcpp/utfcpp.mk
new file mode 100644
index 0000000000..3a4613841e
--- /dev/null
+++ b/package/utfcpp/utfcpp.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# taglib
+#
+################################################################################
+
+UTFCPP_VERSION = 4.0.6
+UTFCPP_SITE = $(call github,nemtrif,utfcpp,v$(UTFCPP_VERSION))
+UTFCPP_LICENSE = BSL-1.0
+UTFCPP_LICENSE_FILES = LICENSE
+
+# utfcpp is a header-only library, it only makes sense
+# to have it installed into the staging directory.
+UTFCPP_INSTALL_STAGING = YES
+UTFCPP_INSTALL_TARGET = NO
+
+define UTFCPP_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/utf8/
+	$(INSTALL) -m 0644 $(@D)/source/utf8.h $(STAGING_DIR)/usr/include/utf8.h
+	$(INSTALL) -m 0644 $(@D)/source/utf8/* $(STAGING_DIR)/usr/include/utf8/
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
