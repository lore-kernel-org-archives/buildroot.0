From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 21:16:26 +0100
Subject: [Buildroot] [git commit] docs/manual/quickstart: update output
 directory contents documentation
Message-ID: <20191118200903.415878F1DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=728d6800bb0af0fcbd66db701412b1ad0572a5dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update the documentation for the output/host/ directory to mention
that it contains the sysroot for the target toolchain, as well as the
host tools required for running buildroot.

Update the staging/ documentation to reflect that it is a link to the
target toolchain sysroot in the host/ directory.

Signed-off-by: Michael Drake <michael.drake@codethink.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/quickstart.txt | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/docs/manual/quickstart.txt b/docs/manual/quickstart.txt
index 74158ae249..542b278603 100644
--- a/docs/manual/quickstart.txt
+++ b/docs/manual/quickstart.txt
@@ -87,15 +87,21 @@ This directory contains several subdirectories:
   target). This directory contains one subdirectory for each of these
   components.
 
-* +staging/+ which contains a hierarchy similar to a root filesystem
-  hierarchy. This directory contains the headers and libraries of the
-  cross-compilation toolchain and all the userspace packages selected
-  for the target. However, this directory is 'not' intended to be
-  the root filesystem for the target: it contains a lot of development
-  files, unstripped binaries and libraries that make it far too big
-  for an embedded system. These development files are used to compile
-  libraries and applications for the target that depend on other
-  libraries.
+* +host/+ contains both the tools built for the host, and the sysroot
+  of the target toolchain. The former is an installation of tools
+  compiled for the host that are needed for the proper execution of
+  Buildroot, including the cross-compilation toolchain. The latter
+  is a hierarchy similar to a root filesystem hierarchy. It contains
+  the headers and libraries of all user-space packages that provide
+  and install libraries used by other packages. However, this
+  directory is 'not' intended to be the root filesystem for the target:
+  it contains a lot of development files, unstripped binaries and
+  libraries that make it far too big for an embedded system. These
+  development files are used to compile libraries and applications for
+  the target that depend on other libraries.
+
+* +staging/+ is a symlink to the target toolchain sysroot inside
+  +host/+, which exists for backwards compatibility.
 
 * +target/+ which contains 'almost' the complete root filesystem for
   the target: everything needed is present except the device files in
@@ -111,10 +117,6 @@ This directory contains several subdirectories:
   development files (headers, etc.) are not present, the binaries are
   stripped.
 
-* +host/+ contains the installation of tools compiled for the host
-  that are needed for the proper execution of Buildroot, including the
-  cross-compilation toolchain.
-
 These commands, +make menuconfig|nconfig|gconfig|xconfig+ and +make+, are the
 basic ones that allow to easily and quickly generate images fitting
 your needs, with all the features and applications you enabled.
