From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 7 Nov 2012 20:38:37 +0100
Subject: [Buildroot] [git commit] libmbus : bump version to 0.8
Message-ID: <20121107194001.59E2399C3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d727a4da444cb0001f8b5f73e73809780542be65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release contains many improvements bug fixes, and major new features and
support for float point numbers and support for multi-telegram communication...

[Peter: also drop autoreconf]
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmbus/libmbus-bcopy.patch |   16 ----------------
 package/libmbus/libmbus.mk          |    6 +-----
 2 files changed, 1 insertions(+), 21 deletions(-)

diff --git a/package/libmbus/libmbus-bcopy.patch b/package/libmbus/libmbus-bcopy.patch
deleted file mode 100644
index 660cc37..0000000
--- a/package/libmbus/libmbus-bcopy.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Drop bcopy since it's deprecated.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura libmbus-0.7.0/mbus/mbus-tcp.c libmbus-0.7.0-bcopy/mbus/mbus-tcp.c
---- libmbus-0.7.0/mbus/mbus-tcp.c	2011-12-08 13:21:19.000000000 -0300
-+++ libmbus-0.7.0-bcopy/mbus/mbus-tcp.c	2012-05-03 09:08:36.987106612 -0300
-@@ -78,7 +78,7 @@
-         return NULL;
-     }
- 
--    bcopy((void *)(host_addr->h_addr), (void *)(&s.sin_addr), host_addr->h_length);
-+    memmove((void *)(&s.sin_addr), (void *)(host_addr->h_addr), host_addr->h_length);
- 
-     if (connect(handle->sock, (struct sockaddr *)&s, sizeof(s)) < 0)
-     {
diff --git a/package/libmbus/libmbus.mk b/package/libmbus/libmbus.mk
index 16e9e6a..b3cae97 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -4,12 +4,8 @@
 #
 #############################################################
 
-LIBMBUS_VERSION = 0.7.0
+LIBMBUS_VERSION = 0.8.0
 LIBMBUS_SITE = http://www.freescada.com/public-dist
 LIBMBUS_INSTALL_STAGING = YES
 
-# Without this the build yields an error:
-#   cannot find input file: `test/Makefile.in'
-LIBMBUS_AUTORECONF = YES
-
 $(eval $(autotools-package))
