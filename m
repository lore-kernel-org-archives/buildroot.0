From: Martin Banky <martin.banky@gmail.com>
Date: Tue, 12 Oct 2010 15:17:55 -0700
Subject: [Buildroot] [PATCH 4/4] buildroot.html: Fix grammer and punctuation
In-Reply-To: <1286921875-32681-1-git-send-email-Martin.Banky@gmail.com>
References: <1286921875-32681-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286921875-32681-5-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, clarified some of the information given.

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 docs/buildroot.html |  241 ++++++++++++++++++++++++++-------------------------
 1 files changed, 123 insertions(+), 118 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index 5eff1ba..ae0b524 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -94,7 +94,7 @@
 
     <p>You might wonder why such a tool is needed when you can compile
     <code>gcc</code>, <code>binutils</code>, <code>uClibc</code> and all
-    the other tools by hand. Of course doing so is possible. But, dealing with 
+    the other tools by hand. Of course doing so is possible but, dealing with 
     all of the configure options and problems of every <code>gcc</code> or 
     <code>binutils</code> version is very time-consuming and uninteresting. 
     Buildroot automates this process through the use of Makefiles and has a 
@@ -111,7 +111,7 @@
 
     <p>Buildroot releases are made approximately every 3
     months. Direct Git access and daily snapshots are also
-    available if you want more bleeding edge.</p>
+    available, if you want more bleeding edge.</p>
 
     <p>Releases are available at 
     <a href="http://buildroot.net/downloads/">http://buildroot.net/downloads/</a>.</p>
@@ -121,7 +121,7 @@
     and previous snapshots are also available at 
     <a href="http://buildroot.net/downloads/snapshots/">http://buildroot.net/downloads/snapshots/</a>.</p>
 
-    <p>To download Buildroot using Git you can simply follow
+    <p>To download Buildroot using Git, you can simply follow
     the rules described on the &quot;Accessing Git&quot; page 
     (<a href= "http://buildroot.net/git.html">http://buildroot.net/git.html</a>)
     of the Buildroot website 
@@ -166,7 +166,7 @@
     the <code>libncurses5-dev</code> package is required to use the <i>
     menuconfig</i> interface, <code>libqt3-mt-dev</code> is required to use 
     the <i>xconfig</i> interface, and <code>libglib2.0-dev, libgtk2.0-dev 
-    and libglade2-dev</code> are needed to used the <i>gconfig</i> interface.</p>
+    and libglade2-dev</code> are needed to use the <i>gconfig</i> interface.</p>
 
     <p>For each menu entry in the configuration tool, you can find associated 
     help that describes the purpose of the entry.</p>
@@ -218,10 +218,10 @@
       libraries and applications for the target that depend on other 
       libraries.</li>
 
-      <li><code>target/</code> which contains <i>almost</i> the root 
-      filesystem for the target: everything needed is present except the 
-      device files in <code>/dev/</code> (Buildroot can't create them 
-      because Buildroot doesn't run as root and does not want to run as 
+      <li><code>target/</code> which contains <i>almost</i> the complete 
+      root filesystem for the target: everything needed is present except 
+      the device files in <code>/dev/</code> (Buildroot can't create them 
+      because Buildroot doesn't run as root and doesn't want to run as 
       root). Therefore, this directory <b>should not be used on your target</b>.
       Instead, you should use one of the images built in the 
       <code>images/</code> directory. If you need an extracted image of the 
@@ -229,10 +229,12 @@
       generated in <code>images/</code> and extract it as root.<br/>Compared 
       to <code>staging/</code>, <code>target/</code> contains only the 
       files and libraries needed to run the selected target applications: 
-      the development files (headers, etc.) are not present.</li>
+      the development files (headers, etc.) are not present, unless the
+      <code>development files in target filesystem</code> option is selected.
+      </li>
 
       <li><code>host/</code> contains the installation of tools compiled for 
-      the host that are needed for the proper execution of Buildroot except 
+      the host that are needed for the proper execution of Buildroot, except 
       for the cross-compilation toolchain which is installed under 
       <code>staging/</code>.</li>
 
@@ -287,13 +289,13 @@
 
     <h3 id="environment_variables">Environment variables</h3>
 
-    <p>Buildroot also honors some environment variables when they are passed
+    <p>Buildroot also honors some environment variables, when they are passed
     to <code>make</code> or set in the environment:</p>
     <ul>
       <li><code>HOSTCXX</code>, the host C++ compiler to use</li>
       <li><code>HOSTCC</code>, the host C compiler to use</li>
       <li><code>UCLIBC_CONFIG_FILE=&lt;path/to/.config&gt;</code>, path to 
-      the uClibc configuration file to use to compile uClibc if an 
+      the uClibc configuration file, used to compile uClibc, if an 
       internal toolchain is being built</li>
       <li><code>BUSYBOX_CONFIG_FILE=&lt;path/to/.config&gt;</code>, path to 
       the Busybox configuration file</li>
@@ -305,14 +307,14 @@
     in your $HOME:</p>
 
 <pre>
-$ make UCLIBC_CONFIG_FILE=uClibc.config BUSYBOX_CONFIG_FILE=$HOME/bb.config
+ $ make UCLIBC_CONFIG_FILE=uClibc.config BUSYBOX_CONFIG_FILE=$HOME/bb.config
 </pre>
 
     <p>If you want to use a compiler other than the default <code>gcc</code>
     or <code>g++</code> for building helper-binaries on your host, then do</p>
 
 <pre>
-$ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
+ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 </pre>
 
 	<h2 id="custom_targetfs">Customizing the generated target filesystem</h2>
@@ -335,20 +337,20 @@ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
       can't do everything on this target filesystem skeleton, but changes to 
       it do remain even if you completely rebuild the cross-compilation 
       toolchain and the tools. <br /> You can also customize the <code>
-      target/generic/device_table.txt</code> file which is used by the 
+      target/generic/device_table.txt</code> file, which is used by the 
       tools that generate the target filesystem image to properly set 
       permissions and create device nodes.<br /> These customizations are 
       deployed into <code>output/target/</code> just before the actual image 
       is made. Simply rebuilding the image by running make should propagate 
       any new changes to the image.</li>
 
-      <li>Add support for your own target in Buildroot so that you
+      <li>Add support for your own target in Buildroot, so that you
       have your own target skeleton (see <a href="#board_support">this
       section</a> for details).</li>
 
       <li>In the Buildroot configuration, you can specify the path to a 
-      post-build script that gets called <i>after</i> Buildroot builds all 
-      the selected software but <i>before</i> the the rootfs packages are 
+      post-build script, that gets called <i>after</i> Buildroot builds all 
+      the selected software, but <i>before</i> the rootfs packages are 
       assembled. The destination root filesystem folder is given as the 
       first argument to this script, and this script can then be used to 
       copy programs, static data or any other needed file to your target 
@@ -360,7 +362,7 @@ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
       <li>A special package, <i>customize</i>, stored in
       <code>package/customize</code> can be used. You can put all the
       files that you want to see in the final target root filesystem
-      in <code>package/customize/source</code> and then enable this
+      in <code>package/customize/source</code>, and then enable this
       special package in the configuration system.</li>
     </ul>
 
@@ -368,10 +370,10 @@ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 
     <p><a href="http://www.busybox.net/">Busybox</a> is very configurable, 
     and you may want to customize it. You can follow these simple steps to 
-    do so. This method isn't optimal, but it's simple and it works:</p>
+    do so. This method isn't optimal, but it's simple, and it works:</p>
 
     <ol>
-      <li>Do an initial compilation of Buildroot with busybox without 
+      <li>Do an initial compilation of Buildroot, with busybox, without 
       trying to customize it.</li>
 
       <li>Invoke <code>make busybox-menuconfig</code>.
@@ -382,8 +384,8 @@ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
     </ol>
 
     <p>Otherwise, you can simply change the
-    <code>package/busybox/busybox-&lt;version&gt;.config</code> file if you
-    know the options you want to change without using the configuration tool.
+    <code>package/busybox/busybox-&lt;version&gt;.config</code> file, if you
+    know the options you want to change, without using the configuration tool.
     </p>
     
     <p>If you want to use an existing config file for busybox, then see
@@ -391,8 +393,8 @@ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 
     <h2 id="custom_uclibc">Customizing the uClibc configuration</h2>
 
-    <p>Just like <a href="#custom_busybox">BusyBox</a>, <a
-    href="http://www.uclibc.org/">uClibc</a> offers a lot of
+    <p>Just like <a href="#custom_busybox">BusyBox</a>, 
+    <a href="http://www.uclibc.org/">uClibc</a> offers a lot of
     configuration options. They allow you to select various
     functionalities depending on your needs and limitations.</p>
 
@@ -420,7 +422,7 @@ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 
     <p>Otherwise, you can simply change
     <code>toolchain/uClibc/uClibc.config</code> or
-    <code>toolchain/uClibc/uClibc.config-locale</code> without running
+    <code>toolchain/uClibc/uClibc.config-locale</code>, without running
     the configuration assistant.</p>
 
     <p>If you want to use an existing config file for uclibc, then see
@@ -428,11 +430,12 @@ $ make HOSTCXX=g++-4.3-HEAD HOSTCC=gcc-4.3-HEAD
 
     <h2 id="custom_linux26">Customizing the Linux kernel configuration</h2>
 
-    <p>The Linux kernel configuration can be customized just like <a
-    href="#custom_busybox">BusyBox</a> and <a href="#custom_uclibc">uClibc</a>
-    using <code>make linux26-menuconfig</code>. Make sure you have
-    enabled the kernel build in <code>make menuconfig</code> first.
-    Once done, run <code>make</code> to (re)build everything.</p>
+    <p>The Linux kernel configuration can be customized just like 
+    <a href="#custom_busybox">BusyBox</a> and 
+    <a href="#custom_uclibc">uClibc</a> using <code>make linux26-menuconfig
+    </code>. Make sure you have enabled the kernel build in <code>make 
+    menuconfig</code> first. Once done, run <code>make</code> to (re)build 
+    everything.</p>
 
     <p>If you want to use an existing config file for Linux, then see
     section <a href="#environment_variables">environment variables</a>.</p>
@@ -501,13 +504,13 @@ $(ZLIB_DIR)/libz.a: $(ZLIB_DIR)/.configured
     <code>output/build/zlib-version/libz.a</code>.</p>
 
     <p>Note that most packages, if not all, will progressively be
-    ported over the generic or the autotools infrastructure, making it
+    ported over to the generic or autotools infrastructure, making it
     much easier to rebuild individual packages.</p>
 
     <h2 id="buildroot_innards">How Buildroot works</h2>
 
     <p>As mentioned above, Buildroot is basically a set of Makefiles that 
-    downloads, configures and compiles software with the correct options. It 
+    download, configure, and compile software with the correct options. It 
     also includes patches for various software packages &mdash;  mainly the 
     ones involved in the cross-compilation tool chain (<code>gcc</code>, 
     <code>binutils</code> and <code>uClibc</code>).</p>
@@ -632,7 +635,7 @@ endif
       <code>BOARD_PATH</code> variable set to
       <code>target/device/yourcompany/project-foobar</code> as it
       will simplify further definitions. Then, the file might define
-      one or several of the following variables:
+      one or more of the following variables:
         <ul>
           <li><code>TARGET_SKELETON</code> to a directory that contains
           the target skeleton for your project. If this variable is
@@ -658,7 +661,7 @@ endif
 
     <h2 id="using_toolchain">Using the generated toolchain outside Buildroot</h2>
 
-    <p>You may want to compile for your target your own programs or other 
+    <p>You may want to compile, for your target, your own programs or other 
     software that are not packaged in Buildroot. In order to do this you can 
     use the toolchain that was generated by Buildroot.</p>
 
@@ -686,7 +689,7 @@ endif
     downloaded by the Makefiles are all stored in the <code>DL_DIR</code> 
     which by default is the <code>dl</code> directory. It's useful, for 
     example, if you want to keep a complete version of Buildroot which is 
-    know to be working with the associated tarballs. This will allow you to 
+    known to be working with the associated tarballs. This will allow you to 
     regenerate the toolchain and the target filesystem with exactly the same 
     versions.</p>
 
@@ -695,7 +698,7 @@ endif
     link from the <code>dl</code> directory to the shared download location:</p>
 
 <pre>
-ln -s &lt;shared download location&gt; dl
+ $ ln -s &lt;shared download location&gt; dl
 </pre>
 
     <p>Another way of accessing a shared download location is to
@@ -705,7 +708,7 @@ ln -s &lt;shared download location&gt; dl
     <code>&quot;~/.bashrc&quot;</code>.</p>
 
 <pre>
-export BUILDROOT_DL_DIR &lt;shared download location&gt;
+ $ export BUILDROOT_DL_DIR &lt;shared download location&gt;
 </pre>
 
     <h2 id="external_toolchain">Using an external toolchain</h2>
@@ -718,7 +721,7 @@ export BUILDROOT_DL_DIR &lt;shared download location&gt;
     <i>uClibc</i>). Buildroot supports using an <i>external
     toolchain</i>.</p>
 
-    <p>To enable the use of an external toolchain, go in the
+    <p>To enable the use of an external toolchain, go to the
     <code>Toolchain</code> menu, and :</p>
 
     <ul>
@@ -747,10 +750,10 @@ export BUILDROOT_DL_DIR &lt;shared download location&gt;
 
     <h2 id="add_packages">Adding new packages to Buildroot</h2>
 
-    <p>This section covers how new packages (userspace libraries or 
-    applications) can be integrated into Buildroot. It also allows to 
-    understand how existing packages are integrated, which is needed to fix 
-    issues or tune their configuration.</p>
+    <p>This section covers how new packages (userspace libraries or
+    applications) can be integrated into Buildroot. It also shows how existing 
+    packages are integrated, which is needed for fixing issues or tuning their 
+    configuration.</p>
 
     <ul>
       <li><a href="#package-directory">Package directory</a></li>
@@ -770,13 +773,12 @@ export BUILDROOT_DL_DIR &lt;shared download location&gt;
     <h3 id="package-directory">Package directory</h3>
 
     <p>First of all, create a directory under the <code>package</code>
-    directory for your software, for example <code>foo</code>.</p>
+    directory for your software, for example <code>libfoo</code>.</p>
 
     <p>Some packages have been grouped by topic in a sub-directory:
-    <code>multimedia</code>, <code>java</code>, <code>databases</code>,
-    <code>editors</code>, <code>x11r7</code>, <code>games</code>. If your 
-    package fits in one of these categories, then create your package 
-    directory in these.</p>
+    <code>multimedia</code>, <code>java</code>, <code>x11r7</code>, and
+    <code>games</code>. If your package fits in one of these
+    categories, then create your package directory in these.</p>
 
     <h3 id="config-in-file"><code>Config.in</code> file</h3>
 
@@ -816,35 +818,35 @@ source "package/libfoo/Config.in"
     <h3 id="mk-file">The <code>.mk</code> file</h3>
 
     <p>Finally, here's the hardest part. Create a file named
-    <code>foo.mk</code>. It describes how the package should be
+    <code>libfoo.mk</code>. It describes how the package should be
     downloaded, configured, built, installed, etc.</p>
 
     <p>Depending on the package type, the <code>.mk</code> file must be
     written in a different way, using different infrastructures:</p>
 
     <ul>
-      <li>Makefiles for generic packages (not using autotools), based on an 
-      infrastructure similar to the one used for autotools-based packages, 
-      but which requires a little more work from the developer : specify 
-      what should be done at for the configuration, compilation, installation 
-      and cleanup of the package. This infrastructure must be used for all 
-      packages that do not use the autotools as their build system. In the 
-      future, other specialized infrastructures might be written for other 
-      build systems.<br/>We cover them through a 
-      <a href="#generic-tutorial">tutorial</a> and a 
+      <li><b>Makefiles for generic packages</b> (not using autotools): These 
+      are based on an infrastructure similar to the one used for 
+      autotools-based packages, but requires a little more work from the 
+      developer. They specify what should be done for the configuration, 
+      compilation, installation and cleanup of the package. This 
+      infrastructure must be used for all packages that do not use the 
+      autotools as their build system. In the future, other specialized 
+      infrastructures might be written for other build systems.<br/>We cover 
+      them through a <a href="#generic-tutorial">tutorial</a> and a 
       <a href="#generic-reference">reference</a>.</li>
 
-      <li>Makefiles for autotools-based (autoconf, automake, etc.) software. 
-      We provide a dedicated infrastructure for such packages, since 
-      autotools is a very common build system. This infrastructure <i>must 
+      <li><b>Makefiles for autotools-based software</b> (autoconf, automake, 
+      etc.): We provide a dedicated infrastructure for such packages, since 
+      autotools is a very common build system. This infrastructure <i>must
       </i> be used for new packages that rely on the autotools as their 
       build system.<br/>We cover them through a 
       <a href="#autotools-tutorial">tutorial</a> and a 
       <a href="#autotools-reference">reference</a>.</li>
 
-      <li>Manual Makefiles. These are currently obsolete and no new manual 
-      Makefiles should be added. However, since there are still many of them 
-      in the tree and because the , we keep them documented in a
+      <li><b>Manual Makefiles:</b> These are currently obsolete, and no new 
+      manual Makefiles should be added. However, since there are still many 
+      of them in the tree, we keep them documented in a 
       <a href="#manual-tutorial">tutorial</a>.</li>
     </ul>
 
@@ -880,7 +882,7 @@ source "package/libfoo/Config.in"
 <span style="color: #000000">27:</span><span style="color: #009900"> $(eval $(call GENTARGETS,package,libfoo))</span>
 </pre>
 
-    <p>The Makefile begins on line 6 to 8 by metadata informations: the 
+    <p>The Makefile begins on line 6 to 8 with metadata information: the 
     version of the package (<code>LIBFOO_VERSION</code>), the name of the 
     tarball containing the package (<code>LIBFOO_SOURCE</code>) and the 
     Internet location at which the tarball can be downloaded 
@@ -890,7 +892,7 @@ source "package/libfoo/Config.in"
     name is defined).</p>
 
     <p>On line 9, we specify that this package wants to install something to 
-    the staging space. This is often needed for libraries since they must 
+    the staging space. This is often needed for libraries, since they must 
     install header files and other development files in the staging space. 
     This will ensure that the commands listed in the 
     <code>LIBFOO_INSTALL_STAGING_CMDS</code> variable will be executed.</p>
@@ -932,13 +934,13 @@ source "package/libfoo/Config.in"
       <li>The second argument is the lower-cased package name. It must match 
       the prefix of the variables in the <code>.mk</code> file and must 
       match the configuration option name in the <code>Config.in</code> 
-      file. For example, if the package name is <code>libfoo</code>, so the 
-      variables in the <code>.mk</code> must start with 
+      file. For example, if the package name is <code>libfoo</code>, then the 
+      variables in the <code>.mk</code> file must start with 
       <code>LIBFOO_</code> and the configuration option in the 
       <code>Config.in</code> file must be <code>BR2_PACKAGE_LIBFOO</code>.</li>
 
       <li>The third argument is optional. It can be used to tell if the 
-      package if a target package (cross-compiled for the target) or a host 
+      package is a target package (cross-compiled for the target) or a host 
       package (natively compiled for the host). If unspecified, it is 
       assumed that it is a target package. See below for details.</li>
     </ul>
@@ -958,7 +960,7 @@ $(eval $(call GENTARGETS,package,libfoo,host))
     <code>libfoo</code>, then the name of the package for the target is also 
     <code>libfoo</code>, while the name of the package for the host is 
     <code>host-libfoo</code>. These names should be used in the DEPENDENCIES 
-    variables of other packages if they depend on <code>libfoo</code> or 
+    variables of other packages, if they depend on <code>libfoo</code> or 
     <code>host-libfoo</code>.</p>
 
     <p>The call to the <code>GENTARGETS</code> macro <b>must</b> be at the 
@@ -975,14 +977,14 @@ $(eval $(call GENTARGETS,package,libfoo,host))
     details.</p>
 
     <p>The list of variables that can be set in a <code>.mk</code> file to 
-    give metadata informations is (assuming the package name is 
+    give metadata information is (assuming the package name is 
     <code>libfoo</code>) :</p>
 
     <ul>
       <li><code>LIBFOO_VERSION</code>, mandatory, must contain the version 
       of the package. Note that if <code>HOST_LIBFOO_VERSION</code> doesn't 
-      exist, it is assumed to be the same as <code>LIBFOO_VERSION</code>.
-      <br/>Example: <code>LIBFOO_VERSION=0.1.2</code></li>
+      exist, it is assumed to be the same as <code>LIBFOO_VERSION</code>.<br/>
+      Example: <code>LIBFOO_VERSION = 0.1.2</code></li>
 
       <li><code>LIBFOO_SOURCE</code> may contain the name of the tarball of 
       the package. If <code>HOST_LIBFOO_SOURCE</code> is not specified, it 
@@ -1006,7 +1008,7 @@ $(eval $(call GENTARGETS,package,libfoo,host))
       specified, then the location is assumed to be 
       <code>http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/packagename</code>.
       <br/>Example: 
-      <code>LIBFOO_SITE=http://www.foosoftware.org/libfoo</code>.</li>
+      <code>LIBFOO_SITE=http://www.libfoosoftware.org/libfoo</code>.</li>
 
       <li><code>LIBFOO_DEPENDENCIES</code> lists the dependencies (in terms 
       of package name) that are required for the current target package to 
@@ -1029,7 +1031,7 @@ $(eval $(call GENTARGETS,package,libfoo,host))
     syntax:</p>
 
 <pre>
-LIBFOO_VERSION=2.32
+LIBFOO_VERSION = 2.32
 </pre>
 
     <p>Now, the variables that define what should be performed at the 
@@ -1053,9 +1055,11 @@ LIBFOO_VERSION=2.32
       to be performed to install the package to the target directory, when 
       the package is a target package. The package must install its files to 
       the directory given by <code>$(TARGET_DIR)</code>. Only the files 
-      required for <i>execution</i> of the package 
-      should be installed. Header files and documentation should not be 
-      installed.</li>
+      required for <i>documentation</i> and <i>execution</i> of the package 
+      should be installed. Header files should not be installed, they will 
+      be copied to the target, if the 
+      <code>development files in target filesystem</code> option is selected.
+      </li>
 
       <li><code>LIBFOO_INSTALL_STAGING_CMDS</code>, used to list the actions 
       to be performed to install the package to the staging directory, when 
@@ -1104,12 +1108,16 @@ endef
     </ul>
 
     <p>The last feature of the generic infrastructure is the ability to add 
-    hook more actions after existing steps. These hooks aren't really useful 
-    for generic packages, since the <code>.mk</code> file already has full 
-    control over the actions performed in each step of the package 
-    construction. The hooks are more useful for packages using the autotools 
-    infrastructure described below. But since they are provided by the 
-    generic infrastructure, they are documented here.</p>
+    hooks. These define further actions to perform after existing steps. 
+    Most hooks aren't really useful for generic packages, since the 
+    <code>.mk</code> file already has full control over the actions 
+    performed in each step of the package construction. The hooks are more 
+    useful for packages using the autotools infrastructure described below. 
+    However, since they are provided by the generic infrastructure, they are 
+    documented here. The exception is <code>LIBFOO_POST_PATCH_HOOKS</code>. 
+    Patching the package is not user definable, so 
+    <code>LIBFOO_POST_PATCH_HOOKS</code> will be userful for generic packages.
+    </p>
 
     <p>The following hook points are available:</p>
 
@@ -1122,7 +1130,7 @@ endef
       <li><code>LIBFOO_POST_INSTALL_TARGET_HOOKS</code> (for target packages only)</li>
     </ul>
 
-    <p>This variables are <i>lists</i> of variable names containing actions 
+    <p>These variables are <i>lists</i> of variable names containing actions 
     to be performed at this hook point. This allows several hooks to be 
     registered at a given hook point. Here is an example:</p>
 
@@ -1205,7 +1213,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     works by defining a number of variables before calling the 
     <code>AUTOTARGETS</code> macro.</p>
 
-    <p>First, all the package meta-information variables that exist in the 
+    <p>First, all the package metadata information variables that exist in the 
     generic infrastructure also exist in the autotools infrastructure: 
     <code>LIBFOO_VERSION</code>, <code>LIBFOO_SOURCE</code>, 
     <code>LIBFOO_PATCH</code>, <code>LIBFOO_SITE</code>, 
@@ -1230,11 +1238,11 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
       options to pass to the configure script. By default, empty.</li>
 
       <li><code>LIBFOO_MAKE</code>, to specify an alternate <code>make</code>
-      command. This is typically useful when parallel make it enabled in 
+      command. This is typically useful when parallel make is enabled in 
       the configuration (using <code>BR2_JLEVEL</code>) but that this 
       feature should be disabled for the given package, for one reason or 
       another. By default, set to <code>$(MAKE)</code>. If parallel building 
-      is not supported by the package, then it should do 
+      is not supported by the package, then it should be set to 
       <code>LIBFOO_MAKE=$(MAKE1)</code>.</li>
 
       <li><code>LIBFOO_MAKE_ENV</code>, to specify additional environment 
@@ -1261,11 +1269,11 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
       default, the value is <code>YES</code></li>
 
       <li><code>LIBFOO_USE_CONFIG_CACHE</code> tells whether the configure 
-      script should really on a cache file that caches test results from 
-      previous configure script. Usually, this variable should be left to 
-      its default value. Only for specific packages having issues with the 
-      configure cache can set this variable to the <code>NO</code> value 
-      (but this is more a work-around than a really fix)</li>
+      script should use the central configure cache, which caches test 
+      results from previous configure scripts. Usually, this variable should 
+      be left to its default value. Only packages having issues with the 
+      configure cache, can set this variable to the <code>NO</code> value 
+      (but this is more of a work-around than a fix)</li>
 
       <li><code>LIBFOO_INSTALL_STAGING_OPT</code> contains the make options 
       used to install the package to the staging directory. By default, the 
@@ -1275,12 +1283,9 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
 
       <li><code>LIBFOO_INSTALL_TARGET_OPT</code> contains the make options 
       used to install the package to the target directory. By default, the 
-      value is <code>DESTDIR=$$(TARGET_DIR) install-strip</code> if 
-      <code>BR2_ENABLE_DEBUG</code> is not set, and 
-      <code>DESTDIR=$$(TARGET_DIR) install-exec</code> if 
-      <code>BR2_ENABLE_DEBUG</code> is set. These default values are correct 
-      for most autotools packages, but it is still possible to override them 
-      if needed.</li>
+      value is <code>DESTDIR=$$(TARGET_DIR) install</code>. The default 
+      value is correct for most autotools packages, but it is still possible 
+      to override it if needed.</li>
 
       <li><code>LIBFOO_CLEAN_OPT</code> contains the make options used to 
       clean the package. By default, the value is <code>clean</code>.</li>
@@ -1297,7 +1302,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     <p>With the autotools infrastructure, all the steps required to build 
     and install the packages are already defined, and they generally work 
     well for most autotools-based packages. However, when required, it is 
-    still possible to customize what is done in particular step:</p>
+    still possible to customize what is done in any particular step:</p>
 
     <ul>
       <li>By adding a post-operation hook (after extract, patch, configure, 
@@ -1305,7 +1310,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
       infrastructure for details.</li>
 
       <li>By overriding one of the steps. For example, even if the autotools 
-      infrastructure is used, if the package <code>.mk</code> defines its 
+      infrastructure is used, if the package <code>.mk</code> file defines its 
       own <code>LIBFOO_CONFIGURE_CMDS</code> variable, it will be used 
       instead of the default autotools one. However, using this method 
       should be restricted to very specific cases. Do not use it in the 
@@ -1317,7 +1322,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     <p><b>NOTE: new manual makefiles should not be created, and existing 
     manual makefiles should be converted either to the generic 
     infrastructure or the autotools infrastructure. This section is only 
-    kept to document the existing manual makefiles and help understanding 
+    kept to document the existing manual makefiles and to help understand 
     how they work.</b></p>
 
 <pre>
@@ -1419,11 +1424,11 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
 
     <p>Lines <a href="#ex2line16">16-18</a> define a target and associated 
     rules that uncompress the downloaded tarball. As you can see, this 
-    target depends on the tarball file so that the previous target (lines <a 
-    href="#ex2line13">13-14</a>) is called before executing the rules of the 
-    current target. Uncompressing is followed by <i>touching</i> a hidden 
-    file to mark the software as having been uncompressed. This trick is 
-    used everywhere in a Buildroot Makefile to split steps (download, 
+    target depends on the tarball file so that the previous target (lines 
+    <a href="#ex2line13">13-14</a>) is called before executing the rules of 
+    the current target. Uncompressing is followed by <i>touching</i> a 
+    hidden file to mark the software as having been uncompressed. This trick 
+    is used everywhere in a Buildroot Makefile to split steps (download, 
     uncompress, configure, compile, install) while still having correct 
     dependencies.</p>
 
@@ -1435,7 +1440,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     cross-compilation, <code>target</code>, <code>host</code> and 
     <code>build</code> arguments are given. The prefix is also set to 
     <code>/usr</code>, not because the software will be installed in 
-    <code>/usr</code> on your host system, but because the software will bin 
+    <code>/usr</code> on your host system, but because the software will be 
     installed in <code> /usr</code> on the target filesystem. Finally it 
     creates a <code>.configured</code> file to mark the software as 
     configured.</p>
@@ -1458,7 +1463,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     to save space. </p>
 
     <p>Line <a href="#ex2line40">40</a> defines the main target of the 
-    software &mdash; the one that will be eventually be used by the top level 
+    software &mdash; the one that will eventually be used by the top level 
     <code>Makefile</code> to download, compile, and then install this 
     package. This target should first of all depend on all needed 
     dependencies of the software (in our example, <i>uclibc</i> and 
@@ -1468,13 +1473,13 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     <p>Line <a href="#ex2line42">42</a> defines a simple target that only 
     downloads the code source. This is not used during normal operation of 
     Buildroot, but is needed if you intend to download all required sources 
-    at once for later offline build. Note that if you add a new package 
+    at once for later offline build. Note that if you add a new package, 
     providing a <code>libfoo-source</code> target is <i>mandatory</i> to 
-    support users that wish to do offline-builds. Furthermore it eases 
+    support users that wish to do offline-builds. Furthermore, it eases 
     checking if all package-sources are downloadable.</p>
 
     <p>Lines <a href="#ex2line44">44-46</a> define a simple target to clean 
-    the software build by calling the Makefiles with the appropriate option. 
+    the software build by calling the Makefile with the appropriate options. 
     The <code>-clean</code> target should run <code>make clean</code> on 
     $(BUILD_DIR)/package-version and MUST uninstall all files of the package 
     from $(STAGING_DIR) and from $(TARGET_DIR).</p>
@@ -1485,7 +1490,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     completely rm $(BUILD_DIR)/ package-version.</p>
 
     <p>Lines <a href="#ex2line51">51-58</a> add the target <code>libfoo</code> 
-    to the list of targets to be compiled by Buildroot by first checking if 
+    to the list of targets to be compiled by Buildroot, by first checking if 
     the configuration option for this package has been enabled using the 
     configuration tool. If so, it then &quot;subscribes&quot; this package 
     to be compiled by adding the package to the TARGETS global variable.  
@@ -1497,14 +1502,14 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
     <h3 id="gettext-integration">Gettext integration and interaction with packages</h3>
 
     <p>Many packages that support internationalization use the gettext 
-    library. Dependency on this library are fairly complicated and therefore 
-    deserves a few explanations.</p>
+    library. Dependencies for this library are fairly complicated and therefore, 
+    deserves some explanation.</p>
 
     <p>The <i>uClibc</i> C library doesn't implement gettext functionality, 
     therefore with this C library, a separate gettext must be compiled. On 
     the other hand, the <i>glibc</i> C library does integrate its own 
     gettext, and in this case, the separate gettext library should not be 
-    compiled, because it creates various kind of build failures.</p>
+    compiled, because it creates various kinds of build failures.</p>
 
     <p>Additionally, some packages (such as libglib2) do require gettext 
     unconditionally, while other packages (those who support 
@@ -1525,7 +1530,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
 
     <ol>
       <li>Use <code>select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT</code> 
-      and possibly <code>select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT</code> 
+      and possibly <code>select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT</code>, 
       if libintl is also needed</li>
 
       <li>Use <code>$(if $(BR2_NEEDS_GETTEXT),gettext)</code> in the package 
@@ -1539,7 +1544,7 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
       <li>Use 
       <code>select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE</code> 
       and possibly 
-      <code>select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE</code> 
+      <code>select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE</code>, 
       if libintl is also needed</li>
 
       <li>Use <code>$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)</code> in 
-- 
1.7.3.1
