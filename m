From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Wed,  7 Jan 2015 23:50:14 +0100
Subject: [Buildroot] [PATCH v4] python-tornado: bump to 4.0.2
Message-ID: <1420671014-3007-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a hash file. Also remove obsolete Python dependency statement.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v4: remove sha1 checksum, SSL and certifi runtime dependency
        v3: add hash origin
        v2: s/add/remove in commit message

 package/python-tornado/Config.in           | 4 ++--
 package/python-tornado/python-tornado.hash | 2 ++
 package/python-tornado/python-tornado.mk   | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)
 create mode 100644 package/python-tornado/python-tornado.hash

diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
index 870a3de..85c7891 100644
--- a/package/python-tornado/Config.in
+++ b/package/python-tornado/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_TORNADO
 	bool "python-tornado"
-	depends on BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON_ZLIB
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  Tornado is a Python web framework and asynchronous networking
 	  library, originally developed at FriendFeed.
diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
new file mode 100644
index 0000000..f5234d5
--- /dev/null
+++ b/package/python-tornado/python-tornado.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  900c5124ebdb6598ca8e8a0c5888f41a5f14117952d5515258e3d20222b21bfa  tornado-4.0.2.tar.gz
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index bac3ce7..5b88dd6 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 3.1.1
+PYTHON_TORNADO_VERSION = 4.0.2
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
 PYTHON_TORNADO_SITE = https://pypi.python.org/packages/source/t/tornado
 PYTHON_TORNADO_LICENSE = Apache-2.0
-- 
1.9.1
