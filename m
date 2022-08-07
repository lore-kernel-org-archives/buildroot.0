Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0573C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 14:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 300FA60B11;
	Sun,  7 Aug 2022 14:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 300FA60B11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XbO2Nzh_Sffy; Sun,  7 Aug 2022 14:49:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 337F060ADF;
	Sun,  7 Aug 2022 14:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 337F060ADF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAB3D1BF96B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 14:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C64D5404C7
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 14:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C64D5404C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8tOiG2lhnT-s for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 14:49:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC1BD400B9
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 14:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC1BD400B9
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5A11886F69; Sun,  7 Aug 2022 14:35:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 16:38:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1b638e4817d8b1148eef60506e201b39141859d6
X-Git-Newrev: acf68180de66c710a8e19bae7325cf253e0b5849
X-Patchwork-Hint: ignore
Message-Id: <20220807143537.5A11886F69@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zlmdb: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=acf68180de66c710a8e19bae7325cf253e0b5849
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Required by python-crossbar.

Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/python-zlmdb/Config.in         | 22 ++++++++++++++++++++++
 package/python-zlmdb/python-zlmdb.hash |  5 +++++
 package/python-zlmdb/python-zlmdb.mk   | 14 ++++++++++++++
 5 files changed, 43 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 531839c817..23ed6c8487 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -779,6 +779,7 @@ F:	package/gstreamer1/gst1-plugins-bayer2rgb-neon/
 
 N:	Emile Cormier <emile.cormier.jr@gmail.com>
 F:	package/python-appdirs/
+F:	package/python-zlmdb/
 
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	docs/manual/adding-packages-meson.txt
diff --git a/package/Config.in b/package/Config.in
index 2e1bf500e0..a09ad342d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1327,6 +1327,7 @@ menu "External python modules"
 	source "package/python-yatl/Config.in"
 	source "package/python-zc-lockfile/Config.in"
 	source "package/python-zeroconf/Config.in"
+	source "package/python-zlmdb/Config.in"
 	source "package/python-zope-interface/Config.in"
 	source "package/python-zopfli/Config.in"
 endmenu
diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Config.in
new file mode 100644
index 0000000000..ac4ee05442
--- /dev/null
+++ b/package/python-zlmdb/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_PYTHON_ZLMDB
+	bool "python-zlmdb"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
+	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL # python-numpy
+	select BR2_PACKAGE_PYTHON_CBOR2 # runtime
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_CLICK # runtime
+	select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
+	select BR2_PACKAGE_PYTHON_LMDB # runtime
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_PYNACL # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	select BR2_PACKAGE_PYTHON_TXAIO # runtime
+	help
+	  Object-relational zero-copy in-memory database layer for
+	  LMDB.
+
+	  https://github.com/crossbario/zlmdb
+
+comment "python-zlmdb needs glibc or musl"
+	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
diff --git a/package/python-zlmdb/python-zlmdb.hash b/package/python-zlmdb/python-zlmdb.hash
new file mode 100644
index 0000000000..d98dc7d12a
--- /dev/null
+++ b/package/python-zlmdb/python-zlmdb.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/zlmdb/json
+md5  d730a394b74108933a65c9fbe76aba36  zlmdb-22.3.1.tar.gz
+sha256  0d416a47b1ee627186af8e5c99e5246f6b277df44ba5c6bb67e947eabf948e5a  zlmdb-22.3.1.tar.gz
+# Locally computed sha256 checksums
+sha256  8a139bf325dcca11e0e476ce537bf791a6cfbeed8899a9b6ddc55238e180d230  LICENSE
diff --git a/package/python-zlmdb/python-zlmdb.mk b/package/python-zlmdb/python-zlmdb.mk
new file mode 100644
index 0000000000..a040622d9d
--- /dev/null
+++ b/package/python-zlmdb/python-zlmdb.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-zlmdb
+#
+################################################################################
+
+PYTHON_ZLMDB_VERSION = 22.3.1
+PYTHON_ZLMDB_SOURCE = zlmdb-$(PYTHON_ZLMDB_VERSION).tar.gz
+PYTHON_ZLMDB_SITE = https://files.pythonhosted.org/packages/71/87/bb3cebd5312e670e33551317c7fc5e4b6a4a9af39075a71cd541b32cc0bf
+PYTHON_ZLMDB_SETUP_TYPE = setuptools
+PYTHON_ZLMDB_LICENSE = MIT
+PYTHON_ZLMDB_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
