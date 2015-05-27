From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 May 2015 13:03:12 +0200
Subject: [Buildroot] [git commit] nbd: security bump to version 3.11
Message-ID: <20150527112232.2A69D807CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65a7964716855aff9e7071074a44c58c89d481fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
CVE-2015-0847 nbd-server denial of service due to unsafe signal handlers

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nbd/nbd.hash |    5 +++--
 package/nbd/nbd.mk   |    2 +-
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
