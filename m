From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  1 Apr 2018 19:31:56 -0300
Subject: [Buildroot] [PATCH v3 1/1] docs/manual: add check-package to "Tips
 and tricks"
In-Reply-To: <20180401050850.5701-19-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-19-ricardo.martincoski@gmail.com>
Message-ID: <20180401223156.18457-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And add two references to it: in "Submitting patches" and in "Adding new
packages to Buildroot" sections.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v2 -> v3:  (after review from Thomas Petazzoni)
  - br2-external is not only for proprietary packages;
  - correctly express 'files defining the package infrastructures'
    (Thomas provided a better phrase, thanks);
  - join test-pkg and check-package paragraphs in 'Adding new packages
    to Buildroot'.

v2: http://patchwork.ozlabs.org/patch/893924/

Changes v1 -> v2:
  - no changes
---
 docs/manual/adding-packages-tips.txt | 33 +++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt      |  5 +++--
 docs/manual/contribute.txt           |  4 ++++
 3 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index f37f9874e7..99c656bef5 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -32,6 +32,39 @@ using the following rules:
   with `.` and `-` characters substituted with `_` (e.g.:
   +FOO_BAR_BOO_VERSION+).
 
+[[check-package]]
+==== How to check the coding style
+
+Buildroot provides a script in +utils/check-package+ that checks new or
+changed files for coding style. It is not a complete language validator,
+but it catches many common mistakes. It is meant to run in the actual
+files you created or modified, before creating the patch for submission.
+
+This script can be used for packages and also for package-like files:
+boot, fs, toolchain, ... It does not check the files defining the
+package infrastructures and some other files containing similar common
+code.
+
+To use it, run the +check-package+ script, by telling which files you
+created or changed:
+
+----
+$ ./utils/check-package package/new-package/*
+----
+
+If you have the +utils+ directory in your path you can also run:
+
+----
+$ cd package/new-package/
+$ check-package *
+----
+
+The tool can also be used for packages in a br2-external:
+
+----
+$ check-package -b /path/to/br2-ext-tree/package/my-package/*
+----
+
 [[testing-package]]
 ==== How to test your package
 
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index c642146287..4a4a17e879 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -9,8 +9,9 @@ applications) can be integrated into Buildroot. It also shows how
 existing packages are integrated, which is needed for fixing issues or
 tuning their configuration.
 
-When you add a new package, be sure to test it in various conditions;
-see xref:testing-package[]
+When you add a new package, be sure to test it in various conditions
+(see xref:testing-package[]) and also check it for coding style (see
+xref:check-package[]).
 
 include::adding-packages-directory.txt[]
 
diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 8bbc2b9eb7..b531ea987e 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -264,6 +264,10 @@ yourself to the DEVELOPERS file. This should be done in the same patch
 creating or modifying the package. See xref:DEVELOPERS[the DEVELOPERS file]
 for more information.
 
+Buildroot provides a handy tool to check for common coding style
+mistakes on files you created or modified, called +check-package+ (see
+xref:check-package[] for more information).
+
 ==== Preparing a patch series
 
 Starting from the changes committed in your local git view, _rebase_
-- 
2.14.1
