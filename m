From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 7 Jan 2013 21:46:16 +0100
Subject: [Buildroot] [git commit] elfutils: towards uClibc support: disable
	po build
Message-ID: <20130107212533.629A19A27C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8515bb08f33d690c9992fa30ff18b84a566918e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building the po/ directory complains that the scripts in there have
been generated with gettext 0.17, while we use gettext 0.18 in
Buildroot. Since we don't care that much about po files anyway, just
disable the build of this directory.

Heavily based from work done by Stefan Fr??berg, but with many further
modifications by Thomas Petazzoni.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/elfutils/elfutils-05-disable-po.patch |   22 ++++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/elfutils/elfutils-05-disable-po.patch b/package/elfutils/elfutils-05-disable-po.patch
new file mode 100644
index 0000000..d98da0b
--- /dev/null
+++ b/package/elfutils/elfutils-05-disable-po.patch
@@ -0,0 +1,22 @@
+Disable the build of the po/ directory
+
+Building the po/ directory complains that the scripts in there have
+been generated with gettext 0.17, while we use gettext 0.18 in
+Buildroot. Since we don't care that much about po files anyway, just
+disable the build of this directory.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/Makefile.am
+===================================================================
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -28,7 +28,7 @@
+ 
+ # Add doc back when we have some real content.
+ SUBDIRS = config m4 lib libelf libebl libdwfl libdw libcpu libasm backends \
+-	  $(PROGS_SUBDIR) po tests
++	  $(PROGS_SUBDIR) tests
+ 
+ EXTRA_DIST = elfutils.spec GPG-KEY NOTES CONTRIBUTING \
+ 	     COPYING COPYING-GPLV2 COPYING-LGPLV3
