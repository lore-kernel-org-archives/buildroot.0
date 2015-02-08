From: Steve Kenton <skenton@ou.edu>
Date: Sun, 08 Feb 2015 17:44:56 -0600
Subject: [Buildroot] glibc and locale
Message-ID: <54D7F4F8.3040005@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a script that wants the locale program. I notice that is is already built
as part of the glibc build process, but it is not installed. Would there be
any objections to something along these lines to go ahead and install locale?
I'm not sure if this is the best way since glibc build uses autotools.

Steve

--- glibc.mk.ori	2015-02-08 17:38:16.824281939 -0600
+++ glibc.mk	2015-02-08 17:40:27.932284454 -0600
@@ -115,6 +115,7 @@ GLIBC_LIBS_LIB += libthread_db.so.*
 endif

 define GLIBC_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/build/locale/locale $(TARGET_DIR)/usr/bin/locale
 	for libs in $(GLIBC_LIBS_LIB); do \
 		$(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/lib) ; \
 	done
