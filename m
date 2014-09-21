From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:41:12 +0200
Subject: [Buildroot] [git commit] manual/user guide/customization: refer to
	dir structure from rootfs section
Message-ID: <20140921174201.8A34A9D488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6527f8a31dbf830a0aa2eb0576b4870cf0b88c85
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This small patch adds references to the section on 'recommended directory
structure' from sections explaining the post-build script and rootfs
overlay.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-rootfs.txt |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/docs/manual/customize-rootfs.txt b/docs/manual/customize-rootfs.txt
index 23a38b0..558bd72 100644
--- a/docs/manual/customize-rootfs.txt
+++ b/docs/manual/customize-rootfs.txt
@@ -21,6 +21,9 @@ A filesystem overlay is a tree of files that is copied directly
   directories of version control systems, like +.git+, +.svn+, +.hg+,
   etc., files called +.empty+ and files ending in +~+ are excluded from
   the copy.
++
+As shown in xref:customize-dir-structure[], the recommended path for
+  this overlay is +board/<company>/<boardname>/rootfs-overlay+.
 
 Post-build scripts (+BR2_ROOTFS_POST_BUILD_SCRIPT+)::
 +
@@ -37,6 +40,9 @@ Using post-build scripts, you can remove or modify any file in your
   files, you should fix that package rather than work around it with some
   post-build cleanup scripts.
 +
+As shown in xref:customize-dir-structure[], the recommended path for
+  this script is +board/<company>/<boardname>/post_build.sh+.
++
 The post-build scripts are run with the main Buildroot tree as current
   working directory. The path to the target filesystem is passed as the
   first argument to each script. If the config option
