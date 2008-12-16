From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 16 Dec 2008 01:00:11 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/docs
Message-ID: <20081216090011.C73DFF8007@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-16 01:00:11 -0800 (Tue, 16 Dec 2008)
New Revision: 24430

Log:
docs/buildroot.html: misc small fixes and strip trailing spaces

Modified:
   trunk/buildroot/docs/buildroot.html


Changeset:
Modified: trunk/buildroot/docs/buildroot.html
===================================================================
--- trunk/buildroot/docs/buildroot.html	2008-12-16 07:48:29 UTC (rev 24429)
+++ trunk/buildroot/docs/buildroot.html	2008-12-16 09:00:11 UTC (rev 24430)
@@ -70,7 +70,7 @@
     uses the GNU libc as C standard library.  This compilation
     toolchain is called the &quot;host compilation toolchain&quot;, and more
     generally, the machine on which it is running, and on which you're
-    working is called the &quot;host system&quot;. The compilation toolchain 
+    working is called the &quot;host system&quot;. The compilation toolchain
     is provided by your distribution, and Buildroot has nothing to do
     with it. </p>
 
@@ -173,7 +173,7 @@
     be named <code>root_fs_ARCH.EXT</code> where <code>ARCH</code> is your
     architecture and <code>EXT</code> depends on the type of target filesystem
     selected in the <code>Target options</code> section of the configuration
-    tool. 
+    tool.
     The file is stored in the "binaries/<code>$(PROJECT)</code>/" directory</p>
 
     <h3><a name="local_board_support" id="local_board_support"></a>
@@ -181,7 +181,7 @@
 
     <p>Once a package has been unpacked, it is possible to manually update
     configuration files. Buildroot can automatically save the configuration
-    of buildroot, linux, busybox, uclibc and u-boot in "local/$(PROJECT) by 
+    of buildroot, linux, busybox, uclibc and u-boot in "local/$(PROJECT) by
     using the command:
     </p>
 
@@ -189,7 +189,7 @@
  $ make saveconfig
 </pre>
 
-     <p>Once a buildroot configuration has been created by saveconfig, 
+     <p>Once a buildroot configuration has been created by saveconfig,
      the default "$(TOPDIR)/.config" file can be overridden by</p>
 
 <pre>
@@ -200,7 +200,7 @@
     instead of ".config". </p>
 
     <p>If you want to modify your board, you can copy the project configuration
-     file to ".config" by using the command:</p> 
+     file to ".config" by using the command:</p>
 
 <pre>
  $ make BOARD=&lt;project&gt; getconfig
@@ -208,7 +208,7 @@
 
     <p>You can share your custom board support directory between several buildroot trees
     by setting the environment variable <code>BUILDROOT_LOCAL</code> to this directory,
-    </p> 
+    </p>
 
 
     <h3><a name="offline_builds" id="offline_builds"></a>
@@ -220,7 +220,7 @@
 <pre>
  $ make source
 </pre>
-    <p>You can now disconnect or copy the content of your <code>dl</code> 
+    <p>You can now disconnect or copy the content of your <code>dl</code>
     directory to the build-host. </p>
 
     <h3><a name="building_out_of_tree" id="building_out_of_tree"></a>
@@ -298,8 +298,8 @@
       target filesystem is available under <code>project_build_ARCH/root/</code>
       where <code>ARCH</code> is the chosen target architecture.
       You can simply make your changes here, and run make afterwards, which will
-      rebuild the target filesystem image. This method allows to do everything 
-      on the target filesystem, but if you decide to completely rebuild your 
+      rebuild the target filesystem image. This method allows to do everything
+      on the target filesystem, but if you decide to completely rebuild your
       toolchain and tools, these changes will be lost. </li>
 
       <li>Customize the target filesystem skeleton, available under
@@ -317,7 +317,7 @@
       it should be changed. These main directories are in an tarball inside of
       inside the skeleton because it contains symlinks that would be broken
       otherwise. <br />
-      These customizations are deployed into 
+      These customizations are deployed into
       <code>project_build_ARCH/root/</code> just before the actual image
       is made. So simply rebuilding the image by running
       make should propagate any new changes to the image. </li>
@@ -347,10 +347,10 @@
     </ol>
 
     <p>Otherwise, you can simply change the
-    <code>package/busybox/busybox-&lt;version&gt;.config</code> file if you 
+    <code>package/busybox/busybox-&lt;version&gt;.config</code> file if you
     know the options you want to change without using the configuration tool.
     </p>
-    <p>If you want to use an existing config file for busybox, then see 
+    <p>If you want to use an existing config file for busybox, then see
     section <a href="#environment_variables">environment variables</a>. </p>
 
     <h2><a name="custom_uclibc" id="custom_uclibc"></a>Customizing the uClibc
@@ -390,7 +390,7 @@
     <code>toolchain/uClibc/uClibc.config-locale</code> without running
     the configuration assistant. </p>
 
-    <p>If you want to use an existing config file for uclibc, then see 
+    <p>If you want to use an existing config file for uclibc, then see
     section <a href="#environment_variables">environment variables</a>. </p>
 
     <h2><a name="buildroot_innards" id="buildroot_innards"></a>How Buildroot
@@ -455,24 +455,24 @@
       <li>Create the shared build directory (<code>build_ARCH/</code> by
       default, where <code>ARCH</code> is your architecture). This is where all
       non configurable user-space tools will be compiled.When building two or
-      more targets using the same architecture, the first build will go through 
-      the full download, configure, make process, but the second and later 
-      builds will only copy the result from the first build to its project 
+      more targets using the same architecture, the first build will go through
+      the full download, configure, make process, but the second and later
+      builds will only copy the result from the first build to its project
       specific target directory significantly speeding up the build process</li>
 
-      <li>Create the project specific build directory 
-      (<code>project_build_ARCH/$(PROJECT)</code> by default, where 
-      <code>ARCH</code> is your architecture). This is where all configurable 
-      user-space tools will be compiled. The project specific build directory 
-      is neccessary, if two different targets needs to use a specific package, 
-      but the packages have different configuration for both targets. Some 
+      <li>Create the project specific build directory
+      (<code>project_build_ARCH/$(PROJECT)</code> by default, where
+      <code>ARCH</code> is your architecture). This is where all configurable
+      user-space tools will be compiled. The project specific build directory
+      is neccessary, if two different targets needs to use a specific package,
+      but the packages have different configuration for both targets. Some
       examples of packages built in this directory are busybox and linux.
       </li>
 
-      <li>Create the project specific result directory 
-      (<code>binaries/$(PROJECT)</code> by default, where <code>ARCH</code> 
+      <li>Create the project specific result directory
+      (<code>binaries/$(PROJECT)</code> by default, where <code>ARCH</code>
       is your architecture). This is where the root filesystem images are
-      stored, It is also used to store the linux kernel image and any 
+      stored, It is also used to store the linux kernel image and any
       utilities, boot-loaders etc. needed for a target.
       </li>
 
@@ -512,9 +512,9 @@
     <p>Buildroot has always supported building several projects in the same
     tree if each project was for a different architecture. </p>
 
-    <p>The root file system has been created in the 
+    <p>The root file system has been created in the
     <code>&quot;build_&lt;ARCH&gt;/root&quot;</code>
-    directory which is unique for each architecture. 
+    directory which is unique for each architecture.
     Toolchains have been built in
     <code>&quot;toolchain_build_&lt;ARCH&gt;&quot;</code>. </p>
 
@@ -522,7 +522,7 @@
     architecture, a prefix or suffix could be added in the configuration file
     so the root file system would be built in
     <code>&quot;&lt;PREFIX&gt;_build_&lt;ARCH&gt;_&lt;SUFFIX&gt;/root&quot;</code>
-    By supplying <u>unique</u> combinations of 
+    By supplying <u>unique</u> combinations of
     <code>&quot;&lt;PREFIX&gt;&quot;</code> and
     <code>&quot;&lt;SUFFIX&gt;&quot;</code>
     each project would get a <u>unique</u> root file system tree. </p>
@@ -531,14 +531,14 @@
     built for each project,  adding considerable time to the build
     process, even if it was two projects for the same chip. </p>
 
-    <p>This drawback has been somewhat lessened with 
-    <code>gcc-4.x.y</code> which allows buildroot to use an external 
+    <p>This drawback has been somewhat lessened with
+    <code>gcc-4.x.y</code> which allows buildroot to use an external
     toolchain. Certain packages requires special
     features in the toolchain, and if an external toolchain is selected,
     this may lack the neccessary features to complete the build of the root
      file system.</p>
 
-    <p>A bigger problem was that the 
+    <p>A bigger problem was that the
     <code>&quot;build_&lt;ARCH&gt;&quot;</code> tree
     was also duplicated, so each </code>package</code> would also
     be rebuilt once per project, resulting in even longer build times.</p>
@@ -546,29 +546,29 @@
 
     <p><b>PROJECT TO SHARE TOOLCHAIN AND PACKAGE BUILDS</b></p>
 
-    <p>Work has started on a project which will allow the user to build 
-    multiple root file systems for the same architecture in the same tree. 
+    <p>Work has started on a project which will allow the user to build
+    multiple root file systems for the same architecture in the same tree.
     The toolchain and the package build directory will be shared, but each
     project will have a dedicated directory tree for project specific
     builds. </p>
 
-    <p>With this approach, most, if not all packages will be compiled 
+    <p>With this approach, most, if not all packages will be compiled
     when the first project is built.
     The process is almost identical to the original process.
-    Packages are downloaded and extracted to the shared 
+    Packages are downloaded and extracted to the shared
     <code>&quot;build_&lt;ARCH&gt;/&lt;package&gt;&quot;</code>
-    directory. They are configured and compiled. </p> 
+    directory. They are configured and compiled. </p>
 
     <p>Package libraries and headers are installed in the shared $(STAGING_DIR),
     and then the project specific root file system &quot;$(TARGET_DIR)&quot;
-    is populated. </p> 
+    is populated. </p>
 
     <p>At the end of the build, the root file system will be used
     to generate the resulting root file system binaries. </p>
 
-    <p>Once the first project has been built, building other projects will 
+    <p>Once the first project has been built, building other projects will
     typically involve populating the new project's root file system directory
-    from the existing binaries generated in the shared 
+    from the existing binaries generated in the shared
     <code>&quot;build_&lt;ARCH&gt;/&lt;&gt;&quot;</code> directory. </p>
 
     <p>Only packages, not used by the first project, will have to go
@@ -585,8 +585,8 @@
     <li><code>binaries;</code></li>
     </ul>
 
-    <p>Each of the directories contain one subdirectory per project. 
-    The name of the subdirectory is configured by the user in the 
+    <p>Each of the directories contain one subdirectory per project.
+    The name of the subdirectory is configured by the user in the
     normal buildroot configuration, using the value of: </p>
 
     <p><code>Project Options ---> Project name</code></p>
@@ -620,13 +620,13 @@
     <p>will be created. </p>
 
     <p>Currently, the <u>root file system</u>, <u>busybox</u> and an Atmel
-    customized version of  
+    customized version of
     <u><code>U-Boot</code></u>, as well as some Atmel specific
     bootloaders like <u>at91-bootstrap</u> and <u>dataflashboot.bin</u>
-    are built in 
+    are built in
     <code>&quot;$(PROJECT_BUILD_DIR)&quot;</code>
 
-    <p>The resulting binaries for all architectures are stored in the 
+    <p>The resulting binaries for all architectures are stored in the
     <code>&quot;$(BINARIES_DIR)&quot;</code> directory. <p>
 
     <p><b>SUMMARY</b></p>
@@ -636,13 +636,13 @@
     can configure the build. </p>
 
     <p><b>THINGS TO DO</b></p>
-    
+
     <ol>
 
     <li>Linux</li>
 
     <p>The current Linux implementation is flawed. It only works
-    if the user chooses to use one of the few kernels selected 
+    if the user chooses to use one of the few kernels selected
     as base for the kernel-headers. While the Makefile seems to have
     hooks, allowing the developer to specify whatever version he/she
     wants in the target/device/*/* Makefiles, the build will fail
@@ -650,17 +650,17 @@
 
     <p>The reason for this is that the kernel patches are not
     applied by the <code>&quot;target/linux/linux.mk&quot;</code>
-    build script fragment. They are only applied by the 
+    build script fragment. They are only applied by the
     <code>&quot;toolchain/kernel-headers/*.makefile&quot;</code>
     build script fragments</p>
 
     <p>If the kernel-header version and the linux version differs,
     there will be two <code>&quot;linux-2.6.X.Y&quot;</code>
-    directories in 
+    directories in
     <code>&quot;build_&lt;ARCH&gt;/&lt;&gt;&quot;</code>,
     each with its own set of patches. </p>
 
-    <p>The solution in the works, is to move the build of Linux to     
+    <p>The solution in the works, is to move the build of Linux to
     <code>&quot;project_build_&lt;ARCH&gt;/&lt;project name&gt;/linux-2.6.X.Y&quot;</code> combined with method to configure
      which patches can be applied. Possibly, the linux source tree
      used to generate the kernel headers will be moved to the
@@ -675,18 +675,18 @@
      <li>Conservative Strategy: Only use version ssupported by the kernel headers</li>
      <li>Stable Linux Strategy: Allow any 2.6.X.Y combination.
 	(Minimum 2.6.19)</li>
-     <li>Power-User Strategy: Allow 
+     <li>Power-User Strategy: Allow
      <code>&quot;-git&quot;</code>, or
      <code>&quot;-mm&quot;</code>, or user downloadable kernels</li>
      </ul>
 
      <p>The current kernel patches can be configured to be applied to the
-     linux source tree even if the version differs from the 
+     linux source tree even if the version differs from the
      kernel header version. </p>
 
      <p>Since the user can select any kernel-patch
      he/she will be able to select a non-working combination.
-     If the patch fails, the user will have to generate a new 
+     If the patch fails, the user will have to generate a new
      proprietary kernel-patch or decide to not apply the kernel
      patches</p>
 
@@ -696,10 +696,10 @@
      <p>There will also be a way for the user to supply absolute
      or relative paths to patches, possibly outside the main tree.
      This can be used to apply custom kernel-header-patches, if
-     the versions available in buildroot cannot be applied to the 
+     the versions available in buildroot cannot be applied to the
      specific linux version used</p>
 
-     <p>Maybe, there will also be a possibility to supply an 
+     <p>Maybe, there will also be a possibility to supply an
      <code>&quot;URL&quot;</code> to a patch available on Internet. </p>
 
      <li>Configurable packages</li>
@@ -707,12 +707,12 @@
      <p>Many packages can, on top of the simple
      &quot;enable/disable build&quot;,
      be further configured using Kconfig.
-     Currently these packages will be compiled using the 
+     Currently these packages will be compiled using the
      configuration specified in the
      <code>&quot;.config&quot;</code> file of the <u>first</u>
      project demanding the build of the package.</p>
 
-     <p>If <u>another</u> project uses the same packages, but with 
+     <p>If <u>another</u> project uses the same packages, but with
      a different configuration,these packages will <u>not</u> be rebuilt,
      and the root file system for the new project will be populated
      with files from the build of the <u>first</u> project</p>
@@ -723,8 +723,8 @@
      <code>&quot;build_&lt;ARCH&gt;&quot;</code> directory
      before rebuilding the new project.<p>
 
-     <p>A long term solution is to edit the package makefile and move 
-     the build of the configurable packages from 
+     <p>A long term solution is to edit the package makefile and move
+     the build of the configurable packages from
      <code>&quot;build_&lt;ARCH&gt;&quot;</code> to
      <code>&quot;project_build_&lt;ARCH&gt;/&lt;project name&gt;&quot;</code>
      and send a patch to the buildroot mailing list.
@@ -737,16 +737,16 @@
      <li>Generating File System binaries</li>
      <p>
      Packages which needs to be installed with the &quot;root&quot;
-     as owner, will generate a 
+     as owner, will generate a
      <code>&quot;.fakeroot.&lt;package&gt;&quot;</code> file
      which will be used for the final build of the root file system binary. </p>
 
-     <p>This was previously located in the 
+     <p>This was previously located in the
      <code>&quot;$(STAGING_DIR)&quot;</code> directory, but was
-     recently moved to the 
+     recently moved to the
      <code>&quot;$(PROJECT_BUILD_DIR)&quot;</code> directory. </p>
 
-     <p>Currently only three packages: 
+     <p>Currently only three packages:
      <code>&quot;at&quot;</code>,
      <code>&quot;ltp-testsuite&quot;</code> and
      <code>&quot;nfs-utils&quot;</code>
@@ -764,7 +764,7 @@
      <code>&quot;.fakeroot.&lt;package&gt;&quot;</code>
      files are deleted as the last action of the Buildroot Makefile. </p>
 
-     <p>It needs to be evaluated if any further action for the 
+     <p>It needs to be evaluated if any further action for the
      file system binary build is needed. </p>
 
      </ol>
@@ -816,7 +816,7 @@
     install it somewhere else, so that it can be used to compile other programs
     or by other users. Moving the <code>build_ARCH/staging_dir/</code>
     directory elsewhere is <b>not possible if using gcc-3.x</b>, because there
-    are some hardcoded paths in the toolchain configuration. This works, thanks 
+    are some hardcoded paths in the toolchain configuration. This works, thanks
     to sysroot support, with current, stable gcc-4.x toolchains, of course. </p>
 
     <p>If you want to use the generated gcc-3.x toolchain for other purposes,
@@ -850,7 +850,7 @@
     <p>Another way of accessing a shared download location is to
     create the <code>BUILDROOT_DL_DIR</code> environment variable.
     If this is set, then the value of DL_DIR in the project is
-    overridden. The following line should be added to 
+    overridden. The following line should be added to
     <code>&quot;~/.bashrc&quot;</code>. <p>
 
 <pre>
@@ -911,10 +911,10 @@
    <p>Two types of <i>Makefiles</i> can be written&nbsp;:</p>
 
    <ul>
-    <li>Makefile for autotools-based (autoconf, automake, etc.)
+    <li>Makefiles for autotools-based (autoconf, automake, etc.)
     softwares, are very easy to write thanks to the infrastructure
     available in <code>package/Makefile.autotools.in</code>.</li>
-    <li>Makefile for other types of packages are a little bit more
+    <li>Makefiles for other types of packages are a little bit more
     complex to write.</li>
    </ul>
 
@@ -1048,7 +1048,7 @@
     the other <code>*.mk</code> files in the <code>package</code>
     directory. </p>
 
-    <p>At lines <a href="#ex2line6">6-11</a>, a couple of useful variables are 
+    <p>At lines <a href="#ex2line6">6-11</a>, a couple of useful variables are
     defined :</p>
 
     <ul>
@@ -1078,21 +1078,21 @@
 
     </ul>
 
-    <p>Lines <a href="#ex2line13">13-14</a> defines a target that downloads the 
+    <p>Lines <a href="#ex2line13">13-14</a> defines a target that downloads the
     tarball from the remote site to the download directory
     (<code>DL_DIR</code>). </p>
 
-    <p>Lines <a href="#ex2line16">16-18</a> defines a target and associated rules 
+    <p>Lines <a href="#ex2line16">16-18</a> defines a target and associated rules
     that uncompress the downloaded tarball. As you can see, this target
     depends on the tarball file, so that the previous target (line
-    <a href="#ex2line13">13-14</a>) is called before executing the rules of the 
+    <a href="#ex2line13">13-14</a>) is called before executing the rules of the
     current target. Uncompressing is followed by <i>touching</i> a hidden file
     to mark the software has having been uncompressed. This trick is
     used everywhere in Buildroot <i>Makefile</i> to split steps
     (download, uncompress, configure, compile, install) while still
     having correct dependencies. </p>
 
-    <p>Lines <a href="#ex2line20">20-31</a> defines a target and associated rules 
+    <p>Lines <a href="#ex2line20">20-31</a> defines a target and associated rules
     that configures the software. It depends on the previous target (the
     hidden <code>.source</code> file) so that we are sure the software has
     been uncompressed. In order to configure it, it basically runs the
@@ -1104,14 +1104,14 @@
     filesystem. Finally it creates a <code>.configured</code> file to
     mark the software as configured. </p>
 
-    <p>Lines <a href="#ex2line33">33-34</a> defines a target and a rule that 
+    <p>Lines <a href="#ex2line33">33-34</a> defines a target and a rule that
     compiles the software. This target will create the binary file in the
     compilation directory, and depends on the software being already
     configured (hence the reference to the <code>.configured</code>
     file). It basically runs <code>make</code> inside the source
     directory. </p>
 
-    <p>Lines <a href="#ex2line36">36-38</a> defines a target and associated rules 
+    <p>Lines <a href="#ex2line36">36-38</a> defines a target and associated rules
     that install the software inside the target filesystem. It depends on the
     binary file in the source directory, to make sure the software has
     been compiled. It uses the <code>install</code> target of the
@@ -1122,7 +1122,7 @@
     <code>/usr/man</code> directory inside the target filesystem is
     removed to save space. </p>
 
-    <p>Line <a href="#ex2line40">40</a> defines the main target of the software, 
+    <p>Line <a href="#ex2line40">40</a> defines the main target of the software,
     the one that will be eventually be used by the top level
     <code>Makefile</code> to download, compile, and then install
     this package. This target should first of all depends on all
@@ -1131,33 +1131,33 @@
     final binary. This last dependency will call all previous
     dependencies in the correct order. </p>
 
-    <p>Line <a href="#ex2line42">42</a> defines a simple target that only 
-    downloads the code source. This is not used during normal operation of 
-    Buildroot, but is needed if you intend to download all required sources at 
+    <p>Line <a href="#ex2line42">42</a> defines a simple target that only
+    downloads the code source. This is not used during normal operation of
+    Buildroot, but is needed if you intend to download all required sources at
     once for later offline build. Note that if you add a new package providing
     a <code>foo-source</code> target is <i>mandatory</i> to support
     users that wish to do offline-builds. Furthermore it eases checking
     if all package-sources are downloadable. </p>
 
-    <p>Lines <a href="#ex2line44">44-46</a> define a simple target to clean the 
+    <p>Lines <a href="#ex2line44">44-46</a> define a simple target to clean the
     software build by calling the <i>Makefiles</i> with the appropriate option.
     The <code>-clean</code> target should run <code>make clean</code>
     on $(BUILD_DIR)/package-version and MUST uninstall all files of the
     package from $(STAGING_DIR) and from $(TARGET_DIR). </p>
 
-    <p>Lines <a href="#ex2line48">48-49</a> define a simple target to completely 
+    <p>Lines <a href="#ex2line48">48-49</a> define a simple target to completely
     remove the directory in which the software was uncompressed, configured and
     compiled. The <code>-dirclean</code> target MUST completely rm $(BUILD_DIR)/
     package-version. </p>
 
-    <p>Lines <a href="#ex2line51">51-58</a> adds the target <code>foo</code> to 
+    <p>Lines <a href="#ex2line51">51-58</a> adds the target <code>foo</code> to
     the list of targets to be compiled by Buildroot by first checking if
     the configuration option for this package has been enabled
     using the configuration tool, and if so then &quot;subscribes&quot;
     this package to be compiled by adding it to the TARGETS
     global variable.  The name added to the TARGETS global
     variable is the name of this package's target, as defined on
-    line <a href="#ex2line40">40</a>, which is used by Buildroot to download, 
+    line <a href="#ex2line40">40</a>, which is used by Buildroot to download,
     compile, and then install this package. </p>
 
 
