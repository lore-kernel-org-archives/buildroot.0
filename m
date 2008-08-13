From: Brian Beattie <beattie@beattie-home.net>
Date: Wed, 13 Aug 2008 12:38:15 -0700
Subject: [Buildroot] [PATCH] Add help target to Makefile.in.advanced
Message-ID: <1218656295.6490.6.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds the target "linux26-help" which will list the targets
available, because I can never keep track of them.
-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting a bad thing?

Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
beattie at beattie-home.net | It's about dealing with the consequences."
www.beattie-home.net     | -- Midori Koto

----------------------------------- patch ---------------------------

Index: target/linux/Makefile.in
===================================================================
--- target/linux/Makefile.in	(revision 23076)
+++ target/linux/Makefile.in	(working copy)
@@ -246,3 +246,23 @@
 	rm -rf $(LINUX26_DIR)
 
 endif
+
+linux26-help:
+	@echo 
+	@echo "==================="
+	@echo "linux26 targets"
+	@echo
+	@echo "linux26-menuconfig - Run menuconfig for kernel"
+	@echo "linux26-xconfig    - Run xconfig for kernel"
+	@echo "linux26            - Make kernel"
+	@echo "linux26-modules    - Make kernel modules"
+	@echo "linux26-source     - Get kernel source distribution"
+	@echo "linux26-unpacked   - Unpack kernel source and apply patches"
+	@echo "linux26-config     - Configure kernel"
+	@echo "linux26-update     - Save current kernel configuration"
+	@echo "linux26-force      - Force complete kernel build on next \"make
\""
+	@echo "linux26clean       - Mark kernel source unconfigured and run
\"make clean\""
+	@echo "linux26-dirclean   - Remove kernel source directory"
+	@echo 
+
+HELP_TARGETS+=linux26-help
