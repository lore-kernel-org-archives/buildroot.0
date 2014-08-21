From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:39:33 +0200
Subject: [Buildroot] [git commit] manual: file organization: avoid
	unnecessary indirection
Message-ID: <20140821134003.139639D4E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a14ce4d57c8234139ed24842a4dda3a98bbac346
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some source files of the manual merely contain inclusion of other files.
Especially at top-level this is unnecessary, and one could just as well add
these includes in manual.txt.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/developer-guide.txt |   12 ------------
 docs/manual/manual.txt          |   24 +++++++++++++++++++++---
 docs/manual/starting-up.txt     |    9 ---------
 docs/manual/working-with.txt    |   13 -------------
 4 files changed, 21 insertions(+), 37 deletions(-)

diff --git a/docs/manual/developer-guide.txt b/docs/manual/developer-guide.txt
deleted file mode 100644
index cba05b3..0000000
--- a/docs/manual/developer-guide.txt
+++ /dev/null
@@ -1,12 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-include::writing-rules.txt[]
-
-include::adding-packages.txt[]
-
-include::patch-policy.txt[]
-
-include::download-infra.txt[]
-
-include::debugging-buildroot.txt[]
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index 3c2111f..592bece 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -20,13 +20,23 @@ image::logo.png[]
 
 include::introduction.txt[]
 
-include::starting-up.txt[]
+include::prerequisite.txt[]
+
+include::getting.txt[]
+
+include::using.txt[]
 
 include::get-involved.txt[]
 
 = User guide
 
-include::working-with.txt[]
+include::configure.txt[]
+
+include::configure-other-components.txt[]
+
+include::common-usage.txt[]
+
+include::customize.txt[]
 
 include::faq-troubleshooting.txt[]
 
@@ -40,7 +50,15 @@ include::beyond-buildroot.txt[]
 
 include::how-buildroot-works.txt[]
 
-include::developer-guide.txt[]
+include::writing-rules.txt[]
+
+include::adding-packages.txt[]
+
+include::patch-policy.txt[]
+
+include::download-infra.txt[]
+
+include::debugging-buildroot.txt[]
 
 include::contribute.txt[]
 
diff --git a/docs/manual/starting-up.txt b/docs/manual/starting-up.txt
deleted file mode 100644
index aab1c85..0000000
--- a/docs/manual/starting-up.txt
+++ /dev/null
@@ -1,9 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-include::prerequisite.txt[]
-
-include::getting.txt[]
-
-include::using.txt[]
-
diff --git a/docs/manual/working-with.txt b/docs/manual/working-with.txt
deleted file mode 100644
index 0ddbc7f..0000000
--- a/docs/manual/working-with.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-// -*- mode:doc; -*-
-// vim: set syntax=asciidoc:
-
-This section explains how you can customize Buildroot to fit your
-needs.
-
-include::configure.txt[]
-
-include::configure-other-components.txt[]
-
-include::common-usage.txt[]
-
-include::customize.txt[]
