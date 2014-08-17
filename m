From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:09:52 +0200
Subject: [Buildroot] [git commit] manual: high-level restructuring
Message-ID: <20140817191115.D211E9D461@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=569db405741dfee119ebb211722f588557b83542
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The structure of the buildroot manual is not always clear. There is a large
number of chapters, and some chapters seem to overlap. The distinction
between general usage and developer information is not always clear.

This patch restructures the manual into four large parts:
- getting started
- user guide
- developer guide
- appendix

Except for the names of these parts, the section names are not yet changed.
Content-wise there are no changes yet either. This will be handled in
subsequent patches.

In order to achieve the introduction of a new level 'parts' above
'chapters', the section indicators (=, ==, ===, ...) of several sections
have to be moved one level down. Additionally, the leveloffset indication to
asciidoc has to be removed. Finally, to maintain more or less the same level
of detail in the table of contents, the toc.section.depth attribute is
reduced as well. Note that for some sections, less detail is visible now.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/advanced.txt                    |    2 +-
 docs/manual/appendix.txt                    |    2 --
 docs/manual/beyond-buildroot.txt            |    8 ++++----
 docs/manual/ccache-support.txt              |    2 +-
 docs/manual/contribute.txt                  |   18 +++++++++---------
 docs/manual/developer-guide.txt             |    2 --
 docs/manual/download-location.txt           |    2 +-
 docs/manual/faq-troubleshooting.txt         |   16 ++++++++--------
 docs/manual/get-involved.txt                |   26 +++++++++++++-------------
 docs/manual/going-further.txt               |    2 +-
 docs/manual/how-buildroot-works.txt         |    2 +-
 docs/manual/introduction.txt                |    2 +-
 docs/manual/known-issues.txt                |    2 +-
 docs/manual/legal-notice.txt                |    8 ++++----
 docs/manual/manual.mk                       |    4 ++--
 docs/manual/manual.txt                      |   12 +++++++++---
 docs/manual/package-make-target.txt         |    2 +-
 docs/manual/starting-up.txt                 |    2 --
 docs/manual/using-buildroot-debugger.txt    |    2 +-
 docs/manual/using-buildroot-development.txt |    2 +-
 docs/manual/using-buildroot-toolchain.txt   |    2 +-
 docs/manual/working-with.txt                |    2 --
 22 files changed, 60 insertions(+), 62 deletions(-)

diff --git a/docs/manual/advanced.txt b/docs/manual/advanced.txt
index 05c5242..b7bfc49 100644
--- a/docs/manual/advanced.txt
+++ b/docs/manual/advanced.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== Advanced usage
+=== Advanced usage
 
 include::using-buildroot-toolchain.txt[]
 
diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index 3f95551..87a20bd 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -1,8 +1,6 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Appendix
-
 include::makedev-syntax.txt[]
 include::makeusers-syntax.txt[]
 
diff --git a/docs/manual/beyond-buildroot.txt b/docs/manual/beyond-buildroot.txt
index 5b99613..b8b1973 100644
--- a/docs/manual/beyond-buildroot.txt
+++ b/docs/manual/beyond-buildroot.txt
@@ -1,11 +1,11 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Beyond Buildroot
+== Beyond Buildroot
 
-== Boot the generated images
+=== Boot the generated images
 
-=== NFS boot
+==== NFS boot
 
 To achieve NFS-boot, enable _tar root filesystem_ in the _Filesystem
 images_ menu.
@@ -21,7 +21,7 @@ Remember to add this path to +/etc/exports+.
 
 Then, you can execute a NFS-boot from your target.
 
-== Chroot
+=== Chroot
 
 If you want to chroot in a generated image, then there are few thing
 you should be aware of:
diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
index c6771bd..992471d 100644
--- a/docs/manual/ccache-support.txt
+++ b/docs/manual/ccache-support.txt
@@ -2,7 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[ccache]]
-=== Using +ccache+ in Buildroot
+==== Using +ccache+ in Buildroot
 
 http://ccache.samba.org[ccache] is a compiler cache. It stores the
 object files resulting from each compilation process, and is able to
diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index b7e8944..c8e819d 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Contributing to Buildroot
+== Contributing to Buildroot
 
 There are many ways in which you can contribute to Buildroot: analyzing
 and fixing bugs, analyzing and fixing package build failures detected by
@@ -22,7 +22,7 @@ source code tarball. Git is the easiest way to develop from and directly
 send your patches to the mailing list. Refer to xref:getting-buildroot[]
 for more information on obtaining a Buildroot git tree.
 
-== Reproducing, analyzing and fixing bugs
+=== Reproducing, analyzing and fixing bugs
 
 A first way of contributing is to have a look at the open bug reports in
 the https://bugs.busybox.net/buglist.cgi?product=buildroot[Buildroot bug
@@ -31,7 +31,7 @@ help in reproducing, analyzing and fixing reported bugs is more than
 welcome. Don't hesitate to add a comment to bug reports reporting your
 findings, even if you don't yet see the full picture.
 
-== Analyzing and fixing autobuild failures
+=== Analyzing and fixing autobuild failures
 
 The Buildroot autobuilders are a set of build machines that continuously
 run Buildroot builds based on random configurations. This is done for
@@ -76,7 +76,7 @@ basically two things that can be done:
 Fixes http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
 ---------------------
 
-== Reviewing and testing patches
+=== Reviewing and testing patches
 
 With the amount of patches sent to the mailing list each day, the
 maintainer has a very hard job to judge which patches are ready to apply
@@ -142,7 +142,7 @@ Buildroot's Patchwork website can be used to pull in patches for testing
 purposes. Please see xref:apply-patches-patchwork[] for more
 information on using Buildroot's Patchwork website to apply patches.
 
-== Work on items from the TODO list
+=== Work on items from the TODO list
 
 If you want to contribute to Buildroot but don't know where to start,
 and you don't like any of the above topics, you can always work on items
@@ -152,7 +152,7 @@ Do edit the wiki to indicate when you start working on an item, so we
 avoid duplicate efforts.
 
 [[submitting-patches]]
-== Submitting patches
+=== Submitting patches
 
 [NOTE]
 _Please, do not attach patches to bugs, send them to the mailing list
@@ -196,7 +196,7 @@ If you do not use +git send-email+, make sure posted *patches are not
 line-wrapped*, otherwise they cannot easily be applied. In such a case,
 fix your e-mail client, or better yet, learn to use +git send-email+.
 
-=== Cover letter
+==== Cover letter
 
 If you want to present the whole patch set in a separate mail, add
 +--cover-letter+ to the +git format-patch+ command (see +man
@@ -215,7 +215,7 @@ in the following cases:
 * whenever you feel it will help presenting your work, your choices,
   the review process, etc.
 
-=== Patch revision changelog
+==== Patch revision changelog
 
 When improvements are requested, the new revision of each commit
 should include a changelog of the modifications between each
@@ -276,7 +276,7 @@ $ git format-patch --subject-prefix "PATCH v4" \
 ---------------------
 
 [[reporting-bugs]]
-== Reporting issues/bugs or getting help
+=== Reporting issues/bugs or getting help
 
 Before reporting any issue, please check
 xref:mailing-list-subscribe[the mailing list archive] in case someone has
diff --git a/docs/manual/developer-guide.txt b/docs/manual/developer-guide.txt
index 8c2b96c..cba05b3 100644
--- a/docs/manual/developer-guide.txt
+++ b/docs/manual/developer-guide.txt
@@ -1,8 +1,6 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Developer Guidelines
-
 include::writing-rules.txt[]
 
 include::adding-packages.txt[]
diff --git a/docs/manual/download-location.txt b/docs/manual/download-location.txt
index 06a29a7..6a1bd67 100644
--- a/docs/manual/download-location.txt
+++ b/docs/manual/download-location.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== Location of downloaded packages
+==== Location of downloaded packages
 
 The various tarballs that are downloaded by Buildroot are all stored
 in +BR2_DL_DIR+, which by default is the +dl+ directory. If you want
diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 26c8460..7195234 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -1,10 +1,10 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Frequently Asked Questions & Troubleshooting
+== Frequently Asked Questions & Troubleshooting
 
 [[faq-boot-hang-after-starting]]
-== The boot hangs after 'Starting network...'
+=== The boot hangs after 'Starting network...'
 
 If the boot process seems to hang after the following messages
 (messages not necessarily exactly similar, depending on the list of
@@ -26,7 +26,7 @@ submenu. This will automatically tune the +/etc/inittab+ file of the
 generated system so that a shell starts on the correct serial port.
 
 [[faq-no-compiler-on-target]]
-== Why is there no compiler on the target?
+=== Why is there no compiler on the target?
 
 It has been decided that support for the _native compiler on the
 target_ would be stopped from the Buildroot-2012.11 release because:
@@ -50,7 +50,7 @@ distribution_ and you should opt for something like:
 * ...
 
 [[faq-no-dev-files-on-target]]
-== Why are there no development files on the target?
+=== Why are there no development files on the target?
 
 Since there is no compiler available on the target (see
 xref:faq-no-compiler-on-target[]), it does not make sense to waste
@@ -60,7 +60,7 @@ Therefore, those files are always removed from the target since the
 Buildroot-2012.11 release.
 
 [[faq-no-doc-on-target]]
-== Why is there no documentation on the target?
+=== Why is there no documentation on the target?
 
 Because Buildroot mostly targets _small_ or _very small_ target
 hardware with limited resource onboard (CPU, ram, mass-storage), it
@@ -71,7 +71,7 @@ is not suitable for your purpose, and you should look for a _real
 distribution_ (see: xref:faq-no-compiler-on-target[]).
 
 [[faq-why-not-visible-package]]
-== Why are some packages not visible in the Buildroot config menu?
+=== Why are some packages not visible in the Buildroot config menu?
 
 If a package exists in the Buildroot tree and does not appear in the
 config menu, this most likely means that some of the package's
@@ -89,7 +89,7 @@ then you should certainly run a full rebuild (see xref:make-tips[] for
 more explanations).
 
 [[faq-why-not-use-target-as-chroot]]
-== Why not use the target directory as a chroot directory?
+=== Why not use the target directory as a chroot directory?
 
 There are plenty of reasons to *not* use the target directory a chroot
 one, among these:
@@ -106,7 +106,7 @@ root, then use the tarball image generated in +images/+ and extract it
 as root.
 
 [[faq-no-binary-packages]]
-== Why doesn't Buildroot generate binary packages (.deb, .ipkg...)?
+=== Why doesn't Buildroot generate binary packages (.deb, .ipkg...)?
 
 One feature that is often discussed on the Buildroot list is the
 general topic of "package management". To summarize, the idea
diff --git a/docs/manual/get-involved.txt b/docs/manual/get-involved.txt
index 4be88df..0630d04 100644
--- a/docs/manual/get-involved.txt
+++ b/docs/manual/get-involved.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Getting involved
+== Getting involved
 
 Like any open source project, Buildroot has different ways to share
 information in its community and outside.
@@ -11,7 +11,7 @@ One piece of it is the document you are currently reading ;-).
 Each of those ways may interest you if you are looking for some help,
 want to understand Buildroot or contribute to the project.
 
-== Mailing List
+=== Mailing List
 
 Buildroot has a mailing list
 http://lists.busybox.net/pipermail/buildroot[] for discussion and
@@ -19,7 +19,7 @@ development.
 
 [[mailing-list-subscribe]]
 
-=== Subscribing to the mailing list
+==== Subscribing to the mailing list
 
 You can subscribe by visiting
 http://lists.busybox.net/mailman/listinfo/buildroot[].
@@ -30,14 +30,14 @@ The list is also available through _Gmane_ http://gmane.org[], at
 +gmane.comp.lib.uclibc.buildroot+
 http://dir.gmane.org/gmane.comp.lib.uclibc.buildroot[].
 
-=== Searching the List Archives
+==== Searching the List Archives
 
 Please search the mailing list archives before asking questions on the
 mailing list, since there is a good chance someone else has asked the
 same question before. Checking the archives is a great way to avoid
 annoying everyone on the list with frequently asked questions...
 
-== IRC
+=== IRC
 
 The Buildroot IRC is irc://freenode.net/#buildroot[].
 The channel +#buildroot+ is hosted on Freenode
@@ -47,7 +47,7 @@ When asking for help on IRC, share relevant logs or pieces of code
 using a code sharing website.
 
 [[patchwork]]
-== Patchwork
+=== Patchwork
 
 Patchwork is a web-based patch tracking system designed to facilitate
 the contribution and management of contributions to an open-source
@@ -66,7 +66,7 @@ The Buildroot patch management interface is available at
 http://patchwork.buildroot.org[].
 
 [[apply-patches-patchwork]]
-=== Applying Patches from Patchwork
+==== Applying Patches from Patchwork
 
 The main use of Buildroot's Patchwork website for a developer is for
 pulling in patches into their local git repository for testing
@@ -88,13 +88,13 @@ you can copy the +mbox+ link for the bundle and apply the bundle
 using the above commands.
 
 [[bugtracker]]
-== Bugtracker
+=== Bugtracker
 
 The Buildroot bugtracker is at https://bugs.busybox.net[].
 
 To open a bug, see xref:reporting-bugs[].
 
-== Buildroot wikipage
+=== Buildroot wikipage
 
 After the Buildroot developer day on February 3, 2012,
 a page dedicated to Buildroot has been created on
@@ -105,17 +105,17 @@ This page is reachable at http://elinux.org/Buildroot[].
 Currently, this page is mainly used as a _todo-list_.
 
 [[events]]
-== Events
+=== Events
 
-=== Buildroot Developer Days aside ELC-E 2012 (November 3-4, 2012 - Barcelona)
+==== Buildroot Developer Days aside ELC-E 2012 (November 3-4, 2012 - Barcelona)
 
 * Event page: http://elinux.org/Buildroot:DeveloperDaysELCE2012[]
 
-=== Buildroot presentation at LSM 2012 (July 12-14, 2012 - Geneva)
+==== Buildroot presentation at LSM 2012 (July 12-14, 2012 - Geneva)
 
 * Announcement: http://lists.busybox.net/pipermail/buildroot/2012-May/053845.html[]
 
-=== Buildroot Developer Days aside FOSDEM 2012 (February 3, 2012 - Brussels)
+==== Buildroot Developer Days aside FOSDEM 2012 (February 3, 2012 - Brussels)
 
 * Announcement & agenda thread: http://lists.busybox.net/pipermail/buildroot/2012-January/049340.html[]
 * Report: http://lists.busybox.net/pipermail/buildroot/2012-February/050371.html[]
diff --git a/docs/manual/going-further.txt b/docs/manual/going-further.txt
index ac1c071..e9ffcd2 100644
--- a/docs/manual/going-further.txt
+++ b/docs/manual/going-further.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Going further in Buildroot's innards
+== Going further in Buildroot's innards
 
 include::how-buildroot-works.txt[]
 
diff --git a/docs/manual/how-buildroot-works.txt b/docs/manual/how-buildroot-works.txt
index 1204d1e..3c09fd9 100644
--- a/docs/manual/how-buildroot-works.txt
+++ b/docs/manual/how-buildroot-works.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== How Buildroot works
+=== How Buildroot works
 
 As mentioned above, Buildroot is basically a set of Makefiles that
 download, configure, and compile software with the correct options. It
diff --git a/docs/manual/introduction.txt b/docs/manual/introduction.txt
index 6a0b54b..476aa81 100644
--- a/docs/manual/introduction.txt
+++ b/docs/manual/introduction.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= About Buildroot
+== About Buildroot
 
 Buildroot is a tool that simplifies and automates the process of
 building a complete Linux system for an embedded system, using
diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
index 5eaded9..38ba941 100644
--- a/docs/manual/known-issues.txt
+++ b/docs/manual/known-issues.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Known issues
+== Known issues
 
 * It is not possible to pass extra linker options via +BR2_TARGET_LDFLAGS+
   if such options contain a +$+ sign. For example, the following is known
diff --git a/docs/manual/legal-notice.txt b/docs/manual/legal-notice.txt
index d4344b9..7b17438 100644
--- a/docs/manual/legal-notice.txt
+++ b/docs/manual/legal-notice.txt
@@ -3,9 +3,9 @@
 
 [[legal-info]]
 
-= Legal notice and licensing
+== Legal notice and licensing
 
-== Complying with open source licenses
+=== Complying with open source licenses
 
 All of the end products of Buildroot (toolchain, root filesystem, kernel,
 bootloaders) contain open source software, released under various licenses.
@@ -69,7 +69,7 @@ When you run +make legal-info+, Buildroot produces warnings in the +README+
 file to inform you of relevant material that could not be saved.
 
 [[legal-info-list-licenses]]
-== License abbreviations
+=== License abbreviations
 
 Here is a list of the licenses that are most widely used by packages in
 Buildroot, with the name used in the manifest files:
@@ -123,7 +123,7 @@ Buildroot, with the name used in the manifest files:
   http://apache.org/licenses/LICENSE-2.0.html[
   Apache License, version 2.0];
 
-== Complying with the Buildroot license
+=== Complying with the Buildroot license
 
 Buildroot itself is an open source software, released under the
 http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General Public
diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 942bb35..8d401a2 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -84,8 +84,8 @@ endef
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 ################################################################################
 define GENDOC
-$(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
-$(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
+$(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 1")
+$(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 1")
 $(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
 $(call GENDOC_INNER,$(pkgname),text,text,text,text)
 $(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index bf89af9..6730e53 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -16,12 +16,14 @@ Copyright (C) 2004-2014 The Buildroot developers
 
 image::logo.png[]
 
-:leveloffset: 1
+= Getting started
 
 include::introduction.txt[]
 
 include::starting-up.txt[]
 
+= User guide
+
 include::working-with.txt[]
 
 include::faq-troubleshooting.txt[]
@@ -30,14 +32,18 @@ include::known-issues.txt[]
 
 include::going-further.txt[]
 
-include::developer-guide.txt[]
-
 include::legal-notice.txt[]
 
 include::beyond-buildroot.txt[]
 
+= Developer guide
+
+include::developer-guide.txt[]
+
 include::get-involved.txt[]
 
 include::contribute.txt[]
 
+= Appendix
+
 include::appendix.txt[]
diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index 61fecb4..25d3f44 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -3,7 +3,7 @@
 
 [[pkg-build-steps]]
 
-=== Package-specific _make_ targets
+==== Package-specific _make_ targets
 
 Running +make <package>+ builds and installs that particular package
 and its dependencies.
diff --git a/docs/manual/starting-up.txt b/docs/manual/starting-up.txt
index 8cb3a3a..aab1c85 100644
--- a/docs/manual/starting-up.txt
+++ b/docs/manual/starting-up.txt
@@ -1,8 +1,6 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Starting up
-
 include::prerequisite.txt[]
 
 include::getting.txt[]
diff --git a/docs/manual/using-buildroot-debugger.txt b/docs/manual/using-buildroot-debugger.txt
index 962ecf7..b5063ca 100644
--- a/docs/manual/using-buildroot-debugger.txt
+++ b/docs/manual/using-buildroot-debugger.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== Using +gdb+ in Buildroot
+==== Using +gdb+ in Buildroot
 
 Buildroot allows to do cross-debugging, where the debugger runs on the
 build machine and communicates with +gdbserver+ on the target to
diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
index e660e65..a075416 100644
--- a/docs/manual/using-buildroot-development.txt
+++ b/docs/manual/using-buildroot-development.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== Using Buildroot during development
+==== Using Buildroot during development
 
 The normal operation of Buildroot is to download a tarball, extract
 it, configure, compile and install the software component found inside
diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 3e30cd7..3c87282 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== Using the generated toolchain outside Buildroot
+==== Using the generated toolchain outside Buildroot
 
 You may want to compile, for your target, your own programs or other
 software that are not packaged in Buildroot. In order to do this you
diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
index 460eb53..7ad855d 100644
--- a/docs/manual/working-with.txt
+++ b/docs/manual/working-with.txt
@@ -1,8 +1,6 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Working with Buildroot
-
 This section explains how you can customize Buildroot to fit your
 needs.
 
