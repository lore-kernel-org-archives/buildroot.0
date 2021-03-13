From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Mar 2021 23:42:11 +0100
Subject: [Buildroot] [PATCH v1] package/rsync: bump version to 3.2.3
Message-ID: <20210313224211.27678-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- disable simd, openssl, xxhash, zstd, lz4, asm options

- update COPYING hash (add openssl and xxhash license
  enhancement):

  In addition, as a special exception, the copyright holders give
  permission to dynamically link rsync with the OpenSSL and xxhash
  libraries when those libraries are being distributed in compliance
  with their license terms, and to distribute a dynamically linked
  combination of rsync and these libraries.  This is also considered
  to be covered under the GPL's System Libraries exception.

For details see [1].

[1] https://download.samba.org/pub/rsync/NEWS#3.2.3

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/rsync/rsync.hash |  6 +++---
 package/rsync/rsync.mk   | 10 ++++++++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index 2da62a18f1..92f6156ba8 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/rsync/src/rsync-3.1.3.tar.gz.asc
-sha256	55cc554efec5fdaad70de921cd5a5eeb6c29a95524c715f3bbf849235b0800c0	rsync-3.1.3.tar.gz
+# https://download.samba.org/pub/rsync/src/rsync-3.2.3.tar.gz.asc
+sha256  becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e  rsync-3.2.3.tar.gz
 # Locally calculated
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
+sha256  0d33aa97d302cb9df27f99dfa28d58001c2479a02317956f1a7a890f3937a976  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index db26ebd93a..6a456c147a 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.1.3
+RSYNC_VERSION = 3.2.3
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+
 RSYNC_LICENSE_FILES = COPYING
@@ -12,7 +12,13 @@ RSYNC_CPE_ID_VENDOR = samba
 RSYNC_DEPENDENCIES = zlib popt
 RSYNC_CONF_OPTS = \
 	--with-included-zlib=no \
-	--with-included-popt=no
+	--with-included-popt=no \
+	--disable-simd \
+	--disable-openssl \
+	--disable-xxhash \
+	--disable-zstd \
+	--disable-lz4 \
+	--disable-asm
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 RSYNC_DEPENDENCIES += acl
-- 
2.30.1
