From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Dec 2015 17:44:10 +0100
Subject: [Buildroot] [git commit] cryptodev-linux: bump to version 1.8
Message-ID: <20151201232125.7821081D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3f1c58f64cde17beea3d9f246b6a4bea411def12
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches are upstream so remove them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-fix-compilation-against-linux-3.19.patch  | 37 ----------------------
 package/cryptodev-linux/cryptodev-linux.hash       |  2 +-
 package/cryptodev-linux/cryptodev-linux.mk         |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/package/cryptodev-linux/0001-fix-compilation-against-linux-3.19.patch b/package/cryptodev-linux/0001-fix-compilation-against-linux-3.19.patch
deleted file mode 100644
index aebbc9b..0000000
--- a/package/cryptodev-linux/0001-fix-compilation-against-linux-3.19.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5054d20d45571cc85339351fde52f872eeb82206 Mon Sep 17 00:00:00 2001
-From: Phil Sutter <phil@nwl.cc>
-Date: Tue, 10 Feb 2015 04:57:05 +0100
-Subject: [PATCH] fix compilation against linux-3.19
-
-Commit f938612dd97d481b8b5bf960c992ae577f081c17 in linux.git removes
-get_unused_fd() macro. This patch changes the calling code to use it's
-content 'get_unused_fd_flags(0)' instead. Checking for when
-get_unused_fd_flags was introduced shows it's been there since 2.6.23 at
-least, so probably no need to make this change conditional on the target
-kernel version.
-
-Original patch by Ricardo Ribalda Delgado for Open Embedded, reported by
-Oleg Rakhmanov.
-
-Signed-off-by: Phil Sutter <phil@nwl.cc>
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
- ioctl.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ioctl.c b/ioctl.c
-index 5a55a76..b23f5fd 100644
---- a/ioctl.c
-+++ b/ioctl.c
-@@ -546,7 +546,7 @@ static int
- clonefd(struct file *filp)
- {
- 	int ret;
--	ret = get_unused_fd();
-+	ret = get_unused_fd_flags(0);
- 	if (ret >= 0) {
- 			get_file(filp);
- 			fd_install(ret, filp);
--- 
-2.0.5
-
diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index d5e0bae..d7195ac 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking php signature
-sha256	41880533b53de4d7b3f054e230f576988dafb8eed7bef5ebcf6422bb2e3a3b25	cryptodev-linux-1.7.tar.gz
+sha256	67fabde9fb67b286a96c4f45b594b0eccd0f761b495705c18f2ae9461b831376	cryptodev-linux-1.8.tar.gz
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 6001c71..c3f5355 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = 1.7
+CRYPTODEV_LINUX_VERSION = 1.8
 CRYPTODEV_LINUX_SITE = http://download.gna.org/cryptodev-linux
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPLv2+
