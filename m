From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 01:14:53 +0200
Subject: [Buildroot] [PATCH 13/13] Document BR2_PROJECT_DIR in the manual
In-Reply-To: <20121013231344.17317.92930.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
Message-ID: <20121013231453.17317.66287.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/customize-project.txt |   37 +++++++++++++++++++++++++++++++++++++
 docs/manual/customize.txt         |    2 ++
 2 files changed, 39 insertions(+)
 create mode 100644 docs/manual/customize-project.txt

diff --git a/docs/manual/customize-project.txt b/docs/manual/customize-project.txt
new file mode 100644
index 0000000..db6b757
--- /dev/null
+++ b/docs/manual/customize-project.txt
@@ -0,0 +1,37 @@
+Storing the configuration in a project directory
+------------------------------------------------
+[[project-dir]]
+
+When you use buildroot in different projects, it's a good idea to keep
+each project separate from buildroot itself.  Buildroot makes this
+possible with the +BR2_PROJECT_DIR+ option.  The project directory
+contains all the configuration files and the filesystem overlay for
+your project.
+
+After configuring buildroot, the linux kernel, etc., run the following
+command.
+
+--------------------
+make PROJECT_DIR=/path/to/project/dir projectdir
+--------------------
+
+This will create the directory +/path/to/project/dir+, which contains
+the buildroot configuration, and all other configuration files required
+to rebuild your system.
+
+To further customize your project, you can:
+
+* add a directory called +rootfs-overlay+ and fill it with additional
+  files and directories that should be installed in the root filesystem
+  (see xref:customize-rootfs[+BR2_ROOTFS_OVERLAY+]);
+
+* add a script called +post-build.sh+ to modify the root filesystem
+  (see xref:customize-rootfs[+BR2_ROOTFS_POST_BUILD_SCRIPT+]);
+
+* add a makefile +project.mk+ with additional buildroot targets.
+
+In addition, the project directory contains a Makefile to allow you to
+build directly from there.  This Makefile downloads and extracts
+buildroot, then builds everything according to your configuration. To
+avoid downloading buildroot, create a symbolic link to the buildroot
+directory in the project directory.
diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
index e8235de..86fc1fb 100644
--- a/docs/manual/customize.txt
+++ b/docs/manual/customize.txt
@@ -10,3 +10,5 @@ include::customize-uclibc-config.txt[]
 include::customize-kernel-config.txt[]
 
 include::customize-toolchain.txt[]
+
+include::customize-project.txt[]
