From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 16:46:03 +0100
Subject: [Buildroot] [git commit] package/rsync: bump version to 3.2.3
Message-ID: <20210314152238.58F9B878BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46e54492ba2b9e9e8aa9cb8c362666e2fcca66f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Cc: Baruch Siach <baruch@tkos.co.il>
[yann.morin.1998 at free.fr: add 'with exception' to _LICENSE (Baruch)]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rsync/rsync.hash |  6 +++---
 package/rsync/rsync.mk   | 12 +++++++++---
 2 files changed, 12 insertions(+), 6 deletions(-)

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
index db26ebd93a..3ebf3a6883 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,15 +4,21 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.1.3
+RSYNC_VERSION = 3.2.3
 RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
-RSYNC_LICENSE = GPL-3.0+
+RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
 RSYNC_CPE_ID_VENDOR = samba
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
