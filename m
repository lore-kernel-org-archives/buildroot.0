From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  9 Sep 2018 13:58:48 +0200
Subject: [Buildroot] [PATCH 1/1] lsscsi: bump to version 0.30
Message-ID: <20180909115848.4014-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add hash for license file
- Fix build with glibc 2.28: <sys/sysmacros.h> is no longer included
  from <sys/types.h>, and therefore <sys/sysmacros.h> must be included
  explicitly when major()/minor() are used

Fixes:
 - http://autobuild.buildroot.org/results/60ec736ec524dcffedcef8f92d98aa29fb8987aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lsscsi/lsscsi.hash | 3 ++-
 package/lsscsi/lsscsi.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lsscsi/lsscsi.hash b/package/lsscsi/lsscsi.hash
index d39da9bc80..fe1bc5d8b4 100644
--- a/package/lsscsi/lsscsi.hash
+++ b/package/lsscsi/lsscsi.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 025d009a1af42bc5b2fca664c44c9ecdfd754356e4a44f5c6aced2420afadd50  lsscsi-0.28.tgz
+sha256 619a2187405f02c5f57682f3478bffc75326803cd08839e39d434250c5518b15  lsscsi-0.30.tgz
+sha256 dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/lsscsi/lsscsi.mk b/package/lsscsi/lsscsi.mk
index 649aad9a38..70c5226d9b 100644
--- a/package/lsscsi/lsscsi.mk
+++ b/package/lsscsi/lsscsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSSCSI_VERSION = 0.28
+LSSCSI_VERSION = 0.30
 LSSCSI_SOURCE = lsscsi-$(LSSCSI_VERSION).tgz
 LSSCSI_SITE = http://sg.danny.cz/scsi
 LSSCSI_LICENSE = GPL-2.0+
-- 
2.17.1
