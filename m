From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:59:54 +0100
Subject: [Buildroot] [git commit] manual: add adding-package-tips.txt
Message-ID: <20121115230542.6832399E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=baa838e39251d298dbb4c031638b83a1b28f6881
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/adding-packages-tips.txt |   54 ++++++++++++++++++++++++++++++++++
 docs/manual/adding-packages.txt      |    2 +
 2 files changed, 56 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-tips.txt b/docs/manual/adding-packages-tips.txt
new file mode 100644
index 0000000..acc73d3
--- /dev/null
+++ b/docs/manual/adding-packages-tips.txt
@@ -0,0 +1,54 @@
+// -*- mode:doc; -*-
+
+Tips and tricks
+~~~~~~~~~~~~~~~
+
+[[package-name-variable-relation]]
+Package name, config entry name and makefile variable relationship
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+In Buildroot, there are some relation between:
+
+* the _package name_, which is the package directory name (and the
+  name of the +*.mk+ file);
+
+* the config entry name that is declared in the +Config.in+ file;
+
+* the makefile variable prefix.
+
+Thus, it is mandatory to keep consistency between all this stuff,
+matching the following rules:
+
+* the _make_ target name will be the _package name_ itself (e.g.:
+  +foo-bar_boo+);
+
+* the config entry is the upper case _package name_ with `.` and `-`
+  characters substituted with `_`, prefixed with +BR2_PACKAGE_+ (e.g.:
+  +BR2_PACKAGE_FOO_BAR_BOO+);
+
+* the +*.mk+ file variable prefix is the upper case _package name_
+  `.` and `-` characters substituted with `_` (e.g.:
+  +FOO_BAR_BOO_VERSION+).
+
+
+[[github-download-url]]
+How to add package from github
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+If the package has no release version, or its version cannot be
+identified using tag, then the sha1 of the particular commit should be
+used to identify the version (the first 7 characters of the sha1 are
+enough):
+
+------------------------
+FOO_VERSION = 1234567
+FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
+------------------------
+
+If the package version matches a tag, then this tag should be used to
+identify the version:
+
+------------------------
+FOO_VERSION = v1.0
+FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
+------------------------
diff --git a/docs/manual/adding-packages.txt b/docs/manual/adding-packages.txt
index 8221c85..b909d47 100644
--- a/docs/manual/adding-packages.txt
+++ b/docs/manual/adding-packages.txt
@@ -19,4 +19,6 @@ include::adding-packages-cmake.txt[]
 
 include::adding-packages-gettext.txt[]
 
+include::adding-packages-tips.txt[]
+
 include::adding-packages-conclusion.txt[]
