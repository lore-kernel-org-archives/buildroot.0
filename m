From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Apr 2020 20:54:54 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/rocksdb: fix
 bzip2 option
Message-ID: <20200407184209.20D388D6D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a824284afc0c91284a7f0fb942f5615294f6e0b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Commit 95bf830e2ae6b5548c17fd3ce6ac1a8d2aa0c8b6 forgot to replace
ROCKSDB_CONF_OPTS by ROCKSDB_MAKE_OPTS for BR2_PACKAGE_BZIP2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8fc0b41c733f07a0c89d82d78306c35ed6ff4236)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rocksdb/rocksdb.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rocksdb/rocksdb.mk b/package/rocksdb/rocksdb.mk
index 8109605916..5f9fd9f1cb 100644
--- a/package/rocksdb/rocksdb.mk
+++ b/package/rocksdb/rocksdb.mk
@@ -14,9 +14,9 @@ ROCKSDB_MAKE_OPTS = PORTABLE=1
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ROCKSDB_DEPENDENCIES += bzip2
-ROCKSDB_CONF_OPTS += ROCKSDB_DISABLE_BZ2=0
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_BZ2=0
 else
-ROCKSDB_CONF_OPTS += ROCKSDB_DISABLE_BZ2=1
+ROCKSDB_MAKE_OPTS += ROCKSDB_DISABLE_BZ2=1
 endif
 
 ifeq ($(BR2_PACKAGE_GFLAGS),y)
