From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Wed,  5 Nov 2008 04:59:32 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081105125933.00C513C8A1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-11-05 04:59:32 -0800 (Wed, 05 Nov 2008)
New Revision: 23937

Log:
linux26: make installation of modules rule depend on .depend_done

This patch will make the installation of modules rule depend on .depend_done instead of .configured to make sure make prepare is run before modules are installed.

Make kernelversion does not work before make prepare has been run.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-11-05 12:19:39 UTC (rev 23936)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-11-05 12:59:32 UTC (rev 23937)
@@ -391,7 +391,7 @@
 	touch -c $@
 
 # -----------------------------------------------------------------------------
-$(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed: $(LINUX26_DIR)/.configured
+$(PROJECT_BUILD_DIR)/autotools-stamps/linux_modules_target_installed: $(LINUX26_DIR)/.depend_done
 	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)
 	rm -f $(TARGET_DIR)/sbin/cardmgr
 	# Make Linux depend on modules only if enabled in the .config.
