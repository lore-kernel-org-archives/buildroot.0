From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 16:15:36 +0200
Subject: [Buildroot] [git commit] docs/manual: size of tab in package
	description
Message-ID: <20170408141752.960B47FBBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad35a3a43d62f1588d3cd3c1e51d8626d39f0b54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Explicitly state that one tab counts for 8 columns in package
description, leaving 62 characters to the text itself.
Update the text and the example in the two places where the Config.in
format is described.
Also mention a newline is expected between the help text itself and the
upstream URL.

This blob can help developers to understand the expected formatting.
Also, it can be referenced by reviewers.

http://patchwork.ozlabs.org/patch/611289/
http://patchwork.ozlabs.org/patch/606866/
http://patchwork.ozlabs.org/patch/459960/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt | 8 +++++---
 docs/manual/writing-rules.txt             | 6 ++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 5dba962..08f5d42 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -28,7 +28,8 @@ contain:
 config BR2_PACKAGE_LIBFOO
 	bool "libfoo"
 	help
-	  This is a comment that explains what libfoo is.
+	  This is a comment that explains what libfoo is. The help text
+	  should be wrapped.
 
 	  http://foosoftware.org/libfoo/
 ---------------------------
@@ -36,8 +37,9 @@ config BR2_PACKAGE_LIBFOO
 The +bool+ line, +help+ line and other metadata information about the
 configuration option must be indented with one tab. The help text
 itself should be indented with one tab and two spaces, lines should
-not be longer than 72 columns, and it must mention the upstream URL
-of the project.
+be wrapped to fit 72 columns, where tab counts for 8, so 62 characters
+in the text itself. The help text must mention the upstream URL of the
+project after an empty line.
 
 As a convention specific to Buildroot, the ordering of the attributes
 is as follows:
diff --git a/docs/manual/writing-rules.txt b/docs/manual/writing-rules.txt
index ec1ddb1..e2ad41e 100644
--- a/docs/manual/writing-rules.txt
+++ b/docs/manual/writing-rules.txt
@@ -29,7 +29,8 @@ config BR2_PACKAGE_LIBFOO
 	depends on BR2_PACKAGE_LIBBAZ
 	select BR2_PACKAGE_LIBBAR
 	help
-	  This is a comment that explains what libfoo is.
+	  This is a comment that explains what libfoo is. The help text
+	  should be wrapped.
 
 	  http://foosoftware.org/libfoo/
 ---------------------
@@ -40,7 +41,8 @@ config BR2_PACKAGE_LIBFOO
 * The help text itself should be indented with one tab and two
   spaces.
 
-* The help text should be wrapped to fit 72 columns.
+* The help text should be wrapped to fit 72 columns, where tab counts
+  for 8, so 62 characters in the text itself.
 
 The +Config.in+ files are the input for the configuration tool
 used in Buildroot, which is the regular _Kconfig_. For further
