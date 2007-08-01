From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 01 Aug 2007 21:19:12 +0200
Subject: [Buildroot] [RFC] libdaemon patch
Message-ID: <1185995952.7651.94.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libdaemon does not build properly, complaining about missing libtool
and giving some hints what to do:
Anyone can comment on the patch below?
It at least allows libdaemon to complete the compile...

Index: package/libdaemon/libdaemon.mk
===================================================================
--- package/libdaemon/libdaemon.mk      (revision 19374)
+++ package/libdaemon/libdaemon.mk      (arbetskopia)
@@ -29,7 +29,12 @@
        touch $(LIBDAEMON_DIR)/.unpacked
 
 $(LIBDAEMON_DIR)/.configured: $(LIBDAEMON_DIR)/.unpacked
-       (cd $(LIBDAEMON_DIR) && rm -rf config.cache && autoconf)
+       (cd $(LIBDAEMON_DIR) ;  \
+        rm -rf config.cache ;  \
+        aclocal ;              \
+        autoconf;              \
+        automake;              \
+        autoheader)
        ( cd $(LIBDAEMON_DIR) && \
                $(TARGET_CONFIGURE_OPTS) \
                $(TARGET_CONFIGURE_ARGS) \


Best Regards
Ulf Samuelsson
