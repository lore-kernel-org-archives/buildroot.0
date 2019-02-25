From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Feb 2019 22:07:40 +0100
Subject: [Buildroot] [git commit] package/libssh: bump to version 0.8.7
Message-ID: <20190225210547.105FE81674@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da6bcf9e86cf73ec4e405f7f6e122e6510deb026
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Fixes strict-overflow build error with older toolchains.

Fixes:
http://autobuild.buildroot.net/results/b95b1939a55111fc6b90ef253a32402b87f9c4ab/
http://autobuild.buildroot.net/results/281cb7b940178e4fe98940ddeed07ad546b23931/
http://autobuild.buildroot.net/results/e95d5957c19ff01120903a66d1167279a34da2ce/

Cc: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ct-Fix-size-type-for-i-an-j-in-ssh_select.patch | 29 ----------------------
 package/libssh/libssh.hash                         |  4 +--
 package/libssh/libssh.mk                           |  2 +-
 3 files changed, 3 insertions(+), 32 deletions(-)

diff --git a/package/libssh/0004-connect-Fix-size-type-for-i-an-j-in-ssh_select.patch b/package/libssh/0004-connect-Fix-size-type-for-i-an-j-in-ssh_select.patch
deleted file mode 100644
index 9e2bf9eea0..0000000000
--- a/package/libssh/0004-connect-Fix-size-type-for-i-an-j-in-ssh_select.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From c95bf48d0ef26ccf2135e09f0b2f8d0e54bd88e9 Mon Sep 17 00:00:00 2001
-From: Andreas Schneider <asn@cryptomilk.org>
-Date: Fri, 7 Dec 2018 12:07:13 +0100
-Subject: [PATCH] connect: Fix size type for i an j in ssh_select()
-
-Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit 58113d489eecf
-
- src/connect.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/connect.c b/src/connect.c
-index 6c09c3f638ba..7ff7513fb3e8 100644
---- a/src/connect.c
-+++ b/src/connect.c
-@@ -476,7 +476,7 @@ int ssh_select(ssh_channel *channels, ssh_channel *outchannels, socket_t maxfd,
-     fd_set *readfds, struct timeval *timeout) {
-   fd_set origfds;
-   socket_t fd;
--  int i,j;
-+  size_t i, j;
-   int rc;
-   int base_tm, tm;
-   struct ssh_timestamp ts;
--- 
-2.20.1
-
diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 3971519a9c..7164c91069 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.8/libssh-0.8.6.tar.xz.asc
+# https://www.libssh.org/files/0.8/libssh-0.8.7.tar.xz.asc
 # with key 8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
-sha256 1046b95632a07fc00b1ea70ee683072d0c8a23f544f4535440b727812002fd01  libssh-0.8.6.tar.xz
+sha256 43304ca22f0ba0b654e14b574a39816bc70212fdea5858a6637cc26cade3d592  libssh-0.8.7.tar.xz
 sha256 1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 016d67546f..332f2a5700 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBSSH_VERSION_MAJOR = 0.8
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).6
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).7
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
