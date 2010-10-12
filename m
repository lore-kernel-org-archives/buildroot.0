From: Martin Banky <martin.banky@gmail.com>
Date: Tue, 12 Oct 2010 15:17:54 -0700
Subject: [Buildroot] [PATCH 3/4] buildroot.html: html code clean-up and
	other issues - Part2
In-Reply-To: <1286921875-32681-1-git-send-email-Martin.Banky@gmail.com>
References: <1286921875-32681-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286921875-32681-4-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The current DocType declaration was incorrect. It is neither xhtml strict nor
xhtml transitional. So, instead of dealing with that issue, converted it to
validated Html5.

Fixed white-space errors.
Removed validator html4.01 code.
Color corrected the code sections.
Removed redundant or useless html code.
Changed foo to libfoo, for consistency.
Changed page bookmarking to use header id's.
Re-flowed paragraphs to line break at 80 characters.
Re-formatted the code sections for consistency and correctness.
Kept all list items, headings, and href's on a single line (where possible).

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 docs/buildroot.html | 2138 ++++++++++++++++++++++++---------------------------
 1 files changed, 1009 insertions(+), 1129 deletions(-)

diff --git a/docs/buildroot.html b/docs/buildroot.html
index fc754e5..5eff1ba 100644
--- a/docs/buildroot.html
+++ b/docs/buildroot.html
@@ -857,767 +808,708 @@ config BR2_PACKAGE_LIBFOO
     categories). The files included there are <em>sorted
     alphabetically</em> per category and are <em>NOT</em> supposed to
     contain anything but the <em>bare</em> name of the package.</p>
+
 <pre>
 source "package/libfoo/Config.in"
 </pre>
 
-   <h3><a name="mk-file"></a>The <code>.mk</code> file</h3>
-
-   <p>Finally, here's the hardest part. Create a file named
-   <code>foo.mk</code>. It describes how the package should be
-   downloaded, configured, built, installed, etc.</p>
-
-   <p>Depending on the package type, the <code>.mk</code> file must be
-   written in a different way, using different infrastructures:</p>
-
-   <ul>
-
-     <li>Makefiles for generic packages (not using autotools), based
-     on an infrastructure similar to the one used for autotools-based
-     packages, but which requires a little more work from the
-     developer : specify what should be done at for the configuration,
-     compilation, installation and cleanup of the package. This
-     infrastructure must be used for all packages that do not use the
-     autotools as their build system. In the future, other specialized
-     infrastructures might be written for other build systems.<br/>We
-     cover them through a <a
-     href="#generic-tutorial">tutorial</a> and a <a
-     href="#generic-reference">reference</a>.</li>
-
-     <li>Makefiles for autotools-based (autoconf, automake, etc.)
-     software. We provide a dedicated infrastructure for such
-     packages, since autotools is a very common build system. This
-     infrastructure <i>must</i> be used for new packages that rely on
-     the autotools as their build system.<br/>We cover them through a
-     <a href="#autotools-tutorial">tutorial</a> and a <a
-     href="#autotools-reference">reference</a>.</li>
-
-     <li>Manual Makefiles. These are currently obsolete and no new
-     manual Makefiles should be added. However, since there are still
-     many of them in the tree and because the , we keep them documented in a <a
-     href="#manual-tutorial">tutorial</a>.</li>
-
-   </ul>
-
-   <h4><a name="generic-tutorial"></a>Makefile for generic packages :
-   tutorial</h4>
-
-   <pre><tt><span style="color: #000000">01:</span> <span style="font-style: italic"><span style="color: #9A1900">#############################################################</span></span>
-<span style="color: #000000">02:</span> <span style="font-style: italic"><span style="color: #9A1900">#</span></span>
-<span style="color: #000000">03:</span> <span style="font-style: italic"><span style="color: #9A1900"># libfoo</span></span>
-<span style="color: #000000">04:</span> <span style="font-style: italic"><span style="color: #9A1900">#</span></span>
-<span style="color: #000000">05:</span> <span style="font-style: italic"><span style="color: #9A1900">#############################################################</span></span>
-<span style="color: #000000">06:</span> <span style="color: #990000">LIBFOO_VERSION:=</span>1.0
-<span style="color: #000000">07:</span> <span style="color: #990000">LIBFOO_SOURCE:=</span>libfoo-<span style="color: #009900">$(LIBFOO_VERSION)</span>.tar.gz
-<span style="color: #000000">08:</span> <span style="color: #990000">LIBFOO_SITE:=</span>http<span style="color: #990000">:</span>//www.foosoftware.org/download
-<span style="color: #000000">09:</span> <span style="color: #009900">LIBFOO_INSTALL_STAGING=</span>YES
-<span style="color: #000000">10:</span> <span style="color: #009900">LIBFOO_DEPENDENCIES =</span> host-libaaa libbbb
+    <h3 id="mk-file">The <code>.mk</code> file</h3>
+
+    <p>Finally, here's the hardest part. Create a file named
+    <code>foo.mk</code>. It describes how the package should be
+    downloaded, configured, built, installed, etc.</p>
+
+    <p>Depending on the package type, the <code>.mk</code> file must be
+    written in a different way, using different infrastructures:</p>
+
+    <ul>
+      <li>Makefiles for generic packages (not using autotools), based on an 
+      infrastructure similar to the one used for autotools-based packages, 
+      but which requires a little more work from the developer : specify 
+      what should be done at for the configuration, compilation, installation 
+      and cleanup of the package. This infrastructure must be used for all 
+      packages that do not use the autotools as their build system. In the 
+      future, other specialized infrastructures might be written for other 
+      build systems.<br/>We cover them through a 
+      <a href="#generic-tutorial">tutorial</a> and a 
+      <a href="#generic-reference">reference</a>.</li>
+
+      <li>Makefiles for autotools-based (autoconf, automake, etc.) software. 
+      We provide a dedicated infrastructure for such packages, since 
+      autotools is a very common build system. This infrastructure <i>must 
+      </i> be used for new packages that rely on the autotools as their 
+      build system.<br/>We cover them through a 
+      <a href="#autotools-tutorial">tutorial</a> and a 
+      <a href="#autotools-reference">reference</a>.</li>
+
+      <li>Manual Makefiles. These are currently obsolete and no new manual 
+      Makefiles should be added. However, since there are still many of them 
+      in the tree and because the , we keep them documented in a
+      <a href="#manual-tutorial">tutorial</a>.</li>
+    </ul>
+
+    <h4 id="generic-tutorial">Makefile for generic packages : tutorial</h4>
+
+<pre>
+<span style="color: #000000">01:</span><span style="font-style: italic; color: #9A1900"> #############################################################</span>
+<span style="color: #000000">02:</span><span style="font-style: italic; color: #9A1900"> #</span>
+<span style="color: #000000">03:</span><span style="font-style: italic; color: #9A1900"> # libfoo</span>
+<span style="color: #000000">04:</span><span style="font-style: italic; color: #9A1900"> #</span>
+<span style="color: #000000">05:</span><span style="font-style: italic; color: #9A1900"> #############################################################</span>
+<span style="color: #000000">06:</span><span style="color: #009900"> LIBFOO_VERSION</span> = 1.0
+<span style="color: #000000">07:</span><span style="color: #009900"> LIBFOO_SOURCE</span> = libfoo-<span style="color: #009900">$(LIBFOO_VERSION)</span>.tar.gz
+<span style="color: #000000">08:</span><span style="color: #009900"> LIBFOO_SITE</span> = http://www.foosoftware.org/download
+<span style="color: #000000">09:</span><span style="color: #009900"> LIBFOO_INSTALL_STAGING</span> = YES
+<span style="color: #000000">10:</span><span style="color: #009900"> LIBFOO_DEPENDENCIES</span> = host-libaaa libbbb
 <span style="color: #000000">11:</span> 
 <span style="color: #000000">12:</span> define LIBFOO_BUILD_CMDS
-<span style="color: #000000">13:</span>         <span style="color: #009900">$(MAKE)</span> <span style="color: #009900">CC</span><span style="color: #990000">=</span><span style="color: #009900">$(TARGET_CC)</span> <span style="color: #009900">LD</span><span style="color: #990000">=</span><span style="color: #009900">$(TARGET_LD)</span> -C <span style="color: #009900">$(@D)</span> all
+<span style="color: #000000">13:</span> 	<span style="color: #009900">$(MAKE)</span> CC=<span style="color: #009900">$(TARGET_CC)</span> LD=<span style="color: #009900">$(TARGET_LD)</span> -C <span style="color: #009900">$(@D)</span> all
 <span style="color: #000000">14:</span> endef
 <span style="color: #000000">15:</span> 
 <span style="color: #000000">16:</span> define LIBFOO_INSTALL_STAGING_CMDS
-<span style="color: #000000">17:</span>         <span style="color: #009900">$(INSTALL)</span> -D <span style="color: #009900">$(@D)</span>/libfoo.a <span style="color: #009900">$(STAGING_DIR)</span>/usr/lib/libfoo.a
-<span style="color: #000000">18:</span>         <span style="color: #009900">$(INSTALL)</span> -D <span style="color: #009900">$(@D)</span>/foo.h <span style="color: #009900">$(STAGING_DIR)</span>/usr/include/foo.h
-<span style="color: #000000">19:</span>         cp -dpf <span style="color: #009900">$(@D)</span>/libfoo.so<span style="color: #990000">*</span> <span style="color: #009900">$(STAGING_DIR)</span>/usr/lib
+<span style="color: #000000">17:</span> 	<span style="color: #009900">$(INSTALL)</span> -D -m 0755 <span style="color: #009900">$(@D)</span>/libfoo.a <span style="color: #009900">$(STAGING_DIR)</span>/usr/lib/libfoo.a
+<span style="color: #000000">18:</span> 	<span style="color: #009900">$(INSTALL)</span> -D -m 0644 <span style="color: #009900">$(@D)</span>/foo.h <span style="color: #009900">$(STAGING_DIR)</span>/usr/include/foo.h
+<span style="color: #000000">19:</span> 	<span style="color: #009900">$(INSTALL)</span> -D -m 0755 <span style="color: #009900">$(@D)</span>/libfoo.so* <span style="color: #009900">$(STAGING_DIR)</span>/usr/lib
 <span style="color: #000000">20:</span> endef
 <span style="color: #000000">21:</span> 
 <span style="color: #000000">22:</span> define LIBFOO_INSTALL_TARGET_CMDS
-<span style="color: #000000">23:</span>         cp -dpf <span style="color: #009900">$(@D)</span>/libfoo.so<span style="color: #990000">*</span> <span style="color: #009900">$(TARGET_DIR)</span>/usr/lib
-<span style="color: #000000">24:</span>         -<span style="color: #009900">$(STRIPCMP)</span> <span style="color: #009900">$(STRIP_STRIP_UNNEEDED)</span> <span style="color: #009900">$(TARGET_DIR)</span>/isr/lib/libfoo.so<span style="color: #990000">*</span>
+<span style="color: #000000">23:</span> 	<span style="color: #009900">$(INSTALL)</span> -D -m 0755 <span style="color: #009900">$(@D)</span>/libfoo.so* <span style="color: #009900">$(TARGET_DIR)</span>/usr/lib
+<span style="color: #000000">24:</span> 	<span style="color: #009900">$(INSTALL)</span> -d -m 0755 <span style="color: #009900">$(TARGET_DIR)</span>/etc/foo.d
 <span style="color: #000000">25:</span> endef
 <span style="color: #000000">26:</span> 
-<span style="color: #000000">27:</span> <span style="color: #009900">$(</span><span style="font-weight: bold"><span style="color: #0000FF">eval</span></span> <span style="color: #009900">$(</span>call GENTARGETS<span style="color: #990000">,</span>package<span style="color: #990000">,</span>libfoo<span style="color: #990000">))</span></tt></pre>
-
-   <p>The Makefile begins on line 6 to 8 by metadata informations: the
-   version of the package (<code>LIBFOO_VERSION</code>), the name of
-   the tarball containing the package (<code>LIBFOO_SOURCE</code>) and
-   the Internet location at which the tarball can be downloaded
-   (<code>LIBFOO_SITE</code>). All variables must start with the same
-   prefix, <code>LIBFOO_</code> in this case. This prefix is always
-   the uppercased version of the package name (see below to understand
-   where the package name is defined).</p>
-
-   <p>On line 9, we specify that this package wants to install
-   something to the staging space. This is often needed for libraries
-   since they must install header files and other development files in
-   the staging space. This will ensure that the commands listed in the
-   <code>LIBFOO_INSTALL_STAGING_CMDS</code> variable will be
-   executed.</p>
-
-   <p>On line 10, we specify the list of dependencies this package
-   relies on. These dependencies are listed in terms of lower-case
-   package names, which can be packages for the target (without the
-   <code>host-</code> prefix) or packages for the host (with the
-   <code>host-</code>) prefix). Buildroot will ensure that all these
-   packages are built and installed <i>before</i> the current package
-   starts its configuration.</p>
-
-   <p>The rest of the Makefile defines what should be done at the
-   different steps of the package configuration, compilation and
-   installation. <code>LIBFOO_BUILD_CMDS</code> tells what steps
-   should be performed to build the
-   package. <code>LIBFOO_INSTALL_STAGING_CMDS</code> tells what steps
-   should be performed to install the package in the staging
-   space. <code>LIBFOO_INSTALL_TARGET_CMDS</code> tells what steps
-   should be performed to install the package in the target space.</p>
-
-   <p>All these steps rely on the <code>$(@D)</code> variable, which
-   contains the directory where the source code of the package has
-   been extracted.</p>
-
-   <p>Finally, on line 27, we call the <code>GENTARGETS</code> which
-   generates, according to the variables defined previously, all the
-   Makefile code necessary to make your package working.</p>
-
-   <h4><a name="generic-reference"></a>Makefile for generic packages :
-   reference</h4>
-
-   <p>The <code>GENTARGETS</code> macro takes three arguments:</p>
-
-   <ul>
-
-     <li>The first argument is the package directory prefix. If your
-     package is in <code>package/libfoo</code>, then the directory
-     prefix is <code>package</code>. If your package is in
-     <code>package/editors/foo</code>, then the directory prefix must
-     be <code>package/editors</code>.</li>
-
-     <li>The second argument is the lower-cased package name. It must
-     match the prefix of the variables in the <code>.mk</code> file
-     and must match the configuration option name in the
-     <code>Config.in</code> file. For example, if the package name is
-     <code>libfoo</code>, so the variables in the <code>.mk</code>
-     must start with <code>LIBFOO_</code> and the configuration option
-     in the <code>Config.in</code> file must be
-     <code>BR2_PACKAGE_LIBFOO</code>.</li>
-
-     <li>The third argument is optional. It can be used to tell if the
-     package if a target package (cross-compiled for the target) or a
-     host package (natively compiled for the host). If unspecified, it
-     is assumed that it is a target package. See below for
-     details.</li>
-
-   </ul>
-
-   <p>For a given package, in a single <code>.mk</code> file, it is
-   possible to call GENTARGETS twice, once to create the rules to
-   generate a target package and once to create the rules to generate
-   a host package:</p>
+<span style="color: #000000">27:</span><span style="color: #009900"> $(eval $(call GENTARGETS,package,libfoo))</span>
+</pre>
+
+    <p>The Makefile begins on line 6 to 8 by metadata informations: the 
+    version of the package (<code>LIBFOO_VERSION</code>), the name of the 
+    tarball containing the package (<code>LIBFOO_SOURCE</code>) and the 
+    Internet location at which the tarball can be downloaded 
+    (<code>LIBFOO_SITE</code>). All variables must start with the same prefix, 
+    <code>LIBFOO_</code> in this case. This prefix is always the uppercased 
+    version of the package name (see below to understand where the package 
+    name is defined).</p>
+
+    <p>On line 9, we specify that this package wants to install something to 
+    the staging space. This is often needed for libraries since they must 
+    install header files and other development files in the staging space. 
+    This will ensure that the commands listed in the 
+    <code>LIBFOO_INSTALL_STAGING_CMDS</code> variable will be executed.</p>
+
+    <p>On line 10, we specify the list of dependencies this package relies 
+    on. These dependencies are listed in terms of lower-case package names, 
+    which can be packages for the target (without the <code>host-</code> 
+    prefix) or packages for the host (with the <code>host-</code>) prefix). 
+    Buildroot will ensure that all these packages are built and installed 
+    <i>before</i> the current package starts its configuration.</p>
+
+    <p>The rest of the Makefile defines what should be done at the different 
+    steps of the package configuration, compilation and installation. 
+    <code>LIBFOO_BUILD_CMDS</code> tells what steps should be performed to 
+    build the package. <code>LIBFOO_INSTALL_STAGING_CMDS</code> tells what 
+    steps should be performed to install the package in the staging space. 
+    <code>LIBFOO_INSTALL_TARGET_CMDS</code> tells what steps should be 
+    performed to install the package in the target space.</p>
+
+    <p>All these steps rely on the <code>$(@D)</code> variable, which 
+    contains the directory where the source code of the package has been 
+    extracted.</p>
+
+    <p>Finally, on line 27, we call the <code>GENTARGETS</code> which 
+    generates, according to the variables defined previously, all the 
+    Makefile code necessary to make your package working.</p>
+
+    <h4 id="generic-reference">Makefile for generic packages : reference</h4>
+
+    <p>The <code>GENTARGETS</code> macro takes three arguments:</p>
+
+    <ul>
+      <li>The first argument is the package directory prefix. If your 
+      package is in <code>package/libfoo</code>, then the directory prefix 
+      is <code>package</code>. If your package is in 
+      <code>package/editors/foo</code>, then the directory prefix must be 
+      <code>package/editors</code>.</li>
+
+      <li>The second argument is the lower-cased package name. It must match 
+      the prefix of the variables in the <code>.mk</code> file and must 
+      match the configuration option name in the <code>Config.in</code> 
+      file. For example, if the package name is <code>libfoo</code>, so the 
+      variables in the <code>.mk</code> must start with 
+      <code>LIBFOO_</code> and the configuration option in the 
+      <code>Config.in</code> file must be <code>BR2_PACKAGE_LIBFOO</code>.</li>
+
+      <li>The third argument is optional. It can be used to tell if the 
+      package if a target package (cross-compiled for the target) or a host 
+      package (natively compiled for the host). If unspecified, it is 
+      assumed that it is a target package. See below for details.</li>
+    </ul>
+
+    <p>For a given package, in a single <code>.mk</code> file, it is 
+    possible to call GENTARGETS twice, once to create the rules to generate 
+    a target package and once to create the rules to generate a host package:
+    </p>
 
 <pre>
 $(eval $(call GENTARGETS,package,libfoo))
 $(eval $(call GENTARGETS,package,libfoo,host))
 </pre>
 
-   <p>This might be useful if the compilation of the target package
-   requires some tools to be installed on the host. If the package
-   name is <code>libfoo</code>, then the name of the package for the
-   target is also <code>libfoo</code>, while the name of the package
-   for the host is <code>host-libfoo</code>. These names should be
-   used in the DEPENDENCIES variables of other packages if they depend
-   on <code>libfoo</code> or <code>host-libfoo</code>.</p>
-
-   <p>The call to the <code>GENTARGETS</code> macro <b>must</b> be at
-   the end of the <code>.mk</code> file, after all variable
-   definitions.</p>
-
-   <p>For the target package, the <code>GENTARGETS</code> uses the
-   variables defined by the .mk file and prefixed by the uppercased
-   package name: <code>LIBFOO_*</code>. For the host package, it uses
-   the <code>HOST_LIBFOO_*</code>. For <i>some</i> variables, if the
-   <code>HOST_LIBFOO_</code> prefixed variable doesn't exist, the
-   package infrastructure uses the corresponding variable prefixed by
-   <code>LIBFOO_</code>. This is done for variables that are likely to
-   have the same value for both the target and host packages. See
-   below for details.</p>
-
-   <p>The list of variables that can be set in a <code>.mk</code> file
-   to give metadata informations is (assuming the package name is
-   <code>libfoo</code>) :</p>
-
-   <ul>
-
-     <li><code>LIBFOO_VERSION</code>, mandatory, must contain the
-     version of the package. Note that if
-     <code>HOST_LIBFOO_VERSION</code> doesn't exist, it is assumed to
-     be the same as <code>LIBFOO_VERSION</code>.<br/>Example:
-     <code>LIBFOO_VERSION=0.1.2</code></li>
-
-     <li><code>LIBFOO_SOURCE</code> may contain the name of the
-     tarball of the package. If <code>HOST_LIBFOO_SOURCE</code> is not
-     specified, it defaults to <code>LIBFOO_VERSION</code>. If none
-     are specified, then the value is assumed to be
-     <code>packagename-$(LIBFOO_VERSION).tar.gz</code>.<br/>Example:
-     <code>LIBFOO_SOURCE =
-     foobar-$(LIBFOO_VERSION).tar.bz2</code></li>
-
-     <li><code>LIBFOO_PATCH</code> may contain the name of a patch,
-     that will be downloaded from the same location as the tarball
-     indicated in <code>LIBFOO_SOURCE</code>. If
-     <code>HOST_LIBFOO_PATCH</code> is not specified, it defaults to
-     <code>LIBFOO_PATCH</code>. Also note that another mechanism is
-     available to patch a package: all files of the form
-     <code>packagename-packageversion-description.patch</code> present
-     in the package directory inside Buildroot will be applied to the
-     package after extraction.</li>
-
-     <li><code>LIBFOO_SITE</code> may contain the Internet location of
-     the tarball of the package. If <code>HOST_LIBFOO_SITE</code> is
-     not specified, it defaults to <code>LIBFOO_SITE</code>. If none
-     are specified, then the location is assumed to be
-     <code>http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/packagename</code>.<br/>Example:
-     <code>LIBFOO_SITE=http://www.foosoftware.org/libfoo</code>.</li>
-
-     <li><code>LIBFOO_DEPENDENCIES</code> lists the dependencies (in
-     terms of package name) that are required for the current target
-     package to compile. These dependencies are guaranteed to be
-     compiled and installed before the configuration of the current
-     package starts. In a similar way,
-     <code>HOST_LIBFOO_DEPENDENCIES</code> lists the dependency for
-     the current host package.</li>
-
-     <li><code>LIBFOO_INSTALL_STAGING</code> can be set to
-     <code>YES</code> or <code>NO</code> (default). If set to
-     <code>YES</code>, then the commands in the
-     <code>LIBFOO_INSTALL_STAGING_CMDS</code> variables are executed
-     to install the package into the staging directory.</p>
-
-     <li><code>LIBFOO_INSTALL_TARGET</code> can be set to
-     <code>YES</code> (default) or <code>NO</code>. If set to
-     <code>YES</code>, then the commands in the
-     <code>LIBFOO_INSTALL_TARGET_CMDS</code> variables are executed
-     to install the package into the target directory.</p>
-
-     </ul>
-
-     <p>The recommended way to define these variables is to use the
-     following syntax:</p>
+    <p>This might be useful if the compilation of the target package 
+    requires some tools to be installed on the host. If the package name is 
+    <code>libfoo</code>, then the name of the package for the target is also 
+    <code>libfoo</code>, while the name of the package for the host is 
+    <code>host-libfoo</code>. These names should be used in the DEPENDENCIES 
+    variables of other packages if they depend on <code>libfoo</code> or 
+    <code>host-libfoo</code>.</p>
+
+    <p>The call to the <code>GENTARGETS</code> macro <b>must</b> be at the 
+    end of the <code>.mk</code> file, after all variable definitions.</p>
+
+    <p>For the target package, the <code>GENTARGETS</code> uses the 
+    variables defined by the .mk file and prefixed by the uppercased package 
+    name: <code>LIBFOO_*</code>. For the host package, it uses the 
+    <code>HOST_LIBFOO_*</code>. For <i>some</i> variables, if the 
+    <code>HOST_LIBFOO_</code> prefixed variable doesn't exist, the package 
+    infrastructure uses the corresponding variable prefixed by 
+    <code>LIBFOO_</code>. This is done for variables that are likely to have 
+    the same value for both the target and host packages. See below for 
+    details.</p>
+
+    <p>The list of variables that can be set in a <code>.mk</code> file to 
+    give metadata informations is (assuming the package name is 
+    <code>libfoo</code>) :</p>
+
+    <ul>
+      <li><code>LIBFOO_VERSION</code>, mandatory, must contain the version 
+      of the package. Note that if <code>HOST_LIBFOO_VERSION</code> doesn't 
+      exist, it is assumed to be the same as <code>LIBFOO_VERSION</code>.
+      <br/>Example: <code>LIBFOO_VERSION=0.1.2</code></li>
+
+      <li><code>LIBFOO_SOURCE</code> may contain the name of the tarball of 
+      the package. If <code>HOST_LIBFOO_SOURCE</code> is not specified, it 
+      defaults to <code>LIBFOO_VERSION</code>. If none are specified, then 
+      the value is assumed to be 
+      <code>packagename-$(LIBFOO_VERSION).tar.gz</code>.<br/>Example: 
+      <code>LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2</code></li>
+
+      <li><code>LIBFOO_PATCH</code> may contain the name of a patch, that 
+      will be downloaded from the same location as the tarball indicated in 
+      <code>LIBFOO_SOURCE</code>. If <code>HOST_LIBFOO_PATCH</code> is not 
+      specified, it defaults to <code>LIBFOO_PATCH</code>. Also note that 
+      another mechanism is available to patch a package: all files of the 
+      form <code>packagename-packageversion-description.patch</code> present 
+      in the package directory inside Buildroot will be applied to the 
+      package after extraction.</li>
+
+      <li><code>LIBFOO_SITE</code> may contain the Internet location of the 
+      tarball of the package. If <code>HOST_LIBFOO_SITE</code> is not 
+      specified, it defaults to <code>LIBFOO_SITE</code>. If none are 
+      specified, then the location is assumed to be 
+      <code>http://$$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/packagename</code>.
+      <br/>Example: 
+      <code>LIBFOO_SITE=http://www.foosoftware.org/libfoo</code>.</li>
+
+      <li><code>LIBFOO_DEPENDENCIES</code> lists the dependencies (in terms 
+      of package name) that are required for the current target package to 
+      compile. These dependencies are guaranteed to be compiled and 
+      installed before the configuration of the current package starts. In a 
+      similar way, <code>HOST_LIBFOO_DEPENDENCIES</code> lists the 
+      dependency for the current host package.</li>
+
+      <li><code>LIBFOO_INSTALL_STAGING</code> can be set to <code>YES</code> 
+      or <code>NO</code> (default). If set to <code>YES</code>, then the 
+      commands in the <code>LIBFOO_INSTALL_STAGING_CMDS</code> variables are 
+      executed to install the package into the staging directory.</li>
+
+      <li><code>LIBFOO_INSTALL_TARGET</code> can be set to <code>YES</code> 
+      (default) or <code>NO</code>. If set to <code>YES</code>, then the 
+      commands in the <code>LIBFOO_INSTALL_TARGET_CMDS</code> variables are 
+      executed to install the package into the target directory.</li> </ul>
+
+    <p>The recommended way to define these variables is to use the following 
+    syntax:</p>
 
 <pre>
 LIBFOO_VERSION=2.32
 </pre>
 
-     <p>Now, the variables that define what should be performed at the
-     different steps of the build process.</p>
-
-     <ul>
+    <p>Now, the variables that define what should be performed at the 
+    different steps of the build process.</p>
 
-       <li><code>LIBFOO_CONFIGURE_CMDS</code>, used to list the
-       actions to be performed to configure the package before its
-       compilation</li>
-
-       <li><code>LIBFOO_BUILD_CMDS</code>, used to list the actions to
-       be performed to compile the package</li>
-
-       <li><code>HOST_LIBFOO_INSTALL_CMDS</code>, used to list the
-       actions to be performed to install the package, when the
-       package is a host package. The package must install its files
-       to the directory given by <code>$(HOST_DIR)</code>. All files,
-       including development files such as headers should be
-       installed, since other packages might be compiled on top of
-       this package.</li>
-
-       <li><code>LIBFOO_INSTALL_TARGET_CMDS</code>, used to list the
-       actions to be performed to install the package to the target
-       directory, when the package is a target package. The package
-       must install its files to the directory given by
-       <code>$(TARGET_DIR)</code>. Only the files required for
-       <i>execution</i> of the package should be installed. Header
-       files and documentation should not be installed.</li>
-
-       <li><code>LIBFOO_INSTALL_STAGING_CMDS</code>, used to list the
-       actions to be performed to install the package to the staging
-       directory, when the package is a target package. The package
-       must install its files to the directory given by
-       <code>$(STAGING_DIR)</code>. All development files should be
-       installed, since they might be needed to compile other
-       packages.</li>
-
-       <li><code>LIBFOO_CLEAN_CMDS</code>, used to list the actions to
-       perform to clean up the build directory of the package.</li>
-
-       <li><code>LIBFOO_UNINSTALL_TARGET_CMDS</code>, used to list the
-       actions to uninstall the package from the target directory
-       <code>$(TARGET_DIR)</code></li>
-
-       <li><code>LIBFOO_UNINSTALL_STAGING_CMDS</code></li>, used to
-       list the actions to uninstall the package from the staging
-       directory <code>$(STAGING_DIR)</code>.</li>
-
-     </ul>
+    <ul>
+      <li><code>LIBFOO_CONFIGURE_CMDS</code>, used to list the actions to be 
+      performed to configure the package before its compilation</li>
+
+      <li><code>LIBFOO_BUILD_CMDS</code>, used to list the actions to be 
+      performed to compile the package</li>
+
+      <li><code>HOST_LIBFOO_INSTALL_CMDS</code>, used to list the actions to 
+      be performed to install the package, when the package is a host 
+      package. The package must install its files to the directory given by 
+      <code>$(HOST_DIR)</code>. All files, including development files such 
+      as headers should be installed, since other packages might be compiled 
+      on top of this package.</li>
+
+      <li><code>LIBFOO_INSTALL_TARGET_CMDS</code>, used to list the actions 
+      to be performed to install the package to the target directory, when 
+      the package is a target package. The package must install its files to 
+      the directory given by <code>$(TARGET_DIR)</code>. Only the files 
+      required for <i>execution</i> of the package 
+      should be installed. Header files and documentation should not be 
+      installed.</li>
+
+      <li><code>LIBFOO_INSTALL_STAGING_CMDS</code>, used to list the actions 
+      to be performed to install the package to the staging directory, when 
+      the package is a target package. The package must install its files to 
+      the directory given by <code>$(STAGING_DIR)</code>. All development 
+      files should be installed, since they might be needed to compile other 
+      packages.</li>
+
+      <li><code>LIBFOO_CLEAN_CMDS</code>, used to list the actions to 
+      perform to clean up the build directory of the package.</li>
+
+      <li><code>LIBFOO_UNINSTALL_TARGET_CMDS</code>, used to list the actions 
+      to uninstall the package from the target directory
+      <code>$(TARGET_DIR)</code></li>
+
+      <li><code>LIBFOO_UNINSTALL_STAGING_CMDS</code>, used to list the 
+      actions to uninstall the package from the staging directory 
+      <code>$(STAGING_DIR)</code>.</li>
+    </ul>
 
-     <p>The preferred way to define these variables is:</p>
+    <p>The preferred way to define these variables is:</p>
 
 <pre>
 define LIBFOO_CONFIGURE_CMDS
- action 1
- action 2
- action 3
-endef</pre>
-
-     <p>In the action definitions, you can use the following
-     variables:</p>
-
-     <ul>
-
-       <li><code>$(@D)</code>, which contains the directory in which
-       the package source code has been uncompressed.</li>
+	action 1
+	action 2
+	action 3
+endef
+</pre>
 
-       <li><code>$(TARGET_CC)</code>, <code>$(TARGET_LD)</code>,
-       etc. to get the target cross-compilation utilities</li>
+    <p>In the action definitions, you can use the following variables:</p>
 
-       <li><code>$(TARGET_CROSS)</code> to get the cross-compilation
-       toolchain prefix</li>
+    <ul>
+      <li><code>$(@D)</code>, which contains the directory in which the 
+      package source code has been uncompressed.</li>
 
-       <li>Of course the <code>$(HOST_DIR)</code>,
-       <code>$(STAGING_DIR)</code> and <code>$(TARGET_DIR)</code>
-       variables to install the packages properly.</li>
+      <li><code>$(TARGET_CC)</code>, <code>$(TARGET_LD)</code>, etc. to get 
+      the target cross-compilation utilities</li>
 
-     </ul>
+      <li><code>$(TARGET_CROSS)</code> to get the cross-compilation 
+      toolchain prefix</li>
 
+      <li>Of course the <code>$(HOST_DIR)</code>, <code>$(STAGING_DIR)</code>
+      and <code>$(TARGET_DIR)</code> variables to install the packages 
+      properly.</li>
+    </ul>
 
-     <p>The last feature of the generic infrastructure is the ability
-     to add hook more actions after existing steps. These hooks aren't
-     really useful for generic packages, since the <code>.mk</code>
-     file already has full control over the actions performed in each
-     step of the package construction. The hooks are more useful for
-     packages using the autotools infrastructure described below. But
-     since they are provided by the generic infrastructure, they are
-     documented here.</p>
+    <p>The last feature of the generic infrastructure is the ability to add 
+    hook more actions after existing steps. These hooks aren't really useful 
+    for generic packages, since the <code>.mk</code> file already has full 
+    control over the actions performed in each step of the package 
+    construction. The hooks are more useful for packages using the autotools 
+    infrastructure described below. But since they are provided by the 
+    generic infrastructure, they are documented here.</p>
 
-     <p>The following hook points are available:</p>
+    <p>The following hook points are available:</p>
 
-     <ul>
-       <li><code>LIBFOO_POST_PATCH_HOOKS</code></li>
-       <li><code>LIBFOO_POST_CONFIGURE_HOOKS</code></li>
-       <li><code>LIBFOO_POST_BUILD_HOOKS</code></li>
-       <li><code>LIBFOO_POST_INSTALL_HOOKS</code> (for host packages only)</li>
-       <li><code>LIBFOO_POST_INSTALL_STAGING_HOOKS</code> (for target packages only)</li>
-       <li><code>LIBFOO_POST_INSTALL_TARGET_HOOKS</code> (for target packages only)</li>
-     </ul>
+    <ul>
+      <li><code>LIBFOO_POST_PATCH_HOOKS</code></li>
+      <li><code>LIBFOO_POST_CONFIGURE_HOOKS</code></li>
+      <li><code>LIBFOO_POST_BUILD_HOOKS</code></li>
+      <li><code>LIBFOO_POST_INSTALL_HOOKS</code> (for host packages only)</li>
+      <li><code>LIBFOO_POST_INSTALL_STAGING_HOOKS</code> (for target packages only)</li>
+      <li><code>LIBFOO_POST_INSTALL_TARGET_HOOKS</code> (for target packages only)</li>
+    </ul>
 
-     <p>This variables are <i>lists</i> of variable names containing
-     actions to be performed at this hook point. This allows several
-     hooks to be registered at a given hook point. Here is an
-     example:</p>
+    <p>This variables are <i>lists</i> of variable names containing actions 
+    to be performed at this hook point. This allows several hooks to be 
+    registered at a given hook point. Here is an example:</p>
 
-     <pre>
+<pre>
 define LIBFOO_POST_PATCH_FIXUP
-  action1
-  action2
+	action1
+	action2
 endef
 
 LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
 </pre>
 
-   <h4><a name="autotools-tutorial"></a>Makefile for autotools-based
-   packages : tutorial</h4>
-
-   <p>First, let's see how to write a <code>.mk</code> file for an
-   autotools-based package, with an example&nbsp;:</p>
-
-<pre><tt><span style="color: #000000">01:</span> <span style="font-style: italic"><span style="color: #9A1900">#############################################################</span></span>
-<span style="color: #000000">02:</span> <span style="font-style: italic"><span style="color: #9A1900">#</span></span>
-<span style="color: #000000">03:</span> <span style="font-style: italic"><span style="color: #9A1900"># foo</span></span>
-<span style="color: #000000">04:</span> <span style="font-style: italic"><span style="color: #9A1900">#</span></span>
-<span style="color: #000000">05:</span> <span style="font-style: italic"><span style="color: #9A1900">#############################################################</span></span>
-<span style="color: #000000">06:</span> 
-<span style="color: #000000">07:</span> <span style="color: #990000">FOO_VERSION:=</span>1.0
-<span style="color: #000000">08:</span> <span style="color: #990000">FOO_SOURCE:=</span>foo-<span style="color: #009900">$(FOO_VERSION)</span>.tar.gz
-<span style="color: #000000">09:</span> <span style="color: #990000">FOO_SITE:=</span>http<span style="color: #990000">:</span>//www.foosoftware.org/downloads
-<span style="color: #000000">10:</span> <span style="color: #009900">FOO_INSTALL_STAGING =</span> YES
-<span style="color: #000000">11:</span> <span style="color: #009900">FOO_INSTALL_TARGET =</span> YES
-<span style="color: #000000">12:</span> <span style="color: #009900">FOO_CONF_OPT =</span>  --enable-shared
-<span style="color: #000000">13:</span> <span style="color: #009900">FOO_DEPENDENCIES =</span> libglib2 host-pkg-config
-<span style="color: #000000">14:</span> 
-<span style="color: #000000">15:</span> <span style="color: #009900">$(</span><span style="font-weight: bold"><span style="color: #0000FF">eval</span></span> <span style="color: #009900">$(</span>call AUTOTARGETS<span style="color: #990000">,</span>package<span style="color: #990000">,</span>foo<span style="color: #990000">))</span></tt></pre>
-
-    <p>On line 7, we declare the version of the package. On line 8 and
-    9, we declare the name of the tarball and the location of the
-    tarball on the Web. Buildroot will automatically download the
+   <h4 id="autotools-tutorial">Makefile for autotools-based packages : tutorial</h4>
+
+   <p>First, let's see how to write a <code>.mk</code> file for an 
+   autotools-based package, with an example :</p>
+
+<pre>
+<span style="color: #000000">01:</span><span style="font-style: italic; color: #9A1900"> #############################################################</span>
+<span style="color: #000000">02:</span><span style="font-style: italic; color: #9A1900"> #</span>
+<span style="color: #000000">03:</span><span style="font-style: italic; color: #9A1900"> # libfoo</span>
+<span style="color: #000000">04:</span><span style="font-style: italic; color: #9A1900"> #</span>
+<span style="color: #000000">05:</span><span style="font-style: italic; color: #9A1900"> #############################################################</span>
+<span style="color: #000000">06:</span><span style="color: #009900"> LIBFOO_VERSION</span> = 1.0
+<span style="color: #000000">07:</span><span style="color: #009900"> LIBFOO_SOURCE</span> = libfoo-<span style="color: #009900">$(LIBFOO_VERSION)</span>.tar.gz
+<span style="color: #000000">08:</span><span style="color: #009900"> LIBFOO_SITE</span> = http://www.foosoftware.org/download
+<span style="color: #000000">09:</span><span style="color: #009900"> LIBFOO_INSTALL_STAGING</span> = YES
+<span style="color: #000000">10:</span><span style="color: #009900"> LIBFOO_INSTALL_TARGET</span> = YES
+<span style="color: #000000">11:</span><span style="color: #009900"> LIBFOO_CONF_OPT</span> = --enable-shared
+<span style="color: #000000">12:</span><span style="color: #009900"> LIBFOO_DEPENDENCIES</span> = libglib2 host-pkg-config
+<span style="color: #000000">13:</span>
+<span style="color: #000000">14:</span><span style="color: #009900"> $(eval $(call AUTOTARGETS,package,libfoo))</span>
+</pre>
+
+    <p>On line 6, we declare the version of the package.</p>
+    
+    <p>On line 7 and 8, we declare the name of the tarball and the location 
+    of the tarball on the Web. Buildroot will automatically download the 
     tarball from this location.</p>
 
-    <p>On line 10, we tell Buildroot to install the package to the
-    staging directory. The staging directory, located in
-    <code>output/staging/</code> is the directory where all the
-    packages are installed, including their development files, etc. By
-    default, packages are not installed to the staging directory,
-    since usually, only libraries need to be installed in the staging
-    directory: their development files are needed to compile other
-    libraries or applications depending on them. Also by default, when
-    staging installation is enabled, packages are installed in this
-    location using the <code>make install</code> command.</p>
-
-    <p>On line 11, we tell Buildroot to also install the package to
-    the target directory. This directory contains what will become the
-    root filesystem running on the target. Usually, we try not to
-    install the documentation and to install stripped versions of the
-    binary. By default, target installation is enabled, so in fact,
-    this line is not strictly necessary. Also by default, packages are
-    installed in this location using the <code>make
-    install-strip</code> command.</p>
-
-    <p>On line 12, we tell Buildroot to pass a custom configure
-    option, that will be passed to the <code>./configure</code> script
-    before configuring and building the package.</p>
-
-    <p>On line 13, we declare our dependencies, so that they are built
+    <p>On line 9, we tell Buildroot to install the package to the staging 
+    directory. The staging directory, located in <code>output/staging/</code>
+    is the directory where all the packages are installed, including their 
+    development files, etc. By default, packages are not installed to the 
+    staging directory, since usually, only libraries need to be installed in 
+    the staging directory: their development files are needed to compile 
+    other libraries or applications depending on them. Also by default, when 
+    staging installation is enabled, packages are installed in this location 
+    using the <code>make install</code> command.</p>
+
+    <p>On line 10, we tell Buildroot to also install the package to the 
+    target directory. This directory contains what will become the root 
+    filesystem running on the target. Usually, we try not to install header 
+    files and to install stripped versions of the binary. By default, target 
+    installation is enabled, so in fact, this line is not strictly 
+    necessary. Also by default, packages are installed in this location 
+    using the <code>make install</code> command.</p>
+
+    <p>On line 11, we tell Buildroot to pass a custom configure option, that 
+    will be passed to the <code>./configure</code> script before configuring 
+    and building the package.</p>
+
+    <p>On line 12, we declare our dependencies, so that they are built 
     before the build process of our package starts.</p>
 
-    <p>Finally, on line line 14, we invoke the
-    <code>AUTOTARGETS</code> macro that generates all the Makefile
-    rules that actually allows the package to be built.</p>
-
-    <h4><a name="autotools-reference"></a>Makefile for autotools
-    packages : reference</h4>
-
-    <p>The main macro of the autotools package infrastructure is
-    <code>AUTOTARGETS</code>. It has the same number of arguments and
-    the same semantic as the <code>GENTARGETS</code> macro, which is
-    the main macro of the generic package infrastructure. For
-    autotools packages, the ability to have target and host packages
-    is also available (and is actually widely used).</p>
-
-    <p>Just like the generic infrastructure, the autotools
-    infrastructure works by defining a number of variables before
-    calling the <code>AUTOTARGETS</code> macro.</p>
-
-    <p>First, all the package meta-information variables that exist in
-    the generic infrastructure also exist in the autotools
-    infrastructure: <code>LIBFOO_VERSION</code>,
-    <code>LIBFOO_SOURCE</code>, <code>LIBFOO_PATCH</code>,
-    <code>LIBFOO_SITE</code>, <code>LIBFOO_SUBDIR</code>,
-    <code>LIBFOO_DEPENDENCIES</code>,
-    <code>LIBFOO_INSTALL_STAGING</code>,
-    <code>LIBFOO_INSTALL_TARGET</code>.</p>
-
-    <p>A few additional variables, specific to the autotools
-    infrastructure, can also be defined. Many of them are only useful
-    in very specific cases, typical packages will therefore only use a
-    few of them.</p>
+    <p>Finally, on line line 14, we invoke the <code>AUTOTARGETS</code> 
+    macro that generates all the Makefile rules that actually allows the 
+    package to be built.</p>
 
-    <ul>
+    <h4 id="autotools-reference">Makefile for autotools packages : reference</h4>
 
-      <li><code>LIBFOO_SUBDIR</code> may contain the name of a
-      subdirectory inside the package that contains the configure
-      script. This is useful, if for example, the main configure
-      script is not at the root of the tree extracted by the
-      tarball. If <code>HOST_LIBFOO_SUBDIR</code> is not specified, it
-      defaults to <code>LIBFOO_SUBDIR</code>.</li>
-
-      <li><code>LIBFOO_CONF_ENV</code>, to specify additional
-      environment variables to pass to the configure script. By
-      default, empty.</li>
-
-      <li><code>LIBFOO_CONF_OPT</code>, to specify additional
-      configure options to pass to the configure script. By default,
-      empty.</li>
-
-      <li><code>LIBFOO_MAKE</code>, to specify an
-      alternate <code>make</code> command. This is typically useful
-      when parallel make it enabled in the configuration
-      (using <code>BR2_JLEVEL</code>) but that this feature should be
-      disabled for the given package, for one reason or another. By
-      default, set to <code>$(MAKE)</code>. If parallel building is
-      not supported by the package, then it should
-      do <code>LIBFOO_MAKE=$(MAKE1)</code>.</li>
-
-      <li><code>LIBFOO_MAKE_ENV</code>, to specify additional
-      environment variables to pass to make in the build step. These
-      are passed before the <code>make</code> command. By default,
-      empty.</li>
-
-      <li><code>LIBFOO_MAKE_OPT</code>, to specify additional
-      variables to pass to make in the build step. These are passed
-      after the <code>make</code> command. By default, empty.</li>
-
-      <li><code>LIBFOO_AUTORECONF</code>, tells whether the package
-      should be autoreconfigured or not (i.e, if the configure script
-      and Makefile.in files should be re-generated by re-running
-      autoconf, automake, libtool, etc.). Valid values
-      are <code>YES</code> and <code>NO</code>. By default, the value
-      is <code>NO</code></li>
-
-      <li><code>LIBFOO_AUTORECONF_OPT</code> to specify additional
-      options passed to the <i>autoreconf</i> program
-      if <code>LIBFOO_AUTORECONF=YES</code>. By default, empty.</li>
-
-      <li><code>LIBFOO_LIBTOOL_PATCH</code> tells whether the
-      Buildroot patch to fix libtool cross-compilation issues should
-      be applied or not. Valid values are <code>YES</code>
-      and <code>NO</code>. By default, the value
-      is <code>YES</code></li>
-
-      <li><code>LIBFOO_USE_CONFIG_CACHE</code> tells whether the
-      configure script should really on a cache file that caches test
-      results from previous configure script. Usually, this variable
-      should be left to its default value. Only for specific packages
-      having issues with the configure cache can set this variable to
-      the <code>NO</code> value (but this is more a work-around than a
-      really fix)</li>
-
-      <li><code>LIBFOO_INSTALL_STAGING_OPT</code> contains the make
-      options used to install the package to the staging directory. By
-      default, the value is <code>DESTDIR=$$(STAGING_DIR)
-      install</code>, which is correct for most autotools packages. It
-      is still possible to override it.</li>
-
-      <li><code>LIBFOO_INSTALL_TARGET_OPT</code> contains the make
-      options used to install the package to the target directory. By
-      default, the value is <code>DESTDIR=$$(TARGET_DIR)
-      install-strip</code> if <code>BR2_ENABLE_DEBUG</code> is not
-      set, and <code>DESTDIR=$$(TARGET_DIR) install-exec</code>
-      if <code>BR2_ENABLE_DEBUG</code> is set. These default values
-      are correct for most autotools packages, but it is still
-      possible to override them if needed.</li>
-
-      <li><code>LIBFOO_CLEAN_OPT</code> contains the make options used
-      to clean the package. By default, the value
-      is <code>clean</code>.</li>
-
-      <li><code>LIBFOO_UNINSTALL_STAGING_OPT</code>, contains the make
-      options used to uninstall the package from the staging
-      directory. By default, the value is
-      <code>DESTDIR=$$(STAGING_DIR) uninstall</code>.</li>
-
-      <li><code>LIBFOO_UNINSTALL_TARGET_OPT</code>, contains the make
-      options used to uninstall the package from the target
-      directory. By default, the value is
-      <code>DESTDIR=$$(TARGET_DIR) uninstall</code>.</li>
+    <p>The main macro of the autotools package infrastructure is 
+    <code>AUTOTARGETS</code>. It has the same number of arguments and the 
+    same semantic as the <code>GENTARGETS</code> macro, which is the main 
+    macro of the generic package infrastructure. For autotools packages, the 
+    ability to have target and host packages is also available (and is 
+    actually widely used).</p>
 
-    </ul>
+    <p>Just like the generic infrastructure, the autotools infrastructure 
+    works by defining a number of variables before calling the 
+    <code>AUTOTARGETS</code> macro.</p>
 
-    <p>With the autotools infrastructure, all the steps required to
-    build and install the packages are already defined, and they
-    generally work well for most autotools-based packages. However,
-    when required, it is still possible to customize what is done in
-    particular step:</p>
+    <p>First, all the package meta-information variables that exist in the 
+    generic infrastructure also exist in the autotools infrastructure: 
+    <code>LIBFOO_VERSION</code>, <code>LIBFOO_SOURCE</code>, 
+    <code>LIBFOO_PATCH</code>, <code>LIBFOO_SITE</code>, 
+    <code>LIBFOO_SUBDIR</code>, <code>LIBFOO_DEPENDENCIES</code>, 
+    <code>LIBFOO_INSTALL_STAGING</code>, <code>LIBFOO_INSTALL_TARGET</code>.</p>
 
-    <ul>
+    <p>A few additional variables, specific to the autotools infrastructure, 
+    can also be defined. Many of them are only useful in very specific 
+    cases, typical packages will therefore only use a few of them.</p>
 
-      <li>By adding a post-operation hook (after extract, patch,
-      configure, build or install). See the reference documentation of
-      the generic infrastructure for details.</li>
+    <ul>
+      <li><code>LIBFOO_SUBDIR</code> may contain the name of a subdirectory 
+      inside the package that contains the configure script. This is useful, 
+      if for example, the main configure script is not at the root of the 
+      tree extracted by the tarball. If <code>HOST_LIBFOO_SUBDIR</code> is 
+      not specified, it defaults to <code>LIBFOO_SUBDIR</code>.</li>
+
+      <li><code>LIBFOO_CONF_ENV</code>, to specify additional environment 
+      variables to pass to the configure script. By default, empty.</li>
+
+      <li><code>LIBFOO_CONF_OPT</code>, to specify additional configure 
+      options to pass to the configure script. By default, empty.</li>
+
+      <li><code>LIBFOO_MAKE</code>, to specify an alternate <code>make</code>
+      command. This is typically useful when parallel make it enabled in 
+      the configuration (using <code>BR2_JLEVEL</code>) but that this 
+      feature should be disabled for the given package, for one reason or 
+      another. By default, set to <code>$(MAKE)</code>. If parallel building 
+      is not supported by the package, then it should do 
+      <code>LIBFOO_MAKE=$(MAKE1)</code>.</li>
+
+      <li><code>LIBFOO_MAKE_ENV</code>, to specify additional environment 
+      variables to pass to make in the build step. These are passed before 
+      the <code>make</code> command. By default, empty.</li>
+
+      <li><code>LIBFOO_MAKE_OPT</code>, to specify additional variables to 
+      pass to make in the build step. These are passed after the 
+      <code>make</code> command. By default, empty.</li>
+
+      <li><code>LIBFOO_AUTORECONF</code>, tells whether the package should 
+      be autoreconfigured or not (i.e, if the configure script and 
+      Makefile.in files should be re-generated by re-running autoconf, 
+      automake, libtool, etc.). Valid values are <code>YES</code> and 
+      <code>NO</code>. By default, the value is <code>NO</code></li>
+
+      <li><code>LIBFOO_AUTORECONF_OPT</code> to specify additional options 
+      passed to the <i>autoreconf</i> program if 
+      <code>LIBFOO_AUTORECONF=YES</code>. By default, empty.</li>
+
+      <li><code>LIBFOO_LIBTOOL_PATCH</code> tells whether the Buildroot 
+      patch to fix libtool cross-compilation issues should be applied or 
+      not. Valid values are <code>YES</code> and <code>NO</code>. By 
+      default, the value is <code>YES</code></li>
+
+      <li><code>LIBFOO_USE_CONFIG_CACHE</code> tells whether the configure 
+      script should really on a cache file that caches test results from 
+      previous configure script. Usually, this variable should be left to 
+      its default value. Only for specific packages having issues with the 
+      configure cache can set this variable to the <code>NO</code> value 
+      (but this is more a work-around than a really fix)</li>
+
+      <li><code>LIBFOO_INSTALL_STAGING_OPT</code> contains the make options 
+      used to install the package to the staging directory. By default, the 
+      value is <code>DESTDIR=$$(STAGING_DIR) install</code>, which is 
+      correct for most autotools packages. It is still possible to override 
+      it.</li>
+
+      <li><code>LIBFOO_INSTALL_TARGET_OPT</code> contains the make options 
+      used to install the package to the target directory. By default, the 
+      value is <code>DESTDIR=$$(TARGET_DIR) install-strip</code> if 
+      <code>BR2_ENABLE_DEBUG</code> is not set, and 
+      <code>DESTDIR=$$(TARGET_DIR) install-exec</code> if 
+      <code>BR2_ENABLE_DEBUG</code> is set. These default values are correct 
+      for most autotools packages, but it is still possible to override them 
+      if needed.</li>
+
+      <li><code>LIBFOO_CLEAN_OPT</code> contains the make options used to 
+      clean the package. By default, the value is <code>clean</code>.</li>
+
+      <li><code>LIBFOO_UNINSTALL_STAGING_OPT</code>, contains the make 
+      options used to uninstall the package from the staging directory. By 
+      default, the value is <code>DESTDIR=$$(STAGING_DIR) uninstall</code>.</li>
+
+      <li><code>LIBFOO_UNINSTALL_TARGET_OPT</code>, contains the make 
+      options used to uninstall the package from the target directory. By 
+      default, the value is <code>DESTDIR=$$(TARGET_DIR) uninstall</code>.</li>
+    </ul>
 
-      <li>By overriding one of the steps. For example, even if the
-      autotools infrastructure is used, if the package
-      <code>.mk</code> defines its own
-      <code>LIBFOO_CONFIGURE_CMDS</code> variable, it will be used
-      instead of the default autotools one. However, using this method
-      should be restricted to very specific cases. Do not use it in
-      the general case.</li>
+    <p>With the autotools infrastructure, all the steps required to build 
+    and install the packages are already defined, and they generally work 
+    well for most autotools-based packages. However, when required, it is 
+    still possible to customize what is done in particular step:</p>
 
+    <ul>
+      <li>By adding a post-operation hook (after extract, patch, configure, 
+      build or install). See the reference documentation of the generic 
+      infrastructure for details.</li>
+
+      <li>By overriding one of the steps. For example, even if the autotools 
+      infrastructure is used, if the package <code>.mk</code> defines its 
+      own <code>LIBFOO_CONFIGURE_CMDS</code> variable, it will be used 
+      instead of the default autotools one. However, using this method 
+      should be restricted to very specific cases. Do not use it in the 
+      general case.</li>
     </ul>
 
-    <h4><a name="manual-tutorial"></a>Manual Makefile : tutorial</h4>
+    <h4 id ="manual-tutorial">Manual Makefile : tutorial</h4>
 
-    <p><b>NOTE: new manual makefiles should not be created, and
-    existing manual makefiles should be converted either to the
-    generic infrastructure or the autotools infrastructure. This
-    section is only kept to document the existing manual makefiles and
-    help understanding how they work.</b></p>
+    <p><b>NOTE: new manual makefiles should not be created, and existing 
+    manual makefiles should be converted either to the generic 
+    infrastructure or the autotools infrastructure. This section is only 
+    kept to document the existing manual makefiles and help understanding 
+    how they work.</b></p>
 
 <pre>
-     <a name="ex2line1" id="ex2line1">1</a>  #############################################################
-     <a name="ex2line2" id="ex2line2">2</a>  #
-     <a name="ex2line3" id="ex2line3">3</a>  # foo
-     <a name="ex2line4" id="ex2line4">4</a>  #
-     <a name="ex2line5" id="ex2line5">5</a>  #############################################################
-     <a name="ex2line6" id="ex2line6">6</a>  FOO_VERSION:=1.0
-     <a name="ex2line7" id="ex2line7">7</a>  FOO_SOURCE:=foo-$(FOO_VERSION).tar.gz
-     <a name="ex2line8" id="ex2line8">8</a>  FOO_SITE:=http://www.foosoftware.org/downloads
-     <a name="ex2line9" id="ex2line9">9</a>  FOO_DIR:=$(BUILD_DIR)/foo-$(FOO_VERSION)
-    <a name="ex2line10" id="ex2line10">10</a>  FOO_BINARY:=foo
-    <a name="ex2line11" id="ex2line11">11</a>  FOO_TARGET_BINARY:=usr/bin/foo
-    <a name="ex2line12" id="ex2line12">12</a>
-    <a name="ex2line13" id="ex2line13">13</a>  $(DL_DIR)/$(FOO_SOURCE):
-    <a name="ex2line14" id="ex2line14">14</a>          $(call DOWNLOAD,$(FOO_SITE),$(FOO_SOURCE))
-    <a name="ex2line15" id="ex2line15">15</a>
-    <a name="ex2line16" id="ex2line16">16</a>  $(FOO_DIR)/.source: $(DL_DIR)/$(FOO_SOURCE)
-    <a name="ex2line17" id="ex2line17">17</a>          $(ZCAT) $(DL_DIR)/$(FOO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-    <a name="ex2line18" id="ex2line18">18</a>          touch $@
-    <a name="ex2line19" id="ex2line19">19</a>
-    <a name="ex2line20" id="ex2line20">20</a>  $(FOO_DIR)/.configured: $(FOO_DIR)/.source
-    <a name="ex2line21" id="ex2line21">21</a>          (cd $(FOO_DIR); rm -rf config.cache; \
-    <a name="ex2line22" id="ex2line22">22</a>                  $(TARGET_CONFIGURE_OPTS) \
-    <a name="ex2line23" id="ex2line23">23</a>                  $(TARGET_CONFIGURE_ARGS) \
-    <a name="ex2line24" id="ex2line24">24</a>                  ./configure \
-    <a name="ex2line25" id="ex2line25">25</a>                  --target=$(GNU_TARGET_NAME) \
-    <a name="ex2line26" id="ex2line26">26</a>                  --host=$(GNU_TARGET_NAME) \
-    <a name="ex2line27" id="ex2line27">27</a>                  --build=$(GNU_HOST_NAME) \
-    <a name="ex2line28" id="ex2line28">28</a>                  --prefix=/usr \
-    <a name="ex2line29" id="ex2line29">29</a>                  --sysconfdir=/etc \
-    <a name="ex2line30" id="ex2line30">30</a>          )
-    <a name="ex2line31" id="ex2line31">31</a>          touch $@
-    <a name="ex2line32" id="ex2line32">32</a>
-    <a name="ex2line33" id="ex2line33">33</a>  $(FOO_DIR)/$(FOO_BINARY): $(FOO_DIR)/.configured
-    <a name="ex2line34" id="ex2line34">34</a>          $(MAKE) CC=$(TARGET_CC) -C $(FOO_DIR)
-    <a name="ex2line35" id="ex2line35">35</a>
-    <a name="ex2line36" id="ex2line36">36</a>  $(TARGET_DIR)/$(FOO_TARGET_BINARY): $(FOO_DIR)/$(FOO_BINARY)
-    <a name="ex2line37" id="ex2line37">37</a>          $(MAKE) DESTDIR=$(TARGET_DIR) -C $(FOO_DIR) install-strip
-    <a name="ex2line38" id="ex2line38">38</a>          rm -Rf $(TARGET_DIR)/usr/man
-    <a name="ex2line39" id="ex2line39">39</a>
-    <a name="ex2line40" id="ex2line40">40</a>  foo: uclibc ncurses $(TARGET_DIR)/$(FOO_TARGET_BINARY)
-    <a name="ex2line41" id="ex2line41">41</a>
-    <a name="ex2line42" id="ex2line42">42</a>  foo-source: $(DL_DIR)/$(FOO_SOURCE)
-    <a name="ex2line43" id="ex2line43">43</a>
-    <a name="ex2line44" id="ex2line44">44</a>  foo-clean:
-    <a name="ex2line45" id="ex2line45">45</a>          $(MAKE) prefix=$(TARGET_DIR)/usr -C $(FOO_DIR) uninstall
-    <a name="ex2line46" id="ex2line46">46</a>          -$(MAKE) -C $(FOO_DIR) clean
-    <a name="ex2line47" id="ex2line47">47</a>
-    <a name="ex2line48" id="ex2line48">48</a>  foo-dirclean:
-    <a name="ex2line49" id="ex2line49">49</a>          rm -rf $(FOO_DIR)
-    <a name="ex2line50" id="ex2line50">50</a>
-    <a name="ex2line51" id="ex2line51">51</a> #############################################################
-    <a name="ex2line52" id="ex2line52">52</a> #
-    <a name="ex2line53" id="ex2line53">53</a> # Toplevel Makefile options
-    <a name="ex2line54" id="ex2line54">54</a> #
-    <a name="ex2line55" id="ex2line55">55</a> #############################################################
-    <a name="ex2line56" id="ex2line56">56</a> ifeq ($(BR2_PACKAGE_FOO),y)
-    <a name="ex2line57" id="ex2line57">57</a> TARGETS+=foo
-    <a name="ex2line58" id="ex2line58">58</a> endif
-
+01: #############################################################
+02: #
+03: # libfoo
+04: #
+05: #############################################################
+<span id="ex2line6">06: LIBFOO_VERSION:=1.0</span>
+07: LIBFOO_SOURCE:=libfoo-$(LIBFOO_VERSION).tar.gz
+08: LIBFOO_SITE:=http://www.foosoftware.org/downloads
+09: LIBFOO_DIR:=$(BUILD_DIR)/foo-$(FOO_VERSION)
+10: LIBFOO_BINARY:=foo
+11: LIBFOO_TARGET_BINARY:=usr/bin/foo
+12:
+<span id="ex2line13">13: $(DL_DIR)/$(LIBFOO_SOURCE):</span>
+14: 	$(call DOWNLOAD,$(LIBFOO_SITE),$(LIBFOO_SOURCE))
+15:
+<span id="ex2line16">16: $(LIBFOO_DIR)/.source: $(DL_DIR)/$(LIBFOO_SOURCE)</span>
+17: 	$(ZCAT) $(DL_DIR)/$(LIBFOO_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+18: 	touch $@
+19:
+<span id="ex2line20">20: $(LIBFOO_DIR)/.configured: $(LIBFOO_DIR)/.source</span>
+21: 	(cd $(LIBFOO_DIR); rm -rf config.cache; \
+22: 		$(TARGET_CONFIGURE_OPTS) \
+23: 		$(TARGET_CONFIGURE_ARGS) \
+24: 		./configure \
+25: 		--target=$(GNU_TARGET_NAME) \
+26: 		--host=$(GNU_TARGET_NAME) \
+27: 		--build=$(GNU_HOST_NAME) \
+28: 		--prefix=/usr \
+29: 		--sysconfdir=/etc \
+30: 	)
+31: 	touch $@
+32:
+<span id="ex2line33">33: $(LIBFOO_DIR)/$(LIBFOO_BINARY): $(LIBFOO_DIR)/.configured</span>
+34: 	$(MAKE) CC=$(TARGET_CC) -C $(LIBFOO_DIR)
+35:
+<span id="ex2line36">36: $(TARGET_DIR)/$(LIBFOO_TARGET_BINARY): $(LIBFOO_DIR)/$(LIBFOO_BINARY)</span>
+37: 	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(LIBFOO_DIR) install-strip
+38: 	rm -Rf $(TARGET_DIR)/usr/man
+39:
+<span id="ex2line40">40: libfoo: uclibc ncurses $(TARGET_DIR)/$(LIBFOO_TARGET_BINARY)</span>
+41:
+<span id="ex2line42">42: libfoo-source: $(DL_DIR)/$(LIBFOO_SOURCE)</span>
+43:
+<span id="ex2line44">44: libfoo-clean:</span>
+45: 	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(LIBFOO_DIR) uninstall
+46: 	-$(MAKE) -C $(LIBFOO_DIR) clean
+47:
+<span id="ex2line48">48: libfoo-dirclean:</span>
+49: 	rm -rf $(LIBFOO_DIR)
+50:
+<span id="ex2line51">51: #############################################################</span>
+52: #
+53: # Toplevel Makefile options
+54: #
+55: #############################################################
+56: ifeq ($(BR2_PACKAGE_LIBFOO),y)
+57: TARGETS+=libfoo
+58: endif
 </pre>
 
-    <p>First of all, this Makefile example works for a package which comprises a single
-    binary executable. For other software, such as libraries or more
-    complex stuff with multiple binaries, it must be adapted. For examples look at
-    the other <code>*.mk</code> files in the <code>package</code>
-    directory. </p>
+    <p>First of all, this Makefile example works for a package which 
+    comprises a single binary executable. For other software, such as 
+    libraries or more complex stuff with multiple binaries, it must be 
+    adapted. For examples look at the other <code>*.mk</code> files in the 
+    <code>package</code> directory.</p>
 
     <p>At lines <a href="#ex2line6">6-11</a>, a couple of useful variables are
     defined:</p>
 
     <ul>
+      <li><code>LIBFOO_VERSION</code>: The version of <i>libfoo</i> that 
+      should be downloaded.</li>
 
-     <li><code>FOO_VERSION</code>: The version of <i>foo</i> that
-     should be downloaded. </li>
+      <li><code>LIBFOO_SOURCE</code>: The name of the tarball of <i>libfoo</i> 
+      on the download website or FTP site. As you can see 
+      <code>LIBFOO_VERSION</code> is used.</li>
 
-     <li><code>FOO_SOURCE</code>: The name of the tarball of
-     <i>foo</i> on the download website or FTP site. As you can see
-     <code>FOO_VERSION</code> is used. </li>
+      <li><code>LIBFOO_SITE</code>: The HTTP or FTP site from which 
+      <i>libfoo</i> archive is downloaded. It must include the complete path to 
+      the directory where <code>LIBFOO_SOURCE</code> can be found.</li>
 
-     <li><code>FOO_SITE</code>: The HTTP or FTP site from which
-     <i>foo</i> archive is downloaded. It must include the complete
-     path to the directory where <code>FOO_SOURCE</code> can be
-     found. </li>
+      <li><code>LIBFOO_DIR</code>: The directory into which the software will 
+      be configured and compiled. Basically, it's a subdirectory of 
+      <code>BUILD_DIR</code> which is created upon decompression of the tarball.
+      </li>
 
-     <li><code>FOO_DIR</code>: The directory into which the software
-     will be configured and compiled. Basically, it's a subdirectory
-     of <code>BUILD_DIR</code> which is created upon decompression of
-     the tarball. </li>
+      <li><code>LIBFOO_BINARY</code>: Software binary name. As said previously, 
+      this is an example for a package with a single binary.</li>
+
+      <li><code>LIBFOO_TARGET_BINARY</code>: The full path of the binary inside 
+      the target filesystem.</li> </ul>
+
+    <p>Lines <a href="#ex2line13">13-14</a> define a target that downloads 
+    the tarball from the remote site to the download directory 
+    (<code>DL_DIR</code>).</p>
+
+    <p>Lines <a href="#ex2line16">16-18</a> define a target and associated 
+    rules that uncompress the downloaded tarball. As you can see, this 
+    target depends on the tarball file so that the previous target (lines <a 
+    href="#ex2line13">13-14</a>) is called before executing the rules of the 
+    current target. Uncompressing is followed by <i>touching</i> a hidden 
+    file to mark the software as having been uncompressed. This trick is 
+    used everywhere in a Buildroot Makefile to split steps (download, 
+    uncompress, configure, compile, install) while still having correct 
+    dependencies.</p>
+
+    <p>Lines <a href="#ex2line20">20-31</a> define a target and associated 
+    rules that configure the software. It depends on the previous target 
+    (the hidden <code>.source</code> file) so that we are sure the software 
+    has been uncompressed. In order to configure the package, it basically 
+    runs the well-known <code>./configure</code> script. As we may be doing 
+    cross-compilation, <code>target</code>, <code>host</code> and 
+    <code>build</code> arguments are given. The prefix is also set to 
+    <code>/usr</code>, not because the software will be installed in 
+    <code>/usr</code> on your host system, but because the software will bin 
+    installed in <code> /usr</code> on the target filesystem. Finally it 
+    creates a <code>.configured</code> file to mark the software as 
+    configured.</p>
+
+    <p>Lines <a href="#ex2line33">33-34</a> define a target and a rule that 
+    compile the software. This target will create the binary file in the 
+    compilation directory and depends on the software being already 
+    configured (hence the reference to the <code>.configured</code> file). 
+    It basically runs <code>make</code> inside the source directory.</p>
+
+    <p>Lines <a href="#ex2line36">36-38</a> define a target and associated 
+    rules that install the software inside the target filesystem. They 
+    depend on the binary file in the source directory to make sure the 
+    software has been compiled. They use the <code>install-strip</code> 
+    target of the software <code>Makefile</code> by passing a 
+    <code>DESTDIR</code> argument so that the <code>Makefile</code> doesn't 
+    try to install the software in the host <code>/usr</code> but rather in 
+    the target <code>/usr</code>. After the installation, the 
+    <code>/usr/man </code> directory inside the target filesystem is removed 
+    to save space. </p>
+
+    <p>Line <a href="#ex2line40">40</a> defines the main target of the 
+    software &mdash; the one that will be eventually be used by the top level 
+    <code>Makefile</code> to download, compile, and then install this 
+    package. This target should first of all depend on all needed 
+    dependencies of the software (in our example, <i>uclibc</i> and 
+    <i>ncurses</i>) and also depend on the final binary. This last dependency 
+    will call all previous dependencies in the correct order.</p>
+
+    <p>Line <a href="#ex2line42">42</a> defines a simple target that only 
+    downloads the code source. This is not used during normal operation of 
+    Buildroot, but is needed if you intend to download all required sources 
+    at once for later offline build. Note that if you add a new package 
+    providing a <code>libfoo-source</code> target is <i>mandatory</i> to 
+    support users that wish to do offline-builds. Furthermore it eases 
+    checking if all package-sources are downloadable.</p>
+
+    <p>Lines <a href="#ex2line44">44-46</a> define a simple target to clean 
+    the software build by calling the Makefiles with the appropriate option. 
+    The <code>-clean</code> target should run <code>make clean</code> on 
+    $(BUILD_DIR)/package-version and MUST uninstall all files of the package 
+    from $(STAGING_DIR) and from $(TARGET_DIR).</p>
+
+    <p>Lines <a href="#ex2line48">48-49</a> define a simple target to 
+    completely remove the directory in which the software was uncompressed, 
+    configured and compiled. The <code>-dirclean</code> target MUST 
+    completely rm $(BUILD_DIR)/ package-version.</p>
+
+    <p>Lines <a href="#ex2line51">51-58</a> add the target <code>libfoo</code> 
+    to the list of targets to be compiled by Buildroot by first checking if 
+    the configuration option for this package has been enabled using the 
+    configuration tool. If so, it then &quot;subscribes&quot; this package 
+    to be compiled by adding the package to the TARGETS global variable.  
+    The name added to the TARGETS global variable is the name of this 
+    package's target, as defined on line <a href="#ex2line40">40</a>, which 
+    is used by Buildroot to download, compile, and then install this package.
+    </p>
 
-     <li><code>FOO_BINARY</code>: Software binary name. As said
-     previously, this is an example for a package with a single binary.</li>
+    <h3 id="gettext-integration">Gettext integration and interaction with packages</h3>
 
-     <li><code>FOO_TARGET_BINARY</code>: The full path of the binary
-     inside the target filesystem. </li>
+    <p>Many packages that support internationalization use the gettext 
+    library. Dependency on this library are fairly complicated and therefore 
+    deserves a few explanations.</p>
 
-    </ul>
+    <p>The <i>uClibc</i> C library doesn't implement gettext functionality, 
+    therefore with this C library, a separate gettext must be compiled. On 
+    the other hand, the <i>glibc</i> C library does integrate its own 
+    gettext, and in this case, the separate gettext library should not be 
+    compiled, because it creates various kind of build failures.</p>
 
-    <p>Lines <a href="#ex2line13">13-14</a> define a target that downloads the
-    tarball from the remote site to the download directory
-    (<code>DL_DIR</code>). </p>
-
-    <p>Lines <a href="#ex2line16">16-18</a> define a target and associated rules
-    that uncompress the downloaded tarball. As you can see, this target
-    depends on the tarball file so that the previous target (lines
-    <a href="#ex2line13">13-14</a>) is called before executing the rules of the
-    current target. Uncompressing is followed by <i>touching</i> a hidden file
-    to mark the software as having been uncompressed. This trick is
-    used everywhere in a Buildroot Makefile to split steps
-    (download, uncompress, configure, compile, install) while still
-    having correct dependencies. </p>
-
-    <p>Lines <a href="#ex2line20">20-31</a> define a target and associated rules
-    that configure the software. It depends on the previous target (the
-    hidden <code>.source</code> file) so that we are sure the software has
-    been uncompressed. In order to configure the package, it basically runs the
-    well-known <code>./configure</code> script. As we may be doing
-    cross-compilation, <code>target</code>, <code>host</code> and
-    <code>build</code> arguments are given. The prefix is also set to
-    <code>/usr</code>, not because the software will be installed in
-    <code>/usr</code> on your host system, but because the software will
-    bin installed in <code>/usr</code> on the target
-    filesystem. Finally it creates a <code>.configured</code> file to
-    mark the software as configured. </p>
-
-    <p>Lines <a href="#ex2line33">33-34</a> define a target and a rule that
-    compile the software. This target will create the binary file in the
-    compilation directory and depends on the software being already
-    configured (hence the reference to the <code>.configured</code>
-    file). It basically runs <code>make</code> inside the source
-    directory. </p>
-
-    <p>Lines <a href="#ex2line36">36-38</a> define a target and associated rules
-    that install the software inside the target filesystem. They depend on the
-    binary file in the source directory to make sure the software has
-    been compiled. They use the <code>install-strip</code> target of the
-    software <code>Makefile</code> by passing a <code>DESTDIR</code>
-    argument so that the <code>Makefile</code> doesn't try to install
-    the software in the host <code>/usr</code> but rather in the target
-    <code>/usr</code>. After the installation, the
-    <code>/usr/man</code> directory inside the target filesystem is
-    removed to save space. </p>
-
-    <p>Line <a href="#ex2line40">40</a> defines the main target of the software &mdash;
-    the one that will be eventually be used by the top level
-    <code>Makefile</code> to download, compile, and then install
-    this package. This target should first of all depend on all
-    needed dependencies of the software (in our example,
-    <i>uclibc</i> and <i>ncurses</i>) and also depend on the
-    final binary. This last dependency will call all previous
-    dependencies in the correct order. </p>
-
-    <p>Line <a href="#ex2line42">42</a> defines a simple target that only
-    downloads the code source. This is not used during normal operation of
-    Buildroot, but is needed if you intend to download all required sources at
-    once for later offline build. Note that if you add a new package providing
-    a <code>foo-source</code> target is <i>mandatory</i> to support
-    users that wish to do offline-builds. Furthermore it eases checking
-    if all package-sources are downloadable. </p>
-
-    <p>Lines <a href="#ex2line44">44-46</a> define a simple target to clean the
-    software build by calling the Makefiles with the appropriate option.
-    The <code>-clean</code> target should run <code>make clean</code>
-    on $(BUILD_DIR)/package-version and MUST uninstall all files of the
-    package from $(STAGING_DIR) and from $(TARGET_DIR). </p>
-
-    <p>Lines <a href="#ex2line48">48-49</a> define a simple target to completely
-    remove the directory in which the software was uncompressed, configured and
-    compiled. The <code>-dirclean</code> target MUST completely rm $(BUILD_DIR)/
-    package-version. </p>
-
-    <p>Lines <a href="#ex2line51">51-58</a> add the target <code>foo</code> to
-    the list of targets to be compiled by Buildroot by first checking if
-    the configuration option for this package has been enabled
-    using the configuration tool. If so, it then &quot;subscribes&quot;
-    this package to be compiled by adding the package to the TARGETS
-    global variable.  The name added to the TARGETS global
-    variable is the name of this package's target, as defined on
-    line <a href="#ex2line40">40</a>, which is used by Buildroot to download,
-    compile, and then install this package. </p>
-
-    <h3><a name="gettext-integration"></a>Gettext integration and
-    interaction with packages</h3>
-
-    <p>Many packages that support internationalization use the gettext
-    library. Dependency on this library are fairly complicated and
-    therefore deserves a few explanations.</p>
-
-    <p>The <i>uClibc</i> C library doesn't implement gettext
-    functionality, therefore with this C library, a separate gettext
-    must be compiled. On the other hand, the <i>glibc</i> C library
-    does integrate its own gettext, and in this case, the separate
-    gettext library should not be compiled, because it creates various
-    kind of build failures.</p>
-
-    <p>Additionally, some packages (such as libglib2) do require
-    gettext unconditionally, while other packages (those who
-    support <code>--disable-nls</code> in general) only require
-    gettext when locale support is enabled.</p>
+    <p>Additionally, some packages (such as libglib2) do require gettext 
+    unconditionally, while other packages (those who support 
+    <code>--disable-nls</code> in general) only require gettext when locale 
+    support is enabled.</p>
 
     <p>Therefore, Buildroot defines two configuration options:</p>
 
@@ -1625,64 +1517,52 @@ LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
       <li><code>BR2_NEEDS_GETTEXT</code>, which is true as soon as the
       toolchain doesn't provide its own gettext implementation</li>
 
-      <li><code>BR2_NEEDS_GETTEXT_IF_LOCALE</code>, which is true if
-      the toolchain doesn't provide its own gettext implementation and
-      if locale support is enabled</li>
-
-    </ul>
+      <li><code>BR2_NEEDS_GETTEXT_IF_LOCALE</code>, which is true if the 
+      toolchain doesn't provide its own gettext implementation and if locale 
+      support is enabled</li> </ul>
 
     <p>Therefore, packages that unconditionally need gettext should:</p>
 
     <ol>
-      <li>Use <code>select BR2_PACKAGE_GETTEXT if
-      BR2_NEEDS_GETTEXT</code> and possibly <code>select
-      BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT</code> if libintl is
-      also needed</li>
+      <li>Use <code>select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT</code> 
+      and possibly <code>select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT</code> 
+      if libintl is also needed</li>
 
-      <li>Use <code>$(if $(BR2_NEEDS_GETTEXT),gettext)</code> in the
-      package <code>DEPENDENCIES</code> variable</li>
+      <li>Use <code>$(if $(BR2_NEEDS_GETTEXT),gettext)</code> in the package 
+      <code>DEPENDENCIES</code> variable</li>
     </ol>
 
-    <p>Packages that need gettext only when locale support is enabled
-    should:</p>
+    <p>Packages that need gettext only when locale support is enabled should:
+    </p>
 
     <ol>
-      <li>Use <code>select BR2_PACKAGE_GETTEXT if
-      BR2_NEEDS_GETTEXT_IF_LOCALE</code> and possibly <code>select
-      BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE</code> if
-      libintl is also needed</li>
-
-      <li>Use <code>$(if
-      $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)</code> in the
-      package <code>DEPENDENCIES</code> variable</li>
+      <li>Use 
+      <code>select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE</code> 
+      and possibly 
+      <code>select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE</code> 
+      if libintl is also needed</li>
+
+      <li>Use <code>$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)</code> in 
+      the package <code>DEPENDENCIES</code> variable</li>
     </ol>
 
     <h3>Conclusion</h3>
 
-    <p>As you can see, adding a software package to Buildroot is simply a
-    matter of writing a Makefile using an  existing
-    example and modifying it according to the compilation process required by
-    the package. </p>
+    <p>As you can see, adding a software package to Buildroot is simply a 
+    matter of writing a Makefile using an  existing example and modifying it 
+    according to the compilation process required by the package.</p>
 
-    <p>If you package software that might be useful for other people,
-    don't forget to send a patch to Buildroot developers!</p>
+    <p>If you package software that might be useful for other people, don't 
+    forget to send a patch to Buildroot developers!</p>
 
-     <h2><a name="links" id="links"></a>Resources</h2>
+    <h2 id="links">Resources</h2>
 
-    <p>To learn more about Buildroot you can visit these
-    websites:</p>
+    <p>To learn more about Buildroot you can visit these websites:</p>
 
     <ul>
       <li><a href="http://www.uclibc.org/">http://www.uclibc.org/</a></li>
       <li><a href="http://www.busybox.net/">http://www.busybox.net/</a></li>
     </ul>
   </div>
-<!--
-       <a href="http://validator.w3.org/check?uri=referer"><img
-       border="0" height="31" width="88"
-       src="images/valid-html401.png"
-       alt="Valid HTML"></img></a>
--->
-
 </body>
 </html>
-- 
1.7.3.1
