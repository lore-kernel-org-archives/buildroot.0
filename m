From: Michael Vetter <jubalh@iodoru.org>
Date: Wed, 27 Nov 2019 10:40:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/jasper: bump to 2.0.16
Message-ID: <20191127094055.14977-1-jubalh@iodoru.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes:
  * Fix assertion failure JPC_NOMINALGAIN (CVE-2016-9396) (#50)
  * Fix build on Windows 10 (#162)
  * Improve README
  * Fix build with CMake 2.x
  * Add missing dereference operators (#178, #157)
  * Check data in jas_image (CVE-2018-19539) (#196)
Signed-off-by: Michael Vetter <jubalh@iodoru.org>
---
 DEVELOPERS                 | 3 +++
 package/jasper/jasper.hash | 2 +-
 package/jasper/jasper.mk   | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 991be89849..4adaac0c3d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1683,6 +1683,9 @@ F:	package/python-pyzmq/
 N:	Michael Trimarchi <michael@amarulasolutions.com>
 F:	package/python-spidev/
 
+N:	Michael Vetter <jubalh@iodoru.org>
+F:	package/jasper/
+
 N:	Michael Walle <michael@walle.cc>
 F:	package/libavl/
 
diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 036ebc88d7..7e9ce0ea90 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 85266eea728f8b14365db9eaf1edc7be4c348704e562bb05095b9a077cf1a97b  jasper-2.0.14.tar.gz
+sha256 f1d8b90f231184d99968f361884e2054a1714fdbbd9944ba1ae4ebdcc9bbfdb1  jasper-2.0.16.tar.gz
 sha256 4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index f1260f2a9c..287c358884 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 2.0.14
+JASPER_VERSION = 2.0.16
 JASPER_SITE = $(call github,mdadams,jasper,version-$(JASPER_VERSION))
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
-- 
2.16.4
