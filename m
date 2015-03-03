From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:15 +0100
Subject: [Buildroot] [RFC v3 10/30] faifa: use TARGET_LDFLAGS
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-11-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To do that add a patch already sent to upstream:
https://github.com/ffainelli/faifa/pull/9

This is in order to support the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 ...-handle-LDFLAGS-passed-to-the-configure-s.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/faifa/0001-Makefile.in-handle-LDFLAGS-passed-to-the-configure-s.patch

diff --git a/package/faifa/0001-Makefile.in-handle-LDFLAGS-passed-to-the-configure-s.patch b/package/faifa/0001-Makefile.in-handle-LDFLAGS-passed-to-the-configure-s.patch
new file mode 100644
index 0000000..5d54374
--- /dev/null
+++ b/package/faifa/0001-Makefile.in-handle-LDFLAGS-passed-to-the-configure-s.patch
@@ -0,0 +1,40 @@
+From 62cafe305f4b9f5fb4305dcfb68ae3144efc3353 Mon Sep 17 00:00:00 2001
+From: Fabio Porcedda <Fabio Porcedda fabio.porcedda@gmail>
+Date: Wed, 18 Feb 2015 17:58:23 +0100
+Subject: [PATCH] Makefile.in: handle LDFLAGS passed to the configure script
+
+Taking in account CFLAGS and LDFLAGS passed to the configure script is a
+common behaviour.
+
+This fix is also useful for supporting the per-package staging directory
+within Buildroot.
+
+Signed-off-by: Fabio Porcedda <Fabio Porcedda fabio.porcedda@gmail>
+---
+ Makefile.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index b1b7c58..792ac82 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -14,6 +14,7 @@
+ CC	= @CC@
+ STRIP	?= $(CROSS)strip
+ CFLAGS	= @CFLAGS@
++LDFLAGS	= @LDFLAGS@
+ INSTALL	= @INSTALL@
+ LIBS	= @LIBS@
+ 
+@@ -50,7 +51,7 @@ SIM_LIBS:=-levent
+ SIM_CFLAGS:=-Wno-unused
+ 
+ ifeq ($(OS),DARWIN)
+-LDFLAGS:=-dynamiclib -Wl,-dylib_install_name -Wl,$(LIB_SONAME)
++LDFLAGS+=-dynamiclib -Wl,-dylib_install_name -Wl,$(LIB_SONAME)
+ endif
+ 
+ LIBS:=$(LDFLAGS) $(LIBS)
+-- 
+2.3.0
+
-- 
2.3.1
