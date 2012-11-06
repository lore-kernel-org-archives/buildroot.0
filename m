From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Tue,  6 Nov 2012 02:20:03 +0100
Subject: [Buildroot] [PATCH 1/1] libmbus : bump version to 0.8
Message-ID: <1352164803-8201-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This release contains many improvements bug fixes, and major new features and
support for float point numbers and support for multi-telegram communication...

Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/libmbus/libmbus-bcopy.patch | 16 ----------------
 package/libmbus/libmbus.mk          |  2 +-
 2 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 package/libmbus/libmbus-bcopy.patch

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
index 16e9e6a..9f25a3a 100644
--- a/package/libmbus/libmbus.mk
+++ b/package/libmbus/libmbus.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBMBUS_VERSION = 0.7.0
+LIBMBUS_VERSION = 0.8.0
 LIBMBUS_SITE = http://www.freescada.com/public-dist
 LIBMBUS_INSTALL_STAGING = YES
 
-- 
1.8.0
