From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:41:12 +0200
Subject: [Buildroot] [git commit] manual/user guide/customization: add
	section on users tables
Message-ID: <20140921174201.5F23B9D488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5598d7f80aee23fe79875a1a048f06c3ec614c26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds basic documentation on users tables, a topic which was
currently not yet covered in the manual.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/customize-users-tables.txt |   18 ++++++++++++++++++
 docs/manual/customize.txt              |    3 +++
 docs/manual/makeusers-syntax.txt       |    2 +-
 3 files changed, 22 insertions(+), 1 deletions(-)

diff --git a/docs/manual/customize-users-tables.txt b/docs/manual/customize-users-tables.txt
new file mode 100644
index 0000000..e2d32e2
--- /dev/null
+++ b/docs/manual/customize-users-tables.txt
@@ -0,0 +1,18 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[customize-users]]
+=== Adding custom user accounts
+
+Sometimes it is needed to add specific users in the target system.
+To cover this requirement, Buildroot provides support for so-called
+_users tables_. To use this feature, set config option
++BR2_ROOTFS_USERS_TABLES+ to a space-separated list of users tables,
+regular text files following the xref:makeuser-syntax[makeusers syntax].
+
+As shown in xref:customize-dir-structure[], the recommended location for
+such files is +board/<company>/<boardname>/+.
+
+It should be noted that if the custom users are related to a specific
+application, you should set variable +FOO_USERS+ in the package's +.mk+
+file instead (see xref:generic-package-reference[]).
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index ad335b9..0a73988 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -20,6 +20,7 @@ Typical actions you may need to perform for a given project are:
      +BR2_ROOTFS_DEVICE_TABLE+)
   ** adding custom devices nodes (using
      +BR2_ROOTFS_STATIC_DEVICE_TABLE+)
+* adding custom user accounts (using +BR2_ROOTFS_USERS_TABLES+)
 * running arbitrary commands after generating the filesystem image
   (using +BR2_ROOTFS_POST_IMAGE_SCRIPT+)
 * adding project-specific patches to some packages (using
@@ -48,6 +49,8 @@ include::customize-configuration.txt[]
 
 include::customize-rootfs.txt[]
 
+include::customize-users-tables.txt[]
+
 include::customize-post-image.txt[]
 
 include::customize-packages.txt[]
diff --git a/docs/manual/makeusers-syntax.txt b/docs/manual/makeusers-syntax.txt
index 9c61604..5b3f347 100644
--- a/docs/manual/makeusers-syntax.txt
+++ b/docs/manual/makeusers-syntax.txt
@@ -1,7 +1,7 @@
 // -*- mode:doc -*- ;
 
 [[makeuser-syntax]]
-== Makeuser syntax documentation
+== Makeusers syntax documentation
 
 The syntax to create users is inspired by the makedev syntax, above, but
 is specific to Buildroot.
