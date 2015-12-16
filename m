From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Wed, 16 Dec 2015 08:36:12 +0100
Subject: [Buildroot] [PATCH v2 3/3] python-tornado: bump to 4.3
In-Reply-To: <1450251372-7064-1-git-send-email-yegorslists@googlemail.com>
References: <1450251372-7064-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1450251372-7064-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add new run-time dependencies:

PYTHON_SINGLEDISPATCH for Python 2.7.x
PYTHON_BACKPORTS_ABC for both Python versions

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-tornado/Config.in           | 2 ++
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
index 85c7891..ac86682 100644
--- a/package/python-tornado/Config.in
+++ b/package/python-tornado/Config.in
@@ -2,6 +2,8 @@ config BR2_PACKAGE_PYTHON_TORNADO
 	bool "python-tornado"
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_SINGLEDISPATCH if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_BACKPORTS_ABC	# runtime
 	help
 	  Tornado is a Python web framework and asynchronous networking
 	  library, originally developed at FriendFeed.
diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 88e3956..e0f3c39 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi?:action=show_md5&digest=c548d7b77a11d523c3d7255bd7fd6df8, sha256 locally computed
-md5     c548d7b77a11d523c3d7255bd7fd6df8 tornado-4.2.tar.gz
-sha256  e8b1207da67dbdceebfb291292b4ef1b547d6171525bec1b366853f923456a5f  tornado-4.2.tar.gz
+md5     d13a99dc0b60ba69f5f8ec1235e5b232 tornado-4.3.tar.gz
+sha256  c9c2d32593d16eedf2cec1b6a41893626a2649b40b21ca9c4cac4243bde2efbf  tornado-4.3.tar.gz
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index a8d1f94..64809b7 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 4.2
+PYTHON_TORNADO_VERSION = 4.3
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
 PYTHON_TORNADO_SITE = https://pypi.python.org/packages/source/t/tornado
 PYTHON_TORNADO_LICENSE = Apache-2.0
-- 
2.1.4
