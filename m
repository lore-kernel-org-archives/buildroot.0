Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D4DC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 23:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C7BC60B2E;
	Fri,  7 Jan 2022 23:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpcFLmfruIEY; Fri,  7 Jan 2022 23:26:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A674F60A85;
	Fri,  7 Jan 2022 23:26:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D04781BF36E
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:26:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEC3E80BED
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 23:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zHFiNt1OdIYi for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 23:26:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1C1980BE5
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 23:26:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F002C8225C; Fri,  7 Jan 2022 23:20:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 00:26:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b7d2989db6a1347107235acb487f8660dfcd733
X-Git-Newrev: 5752d18bfcdb060c9d3b8c13330344cbdee74b75
X-Patchwork-Hint: ignore
Message-Id: <20220107232021.F002C8225C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libks: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=5752d18bfcdb060c9d3b8c13330344cbdee74b75
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed to bump freeswitch to 1.10.7.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/libks/Config.in  | 16 ++++++++++++++++
 package/libks/libks.hash |  3 +++
 package/libks/libks.mk   | 14 ++++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7874677f7e..25b6a56dc0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -371,6 +371,7 @@ F:	package/libglfw/
 F:	package/libglu/
 F:	package/libhdhomerun/
 F:	package/libilbc/
+F:	package/libks/
 F:	package/libldns/
 F:	package/libmicrohttpd/
 F:	package/libminiupnpc/
diff --git a/package/Config.in b/package/Config.in
index b424d20de4..5afd7131fe 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1977,6 +1977,7 @@ menu "Other"
 	source "package/libglob/Config.in"
 	source "package/libical/Config.in"
 	source "package/libite/Config.in"
+	source "package/libks/Config.in"
 	source "package/liblinear/Config.in"
 	source "package/libloki/Config.in"
 	source "package/libnpth/Config.in"
diff --git a/package/libks/Config.in b/package/libks/Config.in
new file mode 100644
index 0000000000..366b5bda71
--- /dev/null
+++ b/package/libks/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_LIBKS
+	bool "libks"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+	  Foundational support for signalwire C products
+
+	  https://github.com/signalwire/libks
+
+comment "libks needs a toolchain w/ C++, threads, dynamic library"
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libks/libks.hash b/package/libks/libks.hash
new file mode 100644
index 0000000000..5acbcd1ea6
--- /dev/null
+++ b/package/libks/libks.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  73c5751eadad4d3390d61b9765e9b860e0aba7336044ecf8b007dfc1818baa69  libks-1.7.0.tar.gz
+sha256  1d1327f37b58a4c9ce520fcf9dd3f348c7c639229ee7aed41c47164a8f7836cd  copyright
diff --git a/package/libks/libks.mk b/package/libks/libks.mk
new file mode 100644
index 0000000000..adf0107b30
--- /dev/null
+++ b/package/libks/libks.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# libks
+#
+################################################################################
+
+LIBKS_VERSION = 1.7.0
+LIBKS_SITE = $(call github,signalwire,libks,v$(LIBKS_VERSION))
+LIBKS_LICENSE = MIT
+LIBKS_LICENSE_FILES = copyright
+LIBKS_INSTALL_STAGING = YES
+LIBKS_DEPENDENCIES = openssl util-linux
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
