From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Feb 2015 22:22:25 +0100
Subject: [Buildroot] [git commit] bmon: bump version to 3.6
Message-ID: <20150302222722.8632E8177D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7525923c2f1851be2d29c88edd3a8d43b185f852
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 3.6
- Update the hash file
- Remove upstreamed patch

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../bmon/0001-build-uclinux-is-also-linux.patch    |   25 --------------------
 package/bmon/bmon.hash                             |    2 +-
 package/bmon/bmon.mk                               |    2 +-
 3 files changed, 2 insertions(+), 27 deletions(-)

diff --git a/package/bmon/0001-build-uclinux-is-also-linux.patch b/package/bmon/0001-build-uclinux-is-also-linux.patch
deleted file mode 100644
index 18f517e..0000000
--- a/package/bmon/0001-build-uclinux-is-also-linux.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From adcf320db5cc2844209d001f9484b0ff0cab4e0b Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 11 Nov 2014 20:22:37 -0300
-Subject: [PATCH] build: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
----
-Status: pull request in github
-
-diff --git a/configure.ac b/configure.ac
-index 3059e52..10388fd 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -70,7 +70,7 @@ fi
- PKG_CHECK_MODULES([CONFUSE], [libconfuse], [], AC_MSG_ERROR([requires libconfuse]))
- 
- case ${target_os} in
--    linux*)
-+    linux*|uclinux*)
-         PKG_CHECK_MODULES([LIBNL], [libnl-3.0], [], AC_MSG_ERROR([requires libnl3-dev]))
-         PKG_CHECK_MODULES([LIBNL_ROUTE], [libnl-route-3.0], [], AC_MSG_ERROR([requires libnl3-route]))
-     ;;
--- 
-2.0.4
-
diff --git a/package/bmon/bmon.hash b/package/bmon/bmon.hash
index dbe2e68..65747b4 100644
--- a/package/bmon/bmon.hash
+++ b/package/bmon/bmon.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  78ab9e46840178fbc874cdbc94fde34e72e41a18a27383660b50b4c3cd0d1f9c  bmon-3.5.tar.gz
+sha256  62c8c20d00572a7670891d4c112924786cb69ec4ca92d5052951566f000d1514  bmon-3.6.tar.gz
diff --git a/package/bmon/bmon.mk b/package/bmon/bmon.mk
index c89de17..95168f6 100644
--- a/package/bmon/bmon.mk
+++ b/package/bmon/bmon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BMON_VERSION = 3.5
+BMON_VERSION = 3.6
 BMON_SITE = https://github.com/tgraf/bmon/releases/download/v$(BMON_VERSION)/
 BMON_DEPENDENCIES = host-pkgconf libconfuse libnl ncurses
 BMON_LICENSE = BSD-2c
