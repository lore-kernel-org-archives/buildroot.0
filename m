From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Sep 2018 21:50:23 +0200
Subject: [Buildroot] [PATCH 1/1] fio: fix license
Message-ID: <20180909195023.23907-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fio does not have any special conditions since version 2.2.6 indeed
MORAL-LICENSE has been updated to replace "promising" by "encouraged"
and "must" by "should":
https://github.com/axboe/fio/commit/67f4822ce3dc6af76b963c6ac467a8f0471a7faf

So fix LICENSE, add MORAL-LICENSE to LICENSE_FILES and add hash for both
licenses

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fio/fio.hash | 2 ++
 package/fio/fio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/fio/fio.hash b/package/fio/fio.hash
index 7eb08140c5..d136fd595b 100644
--- a/package/fio/fio.hash
+++ b/package/fio/fio.hash
@@ -1,2 +1,4 @@
 # Locally computed
 sha256 1952db4d534221e6e8454f851dfcc38328b0ed4a3f499ea25a51ca2b5ccc8136  fio-fio-2.20.tar.gz
+sha256 204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
+sha256 8a240c1ad13d1fe3e58588643d81d0695899be4a669fe6d8fafa76ca6a89db2c  MORAL-LICENSE
diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index c109f0795c..aabdff9925 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -6,8 +6,8 @@
 
 FIO_VERSION = fio-2.20
 FIO_SITE = git://git.kernel.dk/fio.git
-FIO_LICENSE = GPL-2.0 + special obligations
-FIO_LICENSE_FILES = COPYING
+FIO_LICENSE = GPL-2.0
+FIO_LICENSE_FILES = COPYING MORAL-LICENSE
 
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
 FIO_DEPENDENCIES += libaio
-- 
2.17.1
