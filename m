From: Doug Kehn <rdkehn@yahoo.com>
Date: Wed, 26 Nov 2014 22:48:47 -0600
Subject: [Buildroot] [PATCH v2 2/2] manual: reinstall targets
In-Reply-To: <1417063727-4420-1-git-send-email-rdkehn@yahoo.com>
References: <1417063727-4420-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <1417063727-4420-3-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add reinstall target information to package-make-target.txt.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 docs/manual/package-make-target.txt | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/docs/manual/package-make-target.txt b/docs/manual/package-make-target.txt
index 25d3f44..35d787e 100644
--- a/docs/manual/package-make-target.txt
+++ b/docs/manual/package-make-target.txt
@@ -57,24 +57,38 @@ Additionally, there are some other useful make targets:
 
 [width="90%",cols="^1,4",options="header"]
 |===================================================
-| command/target    | Description
+| command/target      | Description
 
-| +show-depends+    | Displays the dependencies required to build the
+| +show-depends+      | Displays the dependencies required to build the
 package
 
-| +graph-depends+   | Generate a dependency graph of the package, in the
+| +graph-depends+     | Generate a dependency graph of the package, in the
 context of the current Buildroot configuration. See
 xref:graph-depends[this section] for more details about dependency
 graphs.
 
-| +dirclean+        | Remove the whole package build directory
+| +dirclean+          | Remove the whole package build directory
 
-| +rebuild+         | Re-run the compilation commands - this only makes
+| +rebuild+           | Re-run the compilation commands - this only makes
 sense when using the +OVERRIDE_SRCDIR+ feature or when you modified a file
 directly in the build directory
 
-| +reconfigure+     | Re-run the configure commands, then rebuild - this only
+| +reconfigure+       | Re-run the configure commands, then rebuild - this only
 makes sense when using the +OVERRIDE_SRCDIR+ feature or when you modified a
 file directly in the build directory
 
+| +reinstall-staging+ |
+*target package:* Re-run the installation of the package in the staging
+directory - this only makes sense when overriding +STAGING_DIR+
+
+| +reinstall-target+  |
+*target package:* Re-run the installation of the package in the target
+directory - this only makes sense when overriding +TARGET_DIR+
+
+| +reinstall+         |
+*target package:* Run the 2 previous re-installation commands
+
+*host package:* Re-run the installation of the package in the host
+directory
+
 |===================================================
-- 
1.9.1
