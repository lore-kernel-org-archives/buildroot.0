Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71EE6C00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 19:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D966560B8B;
	Mon,  1 Aug 2022 19:20:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D966560B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQ57m9A1Agl4; Mon,  1 Aug 2022 19:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8932607D1;
	Mon,  1 Aug 2022 19:20:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8932607D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E63A01BF334
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 19:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1344605B2
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 19:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1344605B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xy159epyMT0h for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 19:20:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D83AD607D1
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 19:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D83AD607D1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A6BDD86BD4; Mon,  1 Aug 2022 19:06:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Aug 2022 21:13:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f1017a5834b744e6f87c3372a6de60d553566fd2
X-Git-Newrev: bef31674637249e64d378aa33c93d2ad23e4d93c
X-Patchwork-Hint: ignore
Message-Id: <20220801190617.A6BDD86BD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minizip-zlib: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=bef31674637249e64d378aa33c93d2ad23e4d93c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Legacy minizip provided in contrib/minizip of zlib.

https://www.winimage.com/zLibDll/minizip.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/minizip-zlib/Config.in         |  7 +++++++
 package/minizip-zlib/minizip-zlib.hash |  4 ++++
 package/minizip-zlib/minizip-zlib.mk   | 20 ++++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2a9b6e29e9..35456d9f94 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -958,6 +958,7 @@ F:	package/libxslt/
 F:	package/mbedtls/
 F:	package/minissdpd/
 F:	package/minizip/
+F:	package/minizip-zlib/
 F:	package/mongodb/
 F:	package/motion/
 F:	package/mutt/
diff --git a/package/Config.in b/package/Config.in
index b025097008..5518067252 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1403,6 +1403,7 @@ menu "Compression and decompression"
 	source "package/lz4/Config.in"
 	source "package/lzo/Config.in"
 	source "package/minizip/Config.in"
+	source "package/minizip-zlib/Config.in"
 	source "package/snappy/Config.in"
 	source "package/szip/Config.in"
 	source "package/zchunk/Config.in"
diff --git a/package/minizip-zlib/Config.in b/package/minizip-zlib/Config.in
new file mode 100644
index 0000000000..fe9b337a86
--- /dev/null
+++ b/package/minizip-zlib/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_MINIZIP_ZLIB
+	bool "minizip-zlib"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Legacy minizip provided in contrib/minizip of zlib.
+
+	  https://www.winimage.com/zLibDll/minizip.html
diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
new file mode 100644
index 0000000000..4d2c5c29d3
--- /dev/null
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -0,0 +1,4 @@
+# From http://www.zlib.net/
+sha256  4ff941449631ace0d4d203e3483be9dbc9da454084111f97ea0a2114e19bf066  zlib-1.2.11.tar.xz
+# License files, locally calculated
+sha256  7960b6b1cc63e619abb77acaea5427159605afee8c8b362664f4effc7d7f7d15  README
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
new file mode 100644
index 0000000000..935877678d
--- /dev/null
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# minizip-zlib
+#
+################################################################################
+
+MINIZIP_ZLIB_VERSION = 1.2.11
+MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
+MINIZIP_ZLIB_SITE = http://www.zlib.net
+MINIZIP_ZLIB_LICENSE = Zlib
+MINIZIP_ZLIB_LICENSE_FILES = README
+MINIZIP_ZLIB_INSTALL_STAGING = YES
+MINIZIP_ZLIB_SUBDIR = contrib/minizip
+# configure is not shipped in contrib/minizip
+MINIZIP_ZLIB_AUTORECONF = YES
+MINIZIP_ZLIB_DEPENDENCIES = zlib
+# demos must be disabled to avoid a conflict with BR2_PACKAGE_MINIZIP_DEMOS
+MINIZIP_ZLIB_CONF_OPTS = --disable-demos
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
