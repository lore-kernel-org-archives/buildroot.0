From: Brian Beattie <beattie@beattie-home.net>
Date: Sat, 12 Jul 2008 08:02:17 -0700
Subject: [Buildroot] Patch target/linux/Makefile.in.advanced
Message-ID: <1215874937.6308.14.camel@kokopelli>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The included patch adds the linux26-force target to
target/linux/Makefile.in.advanced like it was added to
target/linux/Makefile.in
-- 
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting a bad thing?

Brian Beattie   LFS12947 | "Honor isn't about making the right choices.
beattie at beattie-home.net | It's about dealing with the consequences."
www.beattie-home.net     | -- Midori Koto

--------------------- patch -------------------------------
Index: target/linux/Makefile.in.advanced
===================================================================
--- target/linux/Makefile.in.advanced	(revision 22802)
+++ target/linux/Makefile.in.advanced	(working copy)
@@ -454,6 +454,10 @@
 linux26-update:
 	cp -dpf $(LINUX26_DIR)/.config $(LINUX26_KCONFIG)
 
+# force rebuild
+linux26-force:
+	 touch $(LINUX26_DIR)/.configured
+
 # This has been renamed so we do _NOT_ by default run this on 'make
clean'
 linux26clean:
 	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
