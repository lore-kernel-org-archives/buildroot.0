From: Charlie Turner <cturner@igalia.com>
Date: Mon, 13 May 2019 11:37:42 +0100
Subject: [Buildroot] [PATCH 1/1] docs/manual: Clarify location of local.mk
Message-ID: <20190513103742.24692-1-cturner@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In particular, the manual was incorrect when the user had selected an
out-of-tree build.

Signed-off-by: Charlie Turner <cturner@igalia.com>
---
 docs/manual/using-buildroot-development.txt | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/docs/manual/using-buildroot-development.txt b/docs/manual/using-buildroot-development.txt
index 3389a37b39..65a9f1a3f7 100644
--- a/docs/manual/using-buildroot-development.txt
+++ b/docs/manual/using-buildroot-development.txt
@@ -28,10 +28,22 @@ clean+.
 Therefore, Buildroot provides a specific mechanism for this use case:
 the +<pkg>_OVERRIDE_SRCDIR+ mechanism. Buildroot reads an _override_
 file, which allows the user to tell Buildroot the location of the
-source for certain packages. By default this _override_ file is named
-+local.mk+ and located in the top directory of the Buildroot source
-tree, but a different location can be specified through the
-+BR2_PACKAGE_OVERRIDE_FILE+ configuration option.
+source for certain packages.
+
+The default location of the override file is +$(CONFIG_DIR)/local.mk+,
+as defined by the +BR2_PACKAGE_OVERRIDE_FILE+ configuration option.
++$(CONFIG_DIR)+ is the location of the Buildroot +.config+ file, so
++local.mk+ by default lives side-by-side with the +.config+ file,
+which means:
+
+* In the top-level Buildroot source directory for in-tree builds
+  (i.e., when +O=+ is not used)
+* In the out-of-tree directory for out-of-tree builds (i.e., when
+  +O=+ is used)
+
+If a different location than these defaults is required, it can be
+specified through the +BR2_PACKAGE_OVERRIDE_FILE+ configuration
+option.
 
 In this _override_ file, Buildroot expects to find lines of the form:
 
-- 
2.17.1
