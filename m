From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Oct 2017 15:52:40 +0200
Subject: [Buildroot] [git commit] package/python: bump version to 2.7.14
Message-ID: <20171015134529.75B8C80057@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1842244c6d6e09154708e29a1cf527d2b01409d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebased patch 0016, changed _SITE to https.

Release notes:
https://raw.githubusercontent.com/python/cpython/84471935ed2f62b8c5758fd544c7d37076fe0fa5/Misc/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0016-Add-an-option-to-disable-installation-of-test-module.patch | 6 +++++-
 package/python/python.hash                                          | 6 +++---
 package/python/python.mk                                            | 4 ++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch b/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
index a147655..2e1a054 100644
--- a/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
+++ b/package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
@@ -8,6 +8,8 @@ are not necessarly useful on embedded targets.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+[Bernd: rebased against version 2.7.14]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 ---
  Makefile.pre.in | 48 ++++++++++++++++++++++++++++++++----------------
  configure.ac    |  6 ++++++
@@ -17,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index dedcf61..280cc4e 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -1038,27 +1038,43 @@ PLATMACDIRS= plat-mac plat-mac/Carbon plat-mac/lib-scriptpackages \
+@@ -1032,28 +1032,44 @@
  	plat-mac/lib-scriptpackages/SystemEvents \
  	plat-mac/lib-scriptpackages/Terminal
  PLATMACPATH=:plat-mac:plat-mac/lib-scriptpackages
@@ -26,6 +28,7 @@ index dedcf61..280cc4e 100644
 -		test/data test/cjkencodings test/decimaltestdata test/xmltestdata \
 -		test/imghdrdata \
 -		test/subprocessdata \
+-		test/support \
 -		test/tracedmodules \
 +LIBSUBDIRS=	lib-tk site-packages \
  		encodings compiler hotshot \
@@ -58,6 +61,7 @@ index dedcf61..280cc4e 100644
 +	test/cjkencodings test/decimaltestdata test/xmltestdata \
 +	test/imghdrdata \
 +	test/subprocessdata \
++	test/support \
 +	test/tracedmodules \
 +	email/test email/test/data \
 +	json/tests \
diff --git a/package/python/python.hash b/package/python/python.hash
index f285e42..3f64b83 100644
--- a/package/python/python.hash
+++ b/package/python/python.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-2713/
-md5 53b43534153bb2a0363f08bae8b9d990  Python-2.7.13.tar.xz
+# From https://www.python.org/downloads/release/python-2714/
+md5 1f6db41ad91d9eb0a6f0c769b8613c5b  Python-2.7.14.tar.xz
 # Locally calculated
-sha256 35d543986882f78261f97787fd3e06274bfa6df29fac9b4a94f73930ff98f731  Python-2.7.13.tar.xz
+sha256 71ffb26e09e78650e424929b2b457b9c912ac216576e6bd9e7d204ed03296a66  Python-2.7.14.tar.xz
diff --git a/package/python/python.mk b/package/python/python.mk
index cf1ddfb..aa7917a 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -5,9 +5,9 @@
 ################################################################################
 
 PYTHON_VERSION_MAJOR = 2.7
-PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).13
+PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).14
 PYTHON_SOURCE = Python-$(PYTHON_VERSION).tar.xz
-PYTHON_SITE = http://python.org/ftp/python/$(PYTHON_VERSION)
+PYTHON_SITE = https://python.org/ftp/python/$(PYTHON_VERSION)
 PYTHON_LICENSE = Python-2.0, others
 PYTHON_LICENSE_FILES = LICENSE
 PYTHON_LIBTOOL_PATCH = NO
