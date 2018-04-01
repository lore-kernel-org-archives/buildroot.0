From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 00:42:59 +0200
Subject: [Buildroot] [git commit] docs/manual: add check-package to "Tips
 and tricks"
Message-ID: <20180401224309.A8727837CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01e9dd2995891934bf06d49caeb876d3bba11731
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And add two references to it: in "Submitting patches" and in "Adding new
packages to Buildroot" sections.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-tips.txt | 32 ++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt      |  5 +++--
 docs/manual/contribute.txt           |  4 ++++
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index f37f9874e7..d10f276e83 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -32,6 +32,38 @@ using the following rules:
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
+This script can be used for packages, filesystem makefiles, Config.in
+files, etc. It does not check the files defining the package
+infrastructures and some other files containing similar common code.
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
