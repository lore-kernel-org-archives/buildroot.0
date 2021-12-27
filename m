Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C17C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 21:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B8DBE40268;
	Mon, 27 Dec 2021 21:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIgUylmuSY-U; Mon, 27 Dec 2021 21:40:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E45934026B;
	Mon, 27 Dec 2021 21:40:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F09C1BF35D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C2A94016D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 21:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aqgWwD7Hzvto for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 21:40:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0433E4014E
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 21:40:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1387482B85; Mon, 27 Dec 2021 21:34:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 22:39:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17ebb6ffaed73bd144639775a10a09e651f1c6e3
X-Git-Newrev: c618da772df32679fdd338b99f44133655c9113f
X-Patchwork-Hint: ignore
Message-Id: <20211227213417.1387482B85@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zchunk: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=c618da772df32679fdd338b99f44133655c9113f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/zchunk/Config.in   |  8 ++++++++
 package/zchunk/zchunk.hash |  3 +++
 package/zchunk/zchunk.mk   | 28 ++++++++++++++++++++++++++++
 5 files changed, 41 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4d26a1a43a..cdfe922d66 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1289,6 +1289,7 @@ F:	package/python-tinycss2/
 F:	package/python-weasyprint/
 F:	package/python-yarl/
 F:	package/python-zopfli/
+F:	package/zchunk/
 
 N:	James Knight <james.knight@collins.com>
 F:	package/atkmm/
diff --git a/package/Config.in b/package/Config.in
index d499785801..59bf5caff7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1382,6 +1382,7 @@ menu "Compression and decompression"
 	source "package/minizip/Config.in"
 	source "package/snappy/Config.in"
 	source "package/szip/Config.in"
+	source "package/zchunk/Config.in"
 	source "package/zlib/Config.in"
 	source "package/zziplib/Config.in"
 endmenu
diff --git a/package/zchunk/Config.in b/package/zchunk/Config.in
new file mode 100644
index 0000000000..d610e15997
--- /dev/null
+++ b/package/zchunk/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_ZCHUNK
+	bool "zchunk"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  A file format designed for highly efficient deltas while
+	  maintaining good compression.
+
+	  https://github.com/zchunk/zchunk
diff --git a/package/zchunk/zchunk.hash b/package/zchunk/zchunk.hash
new file mode 100644
index 0000000000..d6b425dc70
--- /dev/null
+++ b/package/zchunk/zchunk.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  33934adecddc50c64615dd8cdfe52a79df674a5bb1d5e83a9c09e1d1e6e9b92c  zchunk-1.1.16.tar.gz
+sha256  3c6a4fd5a93cacec6bf694d0537246bc15a95a274f5c5301749754e56d27b797  LICENSE
diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
new file mode 100644
index 0000000000..d8538542f1
--- /dev/null
+++ b/package/zchunk/zchunk.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# zchunk
+#
+################################################################################
+
+ZCHUNK_VERSION = 1.1.16
+ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
+ZCHUNK_LICENSE = BSD-2-Clause
+ZCHUNK_LICENSE_FILES = LICENSE
+ZCHUNK_INSTALL_STAGING = YES
+ZCHUNK_DEPENDENCIES = libcurl
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+ZCHUNK_DEPENDENCIES += openssl
+ZCHUNK_CONF_OPTS += -Dwith-openssl=enabled
+else
+ZCHUNK_CONF_OPTS += -Dwith-openssl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+ZCHUNK_DEPENDENCIES += zstd
+ZCHUNK_CONF_OPTS += -Dwith-zstd=enabled
+else
+ZCHUNK_CONF_OPTS += -Dwith-zstd=disabled
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
