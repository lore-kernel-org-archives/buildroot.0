From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  1 Jul 2017 16:31:01 +0200
Subject: [Buildroot] [PATCH 1/7 v4] tools: move test-pkg out of
	support/scripts
In-Reply-To: <cover.1498919458.git.yann.morin.1998@free.fr>
References: <cover.1498919458.git.yann.morin.1998@free.fr>
Message-ID: <4553707d461f300d46e8410e2d2a61381e3f83b6.1498919458.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move it to the top-level tools/ directory, so that it is easier to
find for users.

Add a legacy symlink for those users who already used them, so as
not to break their habits.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v3 -> v4:
  - drop legacy symlink  (Arnout, Thomas)
---
 docs/manual/adding-packages-tips.txt | 12 ++++++------
 tools/readme.txt                     |  8 ++++++++
 {support/scripts => tools}/test-pkg  |  0
 3 files changed, 14 insertions(+), 6 deletions(-)
 create mode 100644 tools/readme.txt
 rename {support/scripts => tools}/test-pkg (100%)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
index d1eab2b440..0047dfd14f 100644
--- a/docs/manual/adding-packages-tips.txt
+++ b/docs/manual/adding-packages-tips.txt
@@ -45,9 +45,9 @@ continuously test random configurations. However, these only build the
 `master` branch of the git tree, and your new fancy package is not yet
 there.
 
-Buildroot provides a script in +support/scripts/test-pkg+ that uses the
-same base configurations as used by the autobuilders so you can test
-your package in the same conditions.
+Buildroot provides a script in +tools/test-pkg+ that uses the same base
+configurations as used by the autobuilders so you can test your package
+in the same conditions.
 
 First, create a config snippet that contains all the necessary options
 needed to enable your package, but without any architecture or toolchain
@@ -74,7 +74,7 @@ Then run the +test-pkg+ script, by telling it what config snippet to use
 and what package to test:
 
 ----
-$ ./support/scripts/test-pkg -c libcurl.config -p libcurl
+$ ./tools/test-pkg -c libcurl.config -p libcurl
 ----
 
 This will try to build your package against all the toolchains used
@@ -83,7 +83,7 @@ too long to do so). The output lists all toolchains and the corresponding
 result (excerpt, results are fake):
 
 ----
-$ ./support/scripts/test-pkg -c libcurl.config -p libcurl
+$ ./tools/test-pkg -c libcurl.config -p libcurl
                 armv5-ctng-linux-gnueabi [ 1/11]: OK
               armv7-ctng-linux-gnueabihf [ 2/11]: OK
                         br-aarch64-glibc [ 3/11]: SKIPPED
@@ -124,7 +124,7 @@ The +test-pkg+ script accepts a few options, for which you can get some
 help by running:
 
 ----
-$ ./support/scripts/test-pkg -h
+$ ./tools/test-pkg -h
 ----
 
 [[github-download-url]]
diff --git a/tools/readme.txt b/tools/readme.txt
new file mode 100644
index 0000000000..5b418dd41f
--- /dev/null
+++ b/tools/readme.txt
@@ -0,0 +1,8 @@
+This directory contains various useful scripts and tools for working
+with Buildroot. You need not add this directory in your PATH to use
+any of those tools, but you may do so if you want.
+
+test-pkg
+    a script that tests a specific package against a set of various
+    toolchains, with the goal to detect toolchain-related dependencies
+    (wchar, threads...)
diff --git a/support/scripts/test-pkg b/tools/test-pkg
similarity index 100%
rename from support/scripts/test-pkg
rename to tools/test-pkg
-- 
2.11.0
