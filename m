From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Tue,  3 Apr 2018 18:59:03 +0200
Subject: [Buildroot] [PATCH] libkrb5: Add check for TCL
Message-ID: <1522774743-4670-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/libkrb5/libkrb5.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 88cfc61..70de82b 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -48,6 +48,13 @@ else
 LIBKRB5_CONF_OPTS += --without-readline
 endif
 
+ifeq ($(BR2_PACKAGE_TCL),y)
+LIBKRB5_CONF_OPTS += --with-tcl
+LIBKRB5_DEPENDENCIES += tcl
+else
+LIBKRB5_CONF_OPTS += --without-tcltk
+endif
+
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBKRB5_CONF_OPTS += --disable-thread-support
 endif
-- 
2.7.4
