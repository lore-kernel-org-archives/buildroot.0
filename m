From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:14:57 +0100
Subject: [Buildroot] [PATCH 19/23] manual: add adding-package-tips.txt
In-Reply-To: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1352639701-27829-20-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

 create mode 100644 docs/manual/adding-packages-tips.txt

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
-- 
1.8.0
