From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sat, 31 Dec 2016 01:21:08 -0200
Subject: [Buildroot] [PATCH 7/9] docs/manual: size of tab in package
	description
In-Reply-To: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
References: <20161231032110.11573-1-ricardo.martincoski@gmail.com>
Message-ID: <20161231032110.11573-8-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Explicitly state that one tab counts for 8 columns in package
description, leaving 62 characters to the text itself.
Update the text and the example in the two places where the Config.in
format is described.
Also mention a newline is expected between the help text itself and the
upstream URL.

This blob can help newcomers to understand the expected formatting.
Also, it can be referenced by reviewers.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt | 8 +++++---
 docs/manual/writing-rules.txt             | 6 ++++--
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 5dba962bd..08f5d42f9 100644
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
index ec1ddb191..e2ad41ebc 100644
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
-- 
2.11.0
