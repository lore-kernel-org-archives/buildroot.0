From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  6 Jan 2013 16:22:54 +0100
Subject: [Buildroot] [PATCH 14/15] elfutils: towards uClibc support: disable
	po build
In-Reply-To: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
References: <cover.1357485747.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2d302462f56af537d3e358dd73eb8529eaaf6c07.1357485747.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building the po/ directory complains that the scripts in there have
been generated with gettext 0.17, while we use gettext 0.18 in
Buildroot. Since we don't care that much about po files anyway, just
disable the build of this directory.

Heavily based from work done by Stefan Fr?berg, but with many further
modifications by Thomas Petazzoni.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elfutils/elfutils-05-disable-po.patch |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/elfutils/elfutils-05-disable-po.patch

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
-- 
1.7.9.5
