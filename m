From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 16:32:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot:  docs
Message-ID: <20070819233234.8D69DA467E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 16:32:33 -0700 (Sun, 19 Aug 2007)
New Revision: 19584

Log:
Add support for BUILDROOT_DL_DIR environment variable, overriding DL_DIR

Modified:
   trunk/buildroot/Makefile
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2007-08-19 23:16:47 UTC (rev 19583)
+++ trunk/buildroot/Makefile	2007-08-19 23:32:33 UTC (rev 19584)
@@ -37,6 +37,9 @@
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(TOPDIR).config
 endif
+ifneq	($(BUILDROOT_DL_DIR),)
+BR2_DL_DIR:=$(BUILDROOT_DL_DIR)
+endif
 
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands

Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-08-19 23:16:47 UTC (rev 19583)
+++ trunk/buildroot/docs/buildroot.html	2007-08-19 23:32:33 UTC (rev 19584)
@@ -779,6 +779,28 @@
     toolchain and the target filesystem with exactly the same
     versions. </p>
 
+    <p>If you maintain several buildroot trees, it might be better to have
+    a shared download location. This can be accessed by creating a symbolic link
+    from the <code>dl</code> directory to the shared download location. </p>
+
+    <p>I.E:</p>
+
+<pre>
+ln -s &lt;shared download location&gt; dl
+</pre>
+
+    <p>Another way of accessing a shared download location is to
+    create the <code>BUILDROOT_DL_DIR</code> environment variable.
+    If this is set, then the value of DL_DIR in the project is
+    overridden. The following line should be added to 
+    <code>&quot;~/.bashrc&quot;</code>. <p>
+
+<pre>
+export BUILDROOT_DL_DIR &lt;shared download location&gt;
+</pre>
+
+
+
     <h2><a name="add_software" id="add_software"></a>Extending Buildroot with
     more software</h2>
 
