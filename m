From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 Sep 2018 21:38:40 +0200
Subject: [Buildroot] [git commit] monkey: bump to version 1.6.9
Message-ID: <20180918194858.C2E5688554@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6aeb6b7dfc2c33d1ea7cf368267ac17a2120c76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit update monkey-server package to 1.6.9

The --datadir option have been moved to --webroot.
The --plugdir option does not exist anymore.

Signed-off-by: David Pierret <david.pierret@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/monkey/monkey.hash | 6 +++---
 package/monkey/monkey.mk   | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/monkey/monkey.hash b/package/monkey/monkey.hash
index 6c7eada8c0..47e0e0db00 100644
--- a/package/monkey/monkey.hash
+++ b/package/monkey/monkey.hash
@@ -1,3 +1,3 @@
-# md5 from http://monkey-project.com/releases/1.5/monkey-1.5.6.tar.gz.md5, sha256 locally computed:
-md5    9699e4c9ea6ce6b989907c252ae80254 				monkey-1.5.6.tar.gz
-sha256 7c3d845306aa74ee6effd7ab6169d16ac4e6450e564954d0d0baa2d1e9be1a22	monkey-1.5.6.tar.gz
+# md5 from http://monkey-project.com/releases/1.6/monkey-1.6.9.tar.gz.md5, sha256 locally computed:
+md5    c401734985a936ee07dbff5eca7d176a 				monkey-1.6.9.tar.gz
+sha256 f1122e89cda627123286542b0a18fcaa131cbe9d4f5dd897d9455157289148fb	monkey-1.6.9.tar.gz
diff --git a/package/monkey/monkey.mk b/package/monkey/monkey.mk
index 02c26c99f4..58bc26e685 100644
--- a/package/monkey/monkey.mk
+++ b/package/monkey/monkey.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MONKEY_VERSION_MAJOR = 1.5
-MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).6
+MONKEY_VERSION_MAJOR = 1.6
+MONKEY_VERSION = $(MONKEY_VERSION_MAJOR).9
 MONKEY_SITE = http://monkey-project.com/releases/$(MONKEY_VERSION_MAJOR)
 MONKEY_LICENSE = Apache-2.0
 MONKEY_LICENSE_FILES = LICENSE
@@ -17,11 +17,10 @@ MONKEY_LICENSE_FILES = LICENSE
 MONKEY_CONF_OPTS = \
 	--prefix=/usr \
 	--sysconfdir=/etc/monkey \
-	--datadir=/var/www \
+	--webroot=/var/www \
 	--mandir=/usr/share/man \
 	--logdir=/var/log \
 	--pidfile=/var/run \
-	--plugdir=/usr/lib/monkey \
 	--malloc-libc
 
 # --uclib-mode is not a typo
