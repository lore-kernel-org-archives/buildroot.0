From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 22:32:14 +0200
Subject: [Buildroot] [git commit] python-lxml: bump to version 4.2.4
Message-ID: <20180907111604.7F7C37FEB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=82b3ad97f12f7b26f88ad1c636dcca1928fedb5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix zlib dependency.

Fixes:
http://autobuild.buildroot.net/results/d8e/d8e3a9aae0e84fb1b3b8093986ec3a4ce7ca0663

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-lxml/Config.in        | 3 ++-
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/Config.in b/package/python-lxml/Config.in
index 1ccaa5e387..fcb30d56ee 100644
--- a/package/python-lxml/Config.in
+++ b/package/python-lxml/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_PYTHON_LXML
 	bool "python-lxml"
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
-	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
 	help
 	  The lxml XML toolkit is a Pythonic binding for the C libraries
 	  libxml2 and libxslt.
diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 38607e1b84..9b75a26280 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  f7bc9f702500e205b1560d620f14015fec76dcd6f9e889a946a2ddcc3c344fd0  lxml-4.0.0.tgz
+sha256  e2afbe403090f5893e254958d02875e0732975e73c4c0cdd33c1f009a61963ca  lxml-4.2.4.tgz
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 7f1692d1b0..80c04c0055 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.0.0
+PYTHON_LXML_VERSION = 4.2.4
 PYTHON_LXML_SITE = http://lxml.de/files
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tgz
 
