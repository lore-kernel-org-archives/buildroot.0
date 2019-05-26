From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 11:21:05 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] docs/manual: clarify
 location of local.mk
Message-ID: <20190526091608.1575880F7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56f2a9d937c694f4da764bbfaff85551fa4ebe96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

In particular, the manual was incorrect when the user had selected an
out-of-tree build.

Signed-off-by: Charlie Turner <cturner@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 59c3a4ff73e5a8d4cfcb95bbd0ac07a68628e954)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
