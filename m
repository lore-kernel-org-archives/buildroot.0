From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 19 Dec 2016 13:22:49 +0100
Subject: [Buildroot] [PATCH 2/2] python-pathvalidate: bump to version 0.9.4
In-Reply-To: <1482150169-1392-1-git-send-email-yegorslists@googlemail.com>
References: <1482150169-1392-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1482150169-1392-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Add new runtime dependency: BR2_PACKAGE_PYTHON_MBSTRDECODER.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pathvalidate/Config.in                | 1 +
 package/python-pathvalidate/python-pathvalidate.hash | 4 ++--
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pathvalidate/Config.in b/package/python-pathvalidate/Config.in
index d70e34a..cc15fff 100644
--- a/package/python-pathvalidate/Config.in
+++ b/package/python-pathvalidate/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PATHVALIDATE
 	bool "python-pathvalidate"
+	select BR2_PACKAGE_PYTHON_MBSTRDECODER # runtime
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
 	help
 	  pathvalidate is a python library to validate/sanitize a string
diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index 3a1bc1d..e999c73 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/pathvalidate/json, sha256 locally computed
-md5	1ea321c363fb5f55451473071db30d28  pathvalidate-0.7.1.tar.gz
-sha256	4d701cfc8b380ed39252e29ce972a54dd18ce1dbe5cd8758162480d8bd673e5d  pathvalidate-0.7.1.tar.gz
+md5	c9f517f6caba5eee56731425b5a75427  pathvalidate-0.9.4.tar.gz
+sha256	289a849464cced59314e6a0827f2d2232bb9891f8f4812574a6875a7c7e554b9  pathvalidate-0.9.4.tar.gz
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index 843b207..25f2548 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 0.7.1
+PYTHON_PATHVALIDATE_VERSION = 0.9.4
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/85/39/94b634c076dc3192455b1c0a8d15061eeeffd65a9d267d2b9de237b159a2
+PYTHON_PATHVALIDATE_SITE = https://pypi.python.org/packages/9a/4a/49d219ca919753017bacea87e161614ed66204246ee1e150091910cb57c7
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
-- 
2.1.4
