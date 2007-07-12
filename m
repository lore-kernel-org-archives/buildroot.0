From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 12 Jul 2007 09:53:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20070712165315.56798A6820@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-12 09:53:13 -0700 (Thu, 12 Jul 2007)
New Revision: 19075

Log:
Fix Document style

Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2007-07-12 15:32:04 UTC (rev 19074)
+++ trunk/buildroot/docs/buildroot.html	2007-07-12 16:53:13 UTC (rev 19075)
@@ -34,7 +34,8 @@
       <li><a href="#using_toolchain">Using the uClibc toolchain</a></li>
       <li><a href="#toolchain_standalone">Using the uClibc toolchain
       outside of Buildroot</a></li>
-      <li><a href="#downloaded_packages">Location of downloaded packages</a></li>
+      <li><a href="#downloaded_packages">Location of downloaded packages</a>
+      </li>
       <li><a href="#add_software">Extending Buildroot with more
       Software</a></li>
       <li><a href="#links">Resources</a></li>
@@ -68,8 +69,8 @@
     uses the GNU libc as C standard library.  This compilation
     toolchain is called the &quot;host compilation toolchain&quot;, and more
     generally, the machine on which it is running, and on which you're
-    working is called the &quot;host system&quot;. The compilation toolchain is
-    provided by your distribution, and Buildroot has nothing to do
+    working is called the &quot;host system&quot;. The compilation toolchain 
+    is provided by your distribution, and Buildroot has nothing to do
     with it.</p>
 
     <p>As said above, the compilation toolchain that comes with your system
@@ -147,7 +148,7 @@
 
     <p>One of the key configuration items is the <code>PROJECT</code> which
     determines where some board specific packages are built and where the
-    results are stored.</p>
+    results are stored. </p>
 
     <p>Once everything is configured, the configuration tool has generated a
     <code>.config</code> file that contains the description of your
@@ -165,7 +166,8 @@
     be named <code>root_fs_ARCH.EXT</code> where <code>ARCH</code> is your
     architecture and <code>EXT</code> depends on the type of target filesystem
     selected in the <code>Target options</code> section of the configuration
-    tool.The file is stored in the "binaries/<code>$(PROJECT)</code>/" directory</p>
+    tool. 
+    The file is stored in the "binaries/<code>$(PROJECT)</code>/" directory</p>
 
     <p>If you intend to do an offline-build and just want to download all
     sources that you previously selected in &quot;make menuconfig&quot; then
@@ -207,12 +209,12 @@
 
     <ul>
       <li>Customize the target filesystem directly, and rebuild the image. The
-      target filesystem is available under <code>project_build_ARCH/root/</code> where
-      <code>ARCH</code> is the chosen target architecture. You can simply make
-      your changes here, and run make afterwards, which will rebuild the target
-      filesystem image. This method allows to do everything on the target
-      filesystem, but if you decide to completely rebuild your toolchain and
-      tools, these changes will be lost.</li>
+      target filesystem is available under <code>project_build_ARCH/root/</code>
+      where <code>ARCH</code> is the chosen target architecture.
+      You can simply make your changes here, and run make afterwards, which will
+      rebuild the target filesystem image. This method allows to do everything 
+      on the target filesystem, but if you decide to completely rebuild your 
+      toolchain and tools, these changes will be lost.</li>
 
       <li>Customize the target filesystem skeleton, available under
       <code>target/generic/target_skeleton/</code>. You can customize
@@ -229,12 +231,13 @@
       it should be changed. These main directories are in an tarball inside of
       inside the skeleton because it contains symlinks that would be broken
       otherwise.<br />
-      These customizations are deployed into <code>project_build_ARCH/root/</code> just
-      before the actual image is made. So simply rebuilding the image by running
-      make should propogate any new changes to the image.</li>
+      These customizations are deployed into 
+      <code>project_build_ARCH/root/</code> just before the actual image
+      is made. So simply rebuilding the image by running
+      make should propagate any new changes to the image.</li>
 
-      <li>When configuring the build system, using <code>make menuconfig</code>, you
-      can specify the contents of the /etc/hostname and /etc/issue
+      <li>When configuring the build system, using <code>make menuconfig</code>,
+      you can specify the contents of the /etc/hostname and /etc/issue
       (the welcome banner) in the <code>PROJECT</code> section</li>
     </ul>
 
@@ -258,8 +261,9 @@
     </ol>
 
     <p>Otherwise, you can simply change the
-    <code>package/busybox/busybox-&lt;version&gt;.config</code> file if you know the options
-    you want to change without using the configuration tool.</p>
+    <code>package/busybox/busybox-&lt;version&gt;.config</code> file if you 
+    know the options you want to change without using the configuration tool.
+    </p>
     <p>If you want to use an existing config file for busybox, then see 
     section <a href="#environment_variables">environment variables</a>.</p>
 
@@ -358,28 +362,28 @@
       tarballs are in this directory because it may be useful to save them
       somewhere to avoid further downloads.</li>
 
-      <li>Create the shared build directory (<code>build_ARCH/</code> by default,
-      where <code>ARCH</code> is your architecture). This is where all
-      non configurable user-space tools will be compiled.When building two or more
-      targets using the same architecture, the first build will go through the full 
-      download, configure, make process, but the second and later builds will only 
-      copy the result from the first build to its project specific target directory
-      significantly speeding up the build process</li>
+      <li>Create the shared build directory (<code>build_ARCH/</code> by
+      default, where <code>ARCH</code> is your architecture). This is where all
+      non configurable user-space tools will be compiled.When building two or
+      more targets using the same architecture, the first build will go through 
+      the full download, configure, make process, but the second and later 
+      builds will only copy the result from the first build to its project 
+      specific target directory significantly speeding up the build process</li>
 
       <li>Create the project specific build directory 
-      (<code>project_build_ARCH/$(PROJECT)</code> by default, where <code>ARCH</code> 
-      is your architecture). This is where all configurable user-space tools will be 
-      compiled. The project specific build directory is neccessary, if two different
-      targets needs to use a specific package, but the packages have different 
-      configuration for both targets. Some examples of packages built in this directory
-      are busybox and linux.
+      (<code>project_build_ARCH/$(PROJECT)</code> by default, where 
+      <code>ARCH</code> is your architecture). This is where all configurable 
+      user-space tools will be compiled. The project specific build directory 
+      is neccessary, if two different targets needs to use a specific package, 
+      but the packages have different configuration for both targets. Some 
+      examples of packages built in this directory are busybox and linux.
       </li>
 
       <li>Create the project specific result directory 
       (<code>binaries/$(PROJECT)</code> by default, where <code>ARCH</code> 
-      is your architecture). This is where the root file system images are stored,
-      It is also used to store the linux kernel image and any utilities, boot-loaders
-      etc. needed for a target.
+      is your architecture). This is where the root file system images are
+      stored, It is also used to store the linux kernel image and any 
+      utilities, boot-loaders etc. needed for a target.
       </li>
 
       <li>Create the toolchain build directory
@@ -456,9 +460,9 @@
     <code>build_ARCH/staging_dir/</code>. But sometimes, it may be useful to
     install it somewhere else, so that it can be used to compile other programs
     or by other users. Moving the <code>build_ARCH/staging_dir/</code>
-    directory elsewhere is <b>not possible if using gcc-3.x</b>, because they are some hardcoded
-    paths in the toolchain configuration. This works, thanks to sysroot support, with current,
-    stable gcc-4.x toolchains, of course.</p>
+    directory elsewhere is <b>not possible if using gcc-3.x</b>, because they 
+    are some hardcoded paths in the toolchain configuration. This works, thanks 
+    to sysroot support, with current, stable gcc-4.x toolchains, of course.</p>
 
     <p>If you want to use the generated gcc-3.x toolchain for other purposes,
     you can configure Buildroot to generate it elsewhere using the
@@ -585,7 +589,8 @@
     the other <code>*.mk</code> files in the <code>package</code>
     directory.</p>
 
-    <p>At lines <a href="#line6">6-11</a>, a couple of useful variables are defined :</p>
+    <p>At lines <a href="#line6">6-11</a>, a couple of useful variables are 
+    defined :</p>
 
     <ul>
 
@@ -614,22 +619,22 @@
 
     </ul>
 
-    <p>Lines <a href="#line13">13-14</a> defines a target that downloads the tarball from
-    the remote site to the download directory
+    <p>Lines <a href="#line13">13-14</a> defines a target that downloads the 
+    tarball from the remote site to the download directory
     (<code>DL_DIR</code>).</p>
 
-    <p>Lines <a href="#line16">16-18</a> defines a target and associated rules that
-    uncompress the downloaded tarball. As you can see, this target
+    <p>Lines <a href="#line16">16-18</a> defines a target and associated rules 
+    that uncompress the downloaded tarball. As you can see, this target
     depends on the tarball file, so that the previous target (line
-    <a href="#line13">13-14</a>) is called before executing the rules of the current
-    target. Uncompressing is followed by <i>touching</i> a hidden file
+    <a href="#line13">13-14</a>) is called before executing the rules of the 
+    current target. Uncompressing is followed by <i>touching</i> a hidden file
     to mark the software has having been uncompressed. This trick is
     used everywhere in Buildroot <i>Makefile</i> to split steps
     (download, uncompress, configure, compile, install) while still
     having correct dependencies.</p>
 
-    <p>Lines <a href="#line20">20-31</a> defines a target and associated rules that
-    configures the software. It depends on the previous target (the
+    <p>Lines <a href="#line20">20-31</a> defines a target and associated rules 
+    that configures the software. It depends on the previous target (the
     hidden <code>.source</code> file) so that we are sure the software has
     been uncompressed. In order to configure it, it basically runs the
     well-known <code>./configure</code> script. As we may be doing
@@ -640,15 +645,15 @@
     filesystem. Finally it creates a <code>.configured</code> file to
     mark the software as configured.</p>
 
-    <p>Lines <a href="#line33">33-34</a> defines a target and a rule that compiles the
-    software. This target will create the binary file in the
+    <p>Lines <a href="#line33">33-34</a> defines a target and a rule that 
+    compiles the software. This target will create the binary file in the
     compilation directory, and depends on the software being already
     configured (hence the reference to the <code>.configured</code>
     file). It basically runs <code>make</code> inside the source
     directory.</p>
 
-    <p>Lines <a href="#line36">36-38</a> defines a target and associated rules that install
-    the software inside the target filesystem. It depends on the
+    <p>Lines <a href="#line36">36-38</a> defines a target and associated rules 
+    that install the software inside the target filesystem. It depends on the
     binary file in the source directory, to make sure the software has
     been compiled. It uses the <code>install</code> target of the
     software <code>Makefile</code> by passing a <code>prefix</code>
@@ -658,8 +663,8 @@
     <code>/usr/man</code> directory inside the target filesystem is
     removed to save space.</p>
 
-    <p>Line <a href="#line40">40</a> defines the main target of the software, the one
-    that will be eventually be used by the top level
+    <p>Line <a href="#line40">40</a> defines the main target of the software, 
+    the one that will be eventually be used by the top level
     <code>Makefile</code> to download, compile, and then install
     this package. This target should first of all depends on all
     needed dependecies of the software (in our example,
@@ -667,33 +672,34 @@
     final binary. This last dependency will call all previous
     dependencies in the correct order. </p>
 
-    <p>Line <a href="#line42">42</a> defines a simple target that only downloads the code
-    source. This is not used during normal operation of Buildroot, but
-    is needed if you intend to download all required sources at once
-    for later offline build. Note that if you add a new package providing
+    <p>Line <a href="#line42">42</a> defines a simple target that only 
+    downloads the code source. This is not used during normal operation of 
+    Buildroot, but is needed if you intend to download all required sources at 
+    once for later offline build. Note that if you add a new package providing
     a <code>foo-source</code> target is <i>mandatory</i> to support
     users that wish to do offline-builds. Furthermore it eases checking
     if all package-sources are downloadable.</p>
 
-    <p>Lines <a href="#line44">44-46</a> define a simple target to clean the software build
-    by calling the <i>Makefiles</i> with the appropriate option.
+    <p>Lines <a href="#line44">44-46</a> define a simple target to clean the 
+    software build by calling the <i>Makefiles</i> with the appropriate option.
     The <code>-clean</code> target should run <code>make clean</code>
     on $(BUILD_DIR)/package-version and MUST uninstall all files of the
     package from $(STAGING_DIR) and from $(TARGET_DIR).</p>
 
-    <p>Lines <a href="#line48">48-49</a> define a simple target to completely remove the
-    directory in which the software was uncompressed, configured and
-    compiled. The <code>-dirclean</code> target MUST completely rm $(BUILD_DIR)/package-version.</p>
+    <p>Lines <a href="#line48">48-49</a> define a simple target to completely 
+    remove the directory in which the software was uncompressed, configured and
+    compiled. The <code>-dirclean</code> target MUST completely rm $(BUILD_DIR)/
+    package-version.</p>
 
-    <p>Lines <a href="#line51">51-58</a> adds the target <code>foo</code> to the list
-    of targets to be compiled by Buildroot by first checking if
+    <p>Lines <a href="#line51">51-58</a> adds the target <code>foo</code> to 
+    the list of targets to be compiled by Buildroot by first checking if
     the configuration option for this package has been enabled
     using the configuration tool, and if so then &quot;subscribes&quot;
     this package to be compiled by adding it to the TARGETS
     global variable.  The name added to the TARGETS global
     variable is the name of this package's target, as defined on
-    line <a href="#line40">40</a>, which is used by Buildroot to download, compile, and
-    then install this package.</p>
+    line <a href="#line40">40</a>, which is used by Buildroot to download, 
+    compile, and then install this package.</p>
 
 
     <h3>Conclusion</h3>
