From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 05:32:22 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070119133222.D001848599@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 05:32:21 -0800 (Fri, 19 Jan 2007)
New Revision: 17379

Log:
- add some more documentation


Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-01-19 12:35:26 UTC (rev 17378)
+++ trunk/buildroot/docs/buildroot.html	2007-01-19 13:32:21 UTC (rev 17379)
@@ -12,15 +12,16 @@
 <body>
   <div class="main">
     <div class="titre">
-      <h1><a href="http://buildroot.uclibc.org/">Buildroot</a></h1>
+      <h1>Buildroot</h1>
     </div>
 
-    <p>Usage and documentation by Thomas Petazzoni. Contributions from
-    Karsten Kruse, Ned Ludd, Martin Herren.</p>
+    <p><a href="http://buildroot.uclibc.org/">Buildroot</a> usage and documentation by Thomas Petazzoni. Contributions from
+    Karsten Kruse, Ned Ludd, Martin Herren and others.</p>
 
     <p><small>$LastChangedDate$</small></p>
 
     <ul>
+
       <li><a href="#about">About Buildroot</a></li>
       <li><a href="#download">Obtaining Buildroot</a></li>
       <li><a href="#using">Using Buildroot</a></li>
@@ -41,7 +42,7 @@
 
     <h2><a name="about" id="about"></a>About Buildroot</h2>
 
-    <p>Buildroot is a set of Makefiles and patches that allows to easily
+    <p>Buildroot is a set of Makefiles and patches that allow to easily
     generate both a cross-compilation toolchain and a root filesystem for your
     target. The cross-compilation toolchain uses uClibc (<a href=
     "http://www.uclibc.org/">http://www.uclibc.org/</a>), a tiny C standard
@@ -65,9 +66,9 @@
     toolchain runs on an x86 processor and generates code for a x86
     processor. Under most Linux systems, the compilation toolchain
     uses the GNU libc as C standard library.  This compilation
-    toolchain is called the "host compilation toolchain", and more
+    toolchain is called the &quot;host compilation toolchain&quot;, and more
     generally, the machine on which it is running, and on which you're
-    working is called the "host system". The compilation toolchain is
+    working is called the &quot;host system&quot;. The compilation toolchain is
     provided by your distribution, and Buildroot has nothing to do
     with it.</p>
 
@@ -116,7 +117,7 @@
     href="http://buildroot.uclibc.org/downloads/snapshots/">http://buildroot.uclibc.org/downloads/snapshots/</a>.</p>
 
     <p>To download Buildroot using SVN, you can simply follow
-    the rules described on the "Accessing SVN"-page (<a href=
+    the rules described on the &quot;Accessing SVN&quot;-page (<a href=
     "http://buildroot.uclibc.org/subversion.html">http://buildroot.uclibc.org/subversion.html</a>)
     of the uClibc buildroot website (<a href=
     "http://buildroot.uclibc.org">http://buildroot.uclibc.org</a>), and download the
@@ -133,7 +134,7 @@
     in the Linux Kernel (<a href=
     "http://www.kernel.org/">http://www.kernel.org/</a>) or in Busybox
     (<a href="http://www.busybox.org/">http://www.busybox.org/</a>). Note that
-    you can run everything as a normal user. There is no need to be root to
+    you can build everything as a normal user. There is no need to be root to
     configure and use Buildroot. The first step is to run the configuration
     assistant:</p>
 
@@ -161,6 +162,39 @@
     selected in the <code>Target options</code> section of the configuration
     tool.</p>
 
+    <p>If you intend to do an offline-build and just want to download all
+    sources that you previously selected in &quot;make menuconfig&quot; then
+    issue:</p>
+<pre>
+ $ make source
+</pre>
+    <p>You can now disconnect or copy the content of your <code>dl</code> 
+    directory to the build-host.</p>
+
+    <h3><a name="environment_variables" id="environment_variables"></a>
+    Environment variables</h3>
+
+    <p>Buildroot optionally honors some environment variables that are passed
+    to <code>make</code> :</p>
+    <ul>
+    <li>HOSTCXX
+    <li>HOSTCC
+    <li>UCLIBC_CONFIG_FILE=&lt;path/to/.config&gt;
+    <li>BUSYBOX_CONFIG_FILE=&lt;path/to/.config&gt;
+    </ul>
+
+    <p>An example that uses config files located in the toplevel directory and
+    in your $HOME:</p>
+<pre>
+$ make UCLIBC_CONFIG_FILE=uClibc.config BUSYBOX_CONFIG_FILE=$HOME/bb.config
+</pre>
+
+    <p>If you want to use a compiler other than the default <code>gcc</code>
+    or <code>g++</code> for building helper-binaries on your host, then do</p>
+<pre>
+$ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
+</pre>
+
     <h2><a name="custom_targetfs" id="custom_targetfs"></a>Customizing the
     target filesystem</h2>
 
@@ -198,7 +232,8 @@
     <h2><a name="custom_busybox" id="custom_busybox"></a>Customizing the
     Busybox configuration</h2>
 
-    <p>Busybox is very configurable, and you may want to customize it. You can
+    <p><a href="http://www.busybox.net/">Busybox</a> is very configurable, and
+    you may want to customize it. You can
     follow these simple steps to do it. It's not an optimal way, but it's
     simple and it works.</p>
 
@@ -206,21 +241,18 @@
       <li>Make a first compilation of buildroot with busybox without trying to
       customize it.</li>
 
-      <li>Go into <code>build_ARCH/busybox/</code> and run <code>make
-      menuconfig</code>. The nice configuration tool appears and you can
+      <li>Invoke <code>make busybox-menuconfig</code>.
+      The nice configuration tool appears and you can
       customize everything.</li>
 
-      <li>Copy the <code>.config</code> file to
-      <code>package/busybox/busybox.config</code> so that your customized
-      configuration will remains even if you remove the cross-compilation
-      toolchain.</li>
-
       <li>Run the compilation of buildroot again.</li>
     </ol>
 
     <p>Otherwise, you can simply change the
     <code>package/busybox/busybox.config</code> file if you know the options
     you want to change without using the configuration tool.</p>
+    <p>If you want to use an existing config file for busybox, then see 
+    section <a href="#environment_variables">environment variables</a>.</p>
 
     <h2><a name="custom_uclibc" id="custom_uclibc"></a>Customizing the uClibc
     configuration</h2>
@@ -238,9 +270,8 @@
       <li>Make a first compilation of buildroot without trying to
       customize uClibc.</li>
 
-      <li>Go into the directory
-      <code>toolchain_build_ARCH/uClibc/</code> and run <code>make
-      menuconfig</code>. The nice configuration assistant, similar to
+      <li>Invoke <code>make uclibc-menuconfig</code>.
+      The nice configuration assistant, similar to
       the one used in the Linux Kernel or in Buildroot appears. Make
       your configuration as appropriate.</li>
 
@@ -260,6 +291,9 @@
     <code>toolchain/uClibc/uClibc.config-locale</code> without running
     the configuration assistant.</p>
 
+    <p>If you want to use an existing config file for uclibc, then see 
+    section <a href="#environment_variables">environment variables</a>.</p>
+
     <h2><a name="buildroot_innards" id="buildroot_innards"></a>How Buildroot
     works</h2>
 
@@ -343,8 +377,8 @@
 
       <li>Add the <code>TARGETS</code> dependency. This should generally check
       if the configuration option for this package is enabled, and if so then
-      "subscribe" this package to be compiled by adding it to the TARGETS
-      global variable.</li>
+      &quot;subscribe&quot; this package to be compiled by adding it to the
+      TARGETS global variable.</li>
     </ol>
 
     <h2><a name="using_toolchain" id="using_toolchain"></a>Using the
@@ -367,7 +401,7 @@
     <code>~/buildroot/</code>) :</p>
 
 <pre>
-export PATH=$PATH:~/buildroot/build_mips/staging_dir/bin/
+export PATH=&quot;$PATH:~/buildroot/build_mips/staging_dir/bin/&quot;
 </pre>
 
     <p>Then you can simply do :</p>
@@ -621,7 +655,7 @@
     <p>Lines <a href="#line51">51-58</a> adds the target <code>foo</code> to the list
     of targets to be compiled by Buildroot by first checking if
     the configuration option for this package has been enabled
-    using the configuration tool, and if so then "subscribes"
+    using the configuration tool, and if so then &quot;subscribes&quot;
     this package to be compiled by adding it to the TARGETS
     global variable.  The name added to the TARGETS global
     variable is the name of this package's target, as defined on
