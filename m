From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  8 May 2018 18:15:37 +0200
Subject: [Buildroot] [PATCH 1/1] cifs-utils: bump to version 6.8
Message-ID: <20180508161537.13609-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-mount.cifs-Remove-data_blob.h-include.patch | 32 ----------------------
 package/cifs-utils/cifs-utils.hash                 |  5 +++-
 package/cifs-utils/cifs-utils.mk                   |  2 +-
 3 files changed, 5 insertions(+), 34 deletions(-)
 delete mode 100644 package/cifs-utils/0001-mount.cifs-Remove-data_blob.h-include.patch

diff --git a/package/cifs-utils/0001-mount.cifs-Remove-data_blob.h-include.patch b/package/cifs-utils/0001-mount.cifs-Remove-data_blob.h-include.patch
deleted file mode 100644
index 6536076577..0000000000
--- a/package/cifs-utils/0001-mount.cifs-Remove-data_blob.h-include.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 272d523a57a4e8791d625a479128613be5e401f5 Mon Sep 17 00:00:00 2001
-From: Thomas Witt <pyromaniac@exherbo.org>
-Date: Wed, 15 Mar 2017 20:20:44 +0000
-Subject: [PATCH] mount.cifs: Remove data_blob.h include
-
-data_blob.h includes talloc.h from libtalloc, but that is only marked as
-a dependency for cifs.upcall. No symbols from that header are used by
-cifs.mount, so remove it to avoid the libtalloc dependency
-
-Signed-off-by: Thomas Witt <pyromaniac@exherbo.org>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Patch status: upstream commit 272d523a57a4
-
- mount.cifs.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/mount.cifs.c b/mount.cifs.c
-index 13b71ef50303..2612feb4d591 100644
---- a/mount.cifs.c
-+++ b/mount.cifs.c
-@@ -61,7 +61,6 @@
- #include "mount.h"
- #include "util.h"
- #include "resolve_host.h"
--#include "data_blob.h"
- 
- #ifndef MS_MOVE 
- #define MS_MOVE 8192 
--- 
-2.11.0
-
diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index ebc9c43e72..fda1573eeb 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,2 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	b2f21612474ab012e75accd167aab607a0614ff67efb56ea0f36789fa785cfab	cifs-utils-6.7.tar.bz2
+sha256	e7d1f6050c43f21f82cd77e288eb756755effd22f0c310fc2c525df9d41dff79	cifs-utils-6.8.tar.bz2
+
+# Hash for license file:
+sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 9044fdf83c..199e8422d5 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.7
+CIFS_UTILS_VERSION = 6.8
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
-- 
2.14.1
