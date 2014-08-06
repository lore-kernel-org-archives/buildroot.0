From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 06 Aug 2014 20:21:55 +0200
Subject: [Buildroot] [PATCH RFC for 2014.08] manual: high-level restructuring
Message-ID: <3dea9add9b6cc9fad680.1407349315@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
 docs/manual/advanced.txt                    |   2 +-
 docs/manual/appendix.txt                    |   2 --
 docs/manual/beyond-buildroot.txt            |   8 ++++----
 docs/manual/ccache-support.txt              |   2 +-
 docs/manual/contribute.txt                  |  18 +++++++++---------
 docs/manual/developer-guide.txt             |   2 --
 docs/manual/download-location.txt           |   2 +-
 docs/manual/faq-troubleshooting.txt         |  16 ++++++++--------
 docs/manual/get-involved.txt                |  26 +++++++++++++------------
 docs/manual/going-further.txt               |   2 +-
 docs/manual/how-buildroot-works.txt         |   2 +-
 docs/manual/introduction.txt                |   2 +-
 docs/manual/known-issues.txt                |   2 +-
 docs/manual/legal-notice.txt                |   8 ++++----
 docs/manual/manual.mk                       |   4 ++--
 docs/manual/manual.txt                      |  12 +++++++++---
 docs/manual/package-make-target.txt         |   2 +-
 docs/manual/starting-up.txt                 |   2 --
 docs/manual/using-buildroot-debugger.txt    |   2 +-
 docs/manual/using-buildroot-development.txt |   2 +-
 docs/manual/using-buildroot-toolchain.txt   |   2 +-
 docs/manual/working-with.txt                |   2 --
 22 files changed, 60 insertions(+), 62 deletions(-)


Some notes:
- It is my goal to get the restructured manual in shape for inclusion
  into 2014.08. I will need your feedback to achieve this.

- I did not yet rename or restructure the files in docs/manual. I first want
  to get an approval on the layout. Note that the current organization of
  contents into files reflects the structure a bit too much IMO, with some
  files simply including other files but not adding content. This makes it
  difficult to reorganize.
  I am considering to flatten the file organization to address this problem.

- I'm planning subsequent patches to join some sections together, update
  some section titles, and if needed address the content itself.
  Additionally, I'm considering to remove the 'Events' section as it is not
  up-to-date and hard to maintain. The wiki is better suited for such type
  of information, IMO.

- Taking into account the above notes, I'm currently not expecting a deep
  review, since many things are yet to change. Rather, I simply need your
  opinion on the direction I'm taking with respect to organization and the
  proposed structure.
  Your concerns or requests with respect to subsequent patches are of course
  also welcome.


For easy reviewing, the original table of contents was:

1. About Buildroot
2. Starting up
    2.1. System requirements
        2.1.1. Mandatory packages
        2.1.2. Optional packages
    2.2. Getting Buildroot
    2.3. Using Buildroot
3. Working with Buildroot
    3.1. Details on Buildroot configuration
        3.1.1. Cross-compilation toolchain
        3.1.2. /dev management
        3.1.3. init system
    3.2. make tips
    3.3. Customization
        3.3.1. Customizing the generated target filesystem
        3.3.2. Customizing the BusyBox configuration
        3.3.3. Customizing the uClibc configuration
        3.3.4. Customizing the Linux kernel configuration
        3.3.5. Customizing the toolchain
    3.4. Storing the configuration
        3.4.1. Basics for storing the configuration
        3.4.2. Creating your own board support
        3.4.3. Step-by-step instructions for storing configuration
        3.4.4. Customizing packages
        3.4.5. Keeping customizations outside Buildroot
    3.5. Daily use
        3.5.1. Understanding when a full rebuild is necessary
        3.5.2. Understanding how to rebuild packages
        3.5.3. Offline builds
        3.5.4. Building out-of-tree
        3.5.5. Environment variables
        3.5.6. Dealing efficiently with filesystem images
        3.5.7. Graphing the dependencies between packages
        3.5.8. Graphing the build duration
    3.6. Integration with Eclipse
    3.7. Hacking Buildroot
4. Frequently Asked Questions & Troubleshooting
    4.1. The boot hangs after Starting network?
    4.2. Why is there no compiler on the target?
    4.3. Why are there no development files on the target?
    4.4. Why is there no documentation on the target?
    4.5. Why are some packages not visible in the Buildroot config menu?
    4.6. Why not use the target directory as a chroot directory?
    4.7. Why doesn?t Buildroot generate binary packages (.deb, .ipkg?)?
5. Known issues
6. Going further in Buildroot?s innards
    6.1. How Buildroot works
    6.2. Advanced usage
        6.2.1. Using the generated toolchain outside Buildroot
        6.2.2. Using gdb in Buildroot
        6.2.3. Using ccache in Buildroot
        6.2.4. Location of downloaded packages
        6.2.5. Package-specific make targets
        6.2.6. Using Buildroot during development
7. Developer Guidelines
    7.1. Coding style
        7.1.1. Config.in file
        7.1.2. The .mk file
        7.1.3. The documentation
    7.2. Adding new packages to Buildroot
        7.2.1. Package directory
        7.2.2. Config.in file
        7.2.3. The .mk file
        7.2.4. The .hash file
        7.2.5. Infrastructure for packages with specific build systems
        7.2.6. Infrastructure for autotools-based packages
        7.2.7. Infrastructure for CMake-based packages
        7.2.8. Infrastructure for Python packages
        7.2.9. Infrastructure for LuaRocks-based packages
        7.2.10. Infrastructure for Perl/CPAN packages
        7.2.11. Infrastructure for virtual packages
        7.2.12. Infrastructure for packages using kconfig for configuration
                files
        7.2.13. Hooks available in the various build steps
        7.2.14. Gettext integration and interaction with packages
        7.2.15. Tips and tricks
        7.2.16. Conclusion
    7.3. Patching a package
        7.3.1. Providing patches
        7.3.2. How patches are applied
        7.3.3. Format and licensing of the package patches
        7.3.4. Integrating patches found on the Web
    7.4. Download infrastructure
    7.5. Debugging Buildroot
8. Legal notice and licensing
    8.1. Complying with open source licenses
    8.2. License abbreviations
    8.3. Complying with the Buildroot license
9. Beyond Buildroot
    9.1. Boot the generated images
        9.1.1. NFS boot
    9.2. Chroot
10. Getting involved
    10.1. Mailing List
        10.1.1. Subscribing to the mailing list
        10.1.2. Searching the List Archives
    10.2. IRC
    10.3. Patchwork
        10.3.1. Applying Patches from Patchwork
    10.4. Bugtracker
    10.5. Buildroot wikipage
    10.6. Events
        10.6.1. Buildroot Developer Days aside ELC-E 2012 (November 3-4,
2012 - Barcelona)
        10.6.2. Buildroot presentation at LSM 2012 (July 12-14, 2012 -
                Geneva)
        10.6.3. Buildroot Developer Days aside FOSDEM 2012 (February 3, 2012
                - Brussels)
11. Contributing to Buildroot
    11.1. Reproducing, analyzing and fixing bugs
    11.2. Analyzing and fixing autobuild failures
    11.3. Reviewing and testing patches
    11.4. Work on items from the TODO list
    11.5. Submitting patches
        11.5.1. Cover letter
        11.5.2. Patch revision changelog
    11.6. Reporting issues/bugs or getting help
12. Appendix
    12.1. Makedev syntax documentation
    12.2. Makeuser syntax documentation
    12.3. List of target packages available in Buildroot
    12.4. List of virtual packages
    12.5. List of host utilities available in Buildroot
    12.6. Deprecated features


and this patch converts it into:

I. Getting started
    1. About Buildroot
    2. System requirements
        2.1. Mandatory packages
        2.2. Optional packages
    3. Getting Buildroot
    4. Using Buildroot
II. User guide
    5. Details on Buildroot configuration
        5.1. Cross-compilation toolchain
        5.2. /dev management
        5.3. init system
    6. make tips
    7. Customization
        7.1. Customizing the generated target filesystem
        7.2. Customizing the BusyBox configuration
        7.3. Customizing the uClibc configuration
        7.4. Customizing the Linux kernel configuration
        7.5. Customizing the toolchain
    8. Storing the configuration
        8.1. Basics for storing the configuration
        8.2. Creating your own board support
        8.3. Step-by-step instructions for storing configuration
        8.4. Customizing packages
        8.5. Keeping customizations outside Buildroot
    9. Daily use
        9.1. Understanding when a full rebuild is necessary
        9.2. Understanding how to rebuild packages
        9.3. Offline builds
        9.4. Building out-of-tree
        9.5. Environment variables
        9.6. Dealing efficiently with filesystem images
        9.7. Graphing the dependencies between packages
        9.8. Graphing the build duration
    10. Integration with Eclipse
    11. Hacking Buildroot
    12. Frequently Asked Questions & Troubleshooting
        12.1. The boot hangs after Starting network?
        12.2. Why is there no compiler on the target?
        12.3. Why are there no development files on the target?
        12.4. Why is there no documentation on the target?
        12.5. Why are some packages not visible in the Buildroot config
              menu?
        12.6. Why not use the target directory as a chroot directory?
        12.7. Why doesn?t Buildroot generate binary packages (.deb, .ipkg?)?
    13. Known issues
    14. Going further in Buildroot?s innards
        14.1. How Buildroot works
        14.2. Advanced usage
    15. Legal notice and licensing
        15.1. Complying with open source licenses
        15.2. License abbreviations
        15.3. Complying with the Buildroot license
    16. Beyond Buildroot
        16.1. Boot the generated images
        16.2. Chroot
III. Developer guide
    17. Coding style
        17.1. Config.in file
        17.2. The .mk file
        17.3. The documentation
    18. Adding new packages to Buildroot
        18.1. Package directory
        18.2. Config.in file
        18.3. The .mk file
        18.4. The .hash file
        18.5. Infrastructure for packages with specific build systems
        18.6. Infrastructure for autotools-based packages
        18.7. Infrastructure for CMake-based packages
        18.8. Infrastructure for Python packages
        18.9. Infrastructure for LuaRocks-based packages
        18.10. Infrastructure for Perl/CPAN packages
        18.11. Infrastructure for virtual packages
        18.12. Infrastructure for packages using kconfig for configuration
               files
        18.13. Hooks available in the various build steps
        18.14. Gettext integration and interaction with packages
        18.15. Tips and tricks
        18.16. Conclusion
    19. Patching a package
        19.1. Providing patches
        19.2. How patches are applied
        19.3. Format and licensing of the package patches
        19.4. Integrating patches found on the Web
    20. Download infrastructure
    21. Debugging Buildroot
    22. Getting involved
        22.1. Mailing List
        22.2. IRC
        22.3. Patchwork
        22.4. Bugtracker
        22.5. Buildroot wikipage
        22.6. Events
    23. Contributing to Buildroot
        23.1. Reproducing, analyzing and fixing bugs
        23.2. Analyzing and fixing autobuild failures
        23.3. Reviewing and testing patches
        23.4. Work on items from the TODO list
        23.5. Submitting patches
        23.6. Reporting issues/bugs or getting help
IV. Appendix
    24. Makedev syntax documentation
    25. Makeuser syntax documentation
    26. List of target packages available in Buildroot
    27. List of virtual packages
    28. List of host utilities available in Buildroot
    29. Deprecated features

diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/advanced.txt
--- a/docs/manual/advanced.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/advanced.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== Advanced usage
+=== Advanced usage
 
 include::using-buildroot-toolchain.txt[]
 
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/appendix.txt
--- a/docs/manual/appendix.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/appendix.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,8 +1,6 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Appendix
-
 include::makedev-syntax.txt[]
 include::makeusers-syntax.txt[]
 
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/beyond-buildroot.txt
--- a/docs/manual/beyond-buildroot.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/beyond-buildroot.txt	Wed Aug 06 19:48:39 2014 +0200
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
@@ -21,7 +21,7 @@
 
 Then, you can execute a NFS-boot from your target.
 
-== Chroot
+=== Chroot
 
 If you want to chroot in a generated image, then there are few thing
 you should be aware of:
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/ccache-support.txt
--- a/docs/manual/ccache-support.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/ccache-support.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -2,7 +2,7 @@
 // vim: set syntax=asciidoc:
 
 [[ccache]]
-=== Using +ccache+ in Buildroot
+==== Using +ccache+ in Buildroot
 
 http://ccache.samba.org[ccache] is a compiler cache. It stores the
 object files resulting from each compilation process, and is able to
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/contribute.txt
--- a/docs/manual/contribute.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/contribute.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Contributing to Buildroot
+== Contributing to Buildroot
 
 There are many ways in which you can contribute to Buildroot: analyzing
 and fixing bugs, analyzing and fixing package build failures detected by
@@ -22,7 +22,7 @@
 send your patches to the mailing list. Refer to xref:getting-buildroot[]
 for more information on obtaining a Buildroot git tree.
 
-== Reproducing, analyzing and fixing bugs
+=== Reproducing, analyzing and fixing bugs
 
 A first way of contributing is to have a look at the open bug reports in
 the https://bugs.busybox.net/buglist.cgi?product=buildroot[Buildroot bug
@@ -31,7 +31,7 @@
 welcome. Don't hesitate to add a comment to bug reports reporting your
 findings, even if you don't yet see the full picture.
 
-== Analyzing and fixing autobuild failures
+=== Analyzing and fixing autobuild failures
 
 The Buildroot autobuilders are a set of build machines that continuously
 run Buildroot builds based on random configurations. This is done for
@@ -76,7 +76,7 @@
 Fixes http://autobuild.buildroot.org/results/51000a9d4656afe9e0ea6f07b9f8ed374c2e4069
 ---------------------
 
-== Reviewing and testing patches
+=== Reviewing and testing patches
 
 With the amount of patches sent to the mailing list each day, the
 maintainer has a very hard job to judge which patches are ready to apply
@@ -142,7 +142,7 @@
 purposes. Please see xref:apply-patches-patchwork[] for more
 information on using Buildroot's Patchwork website to apply patches.
 
-== Work on items from the TODO list
+=== Work on items from the TODO list
 
 If you want to contribute to Buildroot but don't know where to start,
 and you don't like any of the above topics, you can always work on items
@@ -152,7 +152,7 @@
 avoid duplicate efforts.
 
 [[submitting-patches]]
-== Submitting patches
+=== Submitting patches
 
 [NOTE]
 _Please, do not attach patches to bugs, send them to the mailing list
@@ -196,7 +196,7 @@
 line-wrapped*, otherwise they cannot easily be applied. In such a case,
 fix your e-mail client, or better yet, learn to use +git send-email+.
 
-=== Cover letter
+==== Cover letter
 
 If you want to present the whole patch set in a separate mail, add
 +--cover-letter+ to the +git format-patch+ command (see +man
@@ -215,7 +215,7 @@
 * whenever you feel it will help presenting your work, your choices,
   the review process, etc.
 
-=== Patch revision changelog
+==== Patch revision changelog
 
 When improvements are requested, the new revision of each commit
 should include a changelog of the modifications between each
@@ -276,7 +276,7 @@
 ---------------------
 
 [[reporting-bugs]]
-== Reporting issues/bugs or getting help
+=== Reporting issues/bugs or getting help
 
 Before reporting any issue, please check
 xref:mailing-list-subscribe[the mailing list archive] in case someone has
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/developer-guide.txt
--- a/docs/manual/developer-guide.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/developer-guide.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,8 +1,6 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Developer Guidelines
-
 include::writing-rules.txt[]
 
 include::adding-packages.txt[]
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/download-location.txt
--- a/docs/manual/download-location.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/download-location.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== Location of downloaded packages
+==== Location of downloaded packages
 
 The various tarballs that are downloaded by Buildroot are all stored
 in +BR2_DL_DIR+, which by default is the +dl+ directory. If you want
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/faq-troubleshooting.txt
--- a/docs/manual/faq-troubleshooting.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/faq-troubleshooting.txt	Wed Aug 06 19:48:39 2014 +0200
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
@@ -26,7 +26,7 @@
 generated system so that a shell starts on the correct serial port.
 
 [[faq-no-compiler-on-target]]
-== Why is there no compiler on the target?
+=== Why is there no compiler on the target?
 
 It has been decided that support for the _native compiler on the
 target_ would be stopped from the Buildroot-2012.11 release because:
@@ -50,7 +50,7 @@
 * ...
 
 [[faq-no-dev-files-on-target]]
-== Why are there no development files on the target?
+=== Why are there no development files on the target?
 
 Since there is no compiler available on the target (see
 xref:faq-no-compiler-on-target[]), it does not make sense to waste
@@ -60,7 +60,7 @@
 Buildroot-2012.11 release.
 
 [[faq-no-doc-on-target]]
-== Why is there no documentation on the target?
+=== Why is there no documentation on the target?
 
 Because Buildroot mostly targets _small_ or _very small_ target
 hardware with limited resource onboard (CPU, ram, mass-storage), it
@@ -71,7 +71,7 @@
 distribution_ (see: xref:faq-no-compiler-on-target[]).
 
 [[faq-why-not-visible-package]]
-== Why are some packages not visible in the Buildroot config menu?
+=== Why are some packages not visible in the Buildroot config menu?
 
 If a package exists in the Buildroot tree and does not appear in the
 config menu, this most likely means that some of the package's
@@ -89,7 +89,7 @@
 more explanations).
 
 [[faq-why-not-use-target-as-chroot]]
-== Why not use the target directory as a chroot directory?
+=== Why not use the target directory as a chroot directory?
 
 There are plenty of reasons to *not* use the target directory a chroot
 one, among these:
@@ -106,7 +106,7 @@
 as root.
 
 [[faq-no-binary-packages]]
-== Why doesn't Buildroot generate binary packages (.deb, .ipkg...)?
+=== Why doesn't Buildroot generate binary packages (.deb, .ipkg...)?
 
 One feature that is often discussed on the Buildroot list is the
 general topic of "package management". To summarize, the idea
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/get-involved.txt
--- a/docs/manual/get-involved.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/get-involved.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Getting involved
+== Getting involved
 
 Like any open source project, Buildroot has different ways to share
 information in its community and outside.
@@ -11,7 +11,7 @@
 Each of those ways may interest you if you are looking for some help,
 want to understand Buildroot or contribute to the project.
 
-== Mailing List
+=== Mailing List
 
 Buildroot has a mailing list
 http://lists.busybox.net/pipermail/buildroot[] for discussion and
@@ -19,7 +19,7 @@
 
 [[mailing-list-subscribe]]
 
-=== Subscribing to the mailing list
+==== Subscribing to the mailing list
 
 You can subscribe by visiting
 http://lists.busybox.net/mailman/listinfo/buildroot[].
@@ -30,14 +30,14 @@
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
@@ -47,7 +47,7 @@
 using a code sharing website.
 
 [[patchwork]]
-== Patchwork
+=== Patchwork
 
 Patchwork is a web-based patch tracking system designed to facilitate
 the contribution and management of contributions to an open-source
@@ -66,7 +66,7 @@
 http://patchwork.buildroot.org[].
 
 [[apply-patches-patchwork]]
-=== Applying Patches from Patchwork
+==== Applying Patches from Patchwork
 
 The main use of Buildroot's Patchwork website for a developer is for
 pulling in patches into their local git repository for testing
@@ -88,13 +88,13 @@
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
@@ -105,17 +105,17 @@
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
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/going-further.txt
--- a/docs/manual/going-further.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/going-further.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Going further in Buildroot's innards
+== Going further in Buildroot's innards
 
 include::how-buildroot-works.txt[]
 
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/how-buildroot-works.txt
--- a/docs/manual/how-buildroot-works.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/how-buildroot-works.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-== How Buildroot works
+=== How Buildroot works
 
 As mentioned above, Buildroot is basically a set of Makefiles that
 download, configure, and compile software with the correct options. It
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/introduction.txt
--- a/docs/manual/introduction.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/introduction.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= About Buildroot
+== About Buildroot
 
 Buildroot is a tool that simplifies and automates the process of
 building a complete Linux system for an embedded system, using
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/known-issues.txt
--- a/docs/manual/known-issues.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/known-issues.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Known issues
+== Known issues
 
 * It is not possible to pass extra linker options via +BR2_TARGET_LDFLAGS+
   if such options contain a +$+ sign. For example, the following is known
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/legal-notice.txt
--- a/docs/manual/legal-notice.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/legal-notice.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -3,9 +3,9 @@
 
 [[legal-info]]
 
-= Legal notice and licensing
+== Legal notice and licensing
 
-== Complying with open source licenses
+=== Complying with open source licenses
 
 All of the end products of Buildroot (toolchain, root filesystem, kernel,
 bootloaders) contain open source software, released under various licenses.
@@ -69,7 +69,7 @@
 file to inform you of relevant material that could not be saved.
 
 [[legal-info-list-licenses]]
-== License abbreviations
+=== License abbreviations
 
 Here is a list of the licenses that are most widely used by packages in
 Buildroot, with the name used in the manifest files:
@@ -123,7 +123,7 @@
   http://apache.org/licenses/LICENSE-2.0.html[
   Apache License, version 2.0];
 
-== Complying with the Buildroot license
+=== Complying with the Buildroot license
 
 Buildroot itself is an open source software, released under the
 http://www.gnu.org/licenses/old-licenses/gpl-2.0.html[GNU General Public
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/manual.mk
--- a/docs/manual/manual.mk	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/manual.mk	Wed Aug 06 19:48:39 2014 +0200
@@ -78,8 +78,8 @@
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 ################################################################################
 define GENDOC
-$(call GENDOC_INNER,$(1),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
-$(call GENDOC_INNER,$(1),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 2")
+$(call GENDOC_INNER,$(1),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 1")
+$(call GENDOC_INNER,$(1),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 1")
 $(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
 $(call GENDOC_INNER,$(1),text,text,text,text)
 $(call GENDOC_INNER,$(1),epub,epub,epub,ePUB)
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/manual.txt
--- a/docs/manual/manual.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/manual.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -16,12 +16,14 @@
 
 image::logo.png[]
 
-:leveloffset: 1
+= Getting started
 
 include::introduction.txt[]
 
 include::starting-up.txt[]
 
+= User guide
+
 include::working-with.txt[]
 
 include::faq-troubleshooting.txt[]
@@ -30,14 +32,18 @@
 
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
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/package-make-target.txt
--- a/docs/manual/package-make-target.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/package-make-target.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -3,7 +3,7 @@
 
 [[pkg-build-steps]]
 
-=== Package-specific _make_ targets
+==== Package-specific _make_ targets
 
 Running +make <package>+ builds and installs that particular package
 and its dependencies.
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/starting-up.txt
--- a/docs/manual/starting-up.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/starting-up.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,8 +1,6 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Starting up
-
 include::prerequisite.txt[]
 
 include::getting.txt[]
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/using-buildroot-debugger.txt
--- a/docs/manual/using-buildroot-debugger.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/using-buildroot-debugger.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== Using +gdb+ in Buildroot
+==== Using +gdb+ in Buildroot
 
 Buildroot allows to do cross-debugging, where the debugger runs on the
 build machine and communicates with +gdbserver+ on the target to
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/using-buildroot-development.txt
--- a/docs/manual/using-buildroot-development.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/using-buildroot-development.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== Using Buildroot during development
+==== Using Buildroot during development
 
 The normal operation of Buildroot is to download a tarball, extract
 it, configure, compile and install the software component found inside
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/using-buildroot-toolchain.txt
--- a/docs/manual/using-buildroot-toolchain.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/using-buildroot-toolchain.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,7 +1,7 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-=== Using the generated toolchain outside Buildroot
+==== Using the generated toolchain outside Buildroot
 
 You may want to compile, for your target, your own programs or other
 software that are not packaged in Buildroot. In order to do this you
diff -r df91fcff2e1a -r 3dea9add9b6c docs/manual/working-with.txt
--- a/docs/manual/working-with.txt	Wed Apr 30 16:21:53 2014 +0200
+++ b/docs/manual/working-with.txt	Wed Aug 06 19:48:39 2014 +0200
@@ -1,8 +1,6 @@
 // -*- mode:doc; -*-
 // vim: set syntax=asciidoc:
 
-= Working with Buildroot
-
 This section explains how you can customize Buildroot to fit your
 needs.
 
