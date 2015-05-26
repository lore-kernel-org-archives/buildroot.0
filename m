From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 May 2015 19:30:17 -0300
Subject: [Buildroot] [PATCH] nbd: security bump to version 3.11
Message-ID: <1432679417-15209-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2015-0847 nbd-server denial of service due to unsafe signal handlers

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/nbd/nbd.hash | 5 +++--
 package/nbd/nbd.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index 1136050..306e11b 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  48a223770eb136603dc266587d9a37ed5024132e09e2c8484096d4c46cfed3e2  nbd-3.8.tar.xz
+# From http://sourceforge.net/projects/nbd/files/nbd/3.11/
+md5	73d11644a28b9f335292cdb3bdc4b74b	nbd-3.11.tar.xz
+sha1	a9823a656ef3411c7a14f3c1ae843d92a9141476	nbd-3.11.tar.xz
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index f512f7a..fee2cf8 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.8
+NBD_VERSION = 3.11
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
-- 
2.3.6
