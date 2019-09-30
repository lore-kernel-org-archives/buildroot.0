From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 09:22:42 +0200
Subject: [Buildroot] [PATCH] package/cifs-utils: bump to version 6.9
Message-ID: <20190930072242.19469-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From https://wiki.samba.org/index.php/LinuxCIFS_utils:

- April 5, 2019: Release 6.9
  - smbinfo utility is added to query various kinds of information
    from the server (objectId, snapshots, different FileInfo* classes
    and other metadata)
  - server IP change is supported by expiring DNS key resolver entries
  - get/setcifsacl tools are improved to handle unexpected behavior
  - share snapshot are allowed to be specified by a GMT token or SMB
    100-nanoseconds time
  - various new mount option are documented: bsize, handletimeout,
    handlecache, rdma, max_credits and others
  - https://lists.samba.org/archive/samba-technical/2019-April/133233.html

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cifs-utils/cifs-utils.hash | 2 +-
 package/cifs-utils/cifs-utils.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.hash b/package/cifs-utils/cifs-utils.hash
index fda1573eeb..bbfbc1d8f4 100644
--- a/package/cifs-utils/cifs-utils.hash
+++ b/package/cifs-utils/cifs-utils.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	e7d1f6050c43f21f82cd77e288eb756755effd22f0c310fc2c525df9d41dff79	cifs-utils-6.8.tar.bz2
+sha256	18d8f1bf92c13c4d611502dbd6759e3a766ddc8467ec8a2eda3f589e40b9ac9c	cifs-utils-6.9.tar.bz2
 
 # Hash for license file:
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 3456cd9198..511e9ccc01 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CIFS_UTILS_VERSION = 6.8
+CIFS_UTILS_VERSION = 6.9
 CIFS_UTILS_SOURCE = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 CIFS_UTILS_LICENSE = GPL-3.0+
-- 
2.21.0
