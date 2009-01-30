From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 30 Jan 2009 14:41:10 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: docs target/linux
Message-ID: <20090130144113.78AA1765E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-30 14:41:04 +0000 (Fri, 30 Jan 2009)
New Revision: 25169

Log:
target/linux/Makefile.in.advanced: get rid of BUILDROOT_USE_XWINDOWS

As discussed on the list.

Modified:
   trunk/buildroot/docs/buildroot.html
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2009-01-30 13:54:47 UTC (rev 25168)
+++ trunk/buildroot/docs/buildroot.html	2009-01-30 14:41:04 UTC (rev 25169)
@@ -685,21 +685,12 @@
 
      <p>Maybe, there will also be a possibility to supply an
      <code>&quot;URL&quot;</code> to a patch available on Internet. </p>
-<pre>
-export BUILDROOT_USE_XWINDOWS &lt;&gt;
-</pre>
 
      <p>
 	If there is no linux config file available,
 	buildroot starts the linux configuration system, which
-	defaults to "make menuconfig". There is a menuoption
-	allowing you to use the less archaic "make  xconfig"
-	You can override any .config setting by defining
-	the BUILDROOT_USE_XWINDOWS environment variable.
+	defaults to "make menuconfig".
      </p>
-
-
-
     </ol>
 
     <h2><a name="Todo" id="Todo"></a>Todo</h2>

Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-30 13:54:47 UTC (rev 25168)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-30 14:41:04 UTC (rev 25169)
@@ -109,17 +109,12 @@
 endif
 endif
 
-# Override config method with shell variable
-ifneq ($(BUILDROOT_USE_XWINDOWS),)
-KERNEL_CONFIG_METHOD:=xconfig
-#"))
-else
 KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD)))
 #"))
 ifeq ($(KERNEL_CONFIG_METHOD),)
 KERNEL_CONFIG_METHOD:=menuconfig
 endif
-endif
+
 # -----------------------------------------------------------------------------
 ifndef LINUX26_FORMAT
 ifneq ($(strip $(subst ",,$(BR2_PACKAGE_LINUX_FORMAT))),)
