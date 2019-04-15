From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Apr 2019 21:35:39 +0200
Subject: [Buildroot] [git commit] package/wayland: bump to version 1.17.0
Message-ID: <20190415193427.720298A642@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d6c047bb00decb485129e67cc7f875e477d0ee3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix conflict in disable tests patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../wayland/0001-configure-add-option-to-disable-tests.patch   |  2 +-
 package/wayland/wayland.hash                                   | 10 +++++-----
 package/wayland/wayland.mk                                     |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/wayland/0001-configure-add-option-to-disable-tests.patch b/package/wayland/0001-configure-add-option-to-disable-tests.patch
index c6e4a49681..fdfbeb4bd1 100644
--- a/package/wayland/0001-configure-add-option-to-disable-tests.patch
+++ b/package/wayland/0001-configure-add-option-to-disable-tests.patch
@@ -40,7 +40,7 @@ index 741db5ebf9d9..4862d42959f0 100644
 @@ -287,6 +288,7 @@ os_wrappers_test_LDADD = libtest-runner.la
  
  exec_fd_leak_checker_SOURCES = tests/exec-fd-leak-checker.c
- exec_fd_leak_checker_LDADD = libtest-runner.la
+ exec_fd_leak_checker_LDADD = libtest-helpers.la
 +endif
  
  EXTRA_DIST += tests/scanner-test.sh			\
diff --git a/package/wayland/wayland.hash b/package/wayland/wayland.hash
index 3f2846091a..f66a20efe5 100644
--- a/package/wayland/wayland.hash
+++ b/package/wayland/wayland.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2018-August/039358.html
-md5  0c215e53de71d6fb26f7102cdc6432d3  wayland-1.16.0.tar.xz
-sha1 24c63a5045c653dcfa24efd10fa7c7de89aca9ef  wayland-1.16.0.tar.xz
-sha256 4e72c2b56109ccfb6610d776e465f4ca0af2280c9c2f7d5cc23f0ed2548752f5  wayland-1.16.0.tar.xz
-sha512 64eca2b1c0bc7913508a5499dae87e2723c712d8024acbb4c77c3c4a6c20de78c10704ae9827fd034116ca540a547aeec28c5a1e3bd382b23f85231424b0f49c  wayland-1.16.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2019-March/040335.html
+md5  d91f970aea11fd549eae023d06f91af3  wayland-1.17.0.tar.xz
+sha1 4d9e08a7a4a07fa37a25d7aa3ef83f08edec0600  wayland-1.17.0.tar.xz
+sha256 72aa11b8ac6e22f4777302c9251e8fec7655dc22f9d94ee676c6b276f95f91a4  wayland-1.17.0.tar.xz
+sha512 c5051aab5ff078b368c196ecfedb33ccd961265bb914845d7ed81de361bb86ae18299575baa6c4eceb0d82cf8b495e8293f31b51d1cbc05d84af0a199ab3f946  wayland-1.17.0.tar.xz
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
index 6c2997be8e..e325c6d752 100644
--- a/package/wayland/wayland.mk
+++ b/package/wayland/wayland.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAYLAND_VERSION = 1.16.0
+WAYLAND_VERSION = 1.17.0
 WAYLAND_SITE = http://wayland.freedesktop.org/releases
 WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
 WAYLAND_LICENSE = MIT
