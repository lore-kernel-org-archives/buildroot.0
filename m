From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 22:10:14 +0100
Subject: [Buildroot] [git commit] python-requests: bump to 2.9.1
Message-ID: <20160113211741.0DC257FDDD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cc36ef9867feef9ba3da42fc345f0c61b3ed847
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add missing zlib runtime dependency.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-requests/Config.in            | 2 ++
 package/python-requests/python-requests.hash | 6 +++---
 package/python-requests/python-requests.mk   | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/Config.in b/package/python-requests/Config.in
index 3367cf0..23ab309 100644
--- a/package/python-requests/Config.in
+++ b/package/python-requests/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_REQUESTS
 	bool "python-requests"
+	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	help
 	  Requests is an Apache2 Licensed HTTP library, written in
 	  Python, for human beings.
diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index d187dcd..b567fe6 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=02214b3a179e445545de4b7a98d3dd17, sha256 locally computed
-md5	02214b3a179e445545de4b7a98d3dd17  requests-2.4.3.tar.gz
-sha256	53c68313c5c6149b1a899234c000296e60a8900682accf73d6f0c6d608afc6b1  requests-2.4.3.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=0b7f480d19012ec52bab78292efd976d, sha256 locally computed
+md5	0b7f480d19012ec52bab78292efd976d  requests-2.9.1.tar.gz
+sha256	c577815dd00f1394203fc44eb979724b098f88264a9ef898ee45b8e5e9cf587f  requests-2.9.1.tar.gz
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 5c12f1b..8cda2c5 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.4.3
+PYTHON_REQUESTS_VERSION = 2.9.1
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
 PYTHON_REQUESTS_SITE = http://pypi.python.org/packages/source/r/requests
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
