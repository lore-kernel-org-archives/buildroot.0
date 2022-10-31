Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10C1ECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 12:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8124640412;
	Mon, 31 Oct 2022 12:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8124640412
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijeUMRD_32BX; Mon, 31 Oct 2022 12:47:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1E12440439;
	Mon, 31 Oct 2022 12:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E12440439
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D02D1BF417
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 462BB40439
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 12:47:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 462BB40439
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4NCJBhrzZYNf for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 12:47:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C16740412
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 12:47:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C16740412
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AB50787917; Mon, 31 Oct 2022 12:47:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 13:46:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbe2a973da559ecf6fec9c2fa313cfa1fd50ea6e
X-Git-Newrev: 43f96ced67c9a1f84d3f0edf5cd632178eb176b8
X-Patchwork-Hint: ignore
Message-Id: <20221031124743.AB50787917@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docopt-cpp: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=43f96ced67c9a1f84d3f0edf5cd632178eb176b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add docopt.cpp library that can be used to create intuitive command
line interfaces with very little code by describing the valid calls
using the (POSIX.1-2017) command line utility argument syntax.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
Reviewed-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                         |  3 +++
 package/Config.in                  |  1 +
 package/docopt-cpp/Config.in       | 21 +++++++++++++++++++++
 package/docopt-cpp/docopt-cpp.hash |  6 ++++++
 package/docopt-cpp/docopt-cpp.mk   | 13 +++++++++++++
 5 files changed, 44 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3ab4d65d67..06ee5d8056 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -781,6 +781,9 @@ F:	board/acmesystems/acqua-a5/
 F:	configs/acmesystems_acqua_a5_256mb_defconfig
 F:	configs/acmesystems_acqua_a5_512mb_defconfig
 
+N:	Eero Aaltonen <eero.aaltonen@vaisala.com>
+F:	package/docopt-cpp/
+
 N:	Eloi Bail <eloi.bail@savoirfairelinux.com>
 F:	package/bayer2rgb-neon/
 F:	package/gstreamer1/gst1-plugins-bayer2rgb-neon/
diff --git a/package/Config.in b/package/Config.in
index 450a73d4ca..238d7813f0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2119,6 +2119,7 @@ endmenu
 
 menu "Text and terminal handling"
 	source "package/augeas/Config.in"
+	source "package/docopt-cpp/Config.in"
 	source "package/enchant/Config.in"
 	source "package/fmt/Config.in"
 	source "package/fstrcmp/Config.in"
diff --git a/package/docopt-cpp/Config.in b/package/docopt-cpp/Config.in
new file mode 100644
index 0000000000..ac85442732
--- /dev/null
+++ b/package/docopt-cpp/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_DOCOPT_CPP
+	bool "docopt-cpp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	help
+	  docopt is a library that lets you define a command line
+	  interface with the utility argument syntax that has been
+	  used by command line utilities for decades (POSIX.1-2017).
+	  From the description, docopt automatically generates a parser
+	  for the command line arguments.
+
+	  docopt Command-line interface description language
+	  http://docopt.org/
+
+	  docopt.cpp is a C++ port of docopt.
+
+	  https://github.com/docopt/docopt.cpp
+
+comment "docopt-cpp needs a toolchain w/ C++, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/docopt-cpp/docopt-cpp.hash b/package/docopt-cpp/docopt-cpp.hash
new file mode 100644
index 0000000000..c535914753
--- /dev/null
+++ b/package/docopt-cpp/docopt-cpp.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256  28af5a0c482c6d508d22b14d588a3b0bd9ff97135f99c2814a5aa3cbff1d6632  docopt-cpp-0.6.3.tar.gz
+
+# Hash for license files:
+sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE-Boost-1.0
+sha256  b2959a980bc25f5d5e020d7a31777b7184aace6eb160acc80619f85edf646f19  LICENSE-MIT
diff --git a/package/docopt-cpp/docopt-cpp.mk b/package/docopt-cpp/docopt-cpp.mk
new file mode 100644
index 0000000000..d90b82820f
--- /dev/null
+++ b/package/docopt-cpp/docopt-cpp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# docopt.cpp
+#
+################################################################################
+
+DOCOPT_CPP_VERSION = 0.6.3
+DOCOPT_CPP_SITE = $(call github,docopt,docopt.cpp,v$(DOCOPT_CPP_VERSION))
+DOCOPT_CPP_INSTALL_STAGING = YES
+DOCOPT_CPP_LICENSE = BSL-1.0 or MIT
+DOCOPT_CPP_LICENSE_FILES = LICENSE-Boost-1.0 LICENSE-MIT
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
