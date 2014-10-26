From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:06:29 +0100
Subject: [Buildroot] [git commit] docs/manual: update cmake-package
	infrastructure section
Message-ID: <20141026160700.5F100B0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8228e170bc9b7fbd42498afaa8735209b9d02f16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch documents the CMake options preset by the cmake-package
infrastructure.

[Thomas: minor wording tweak.]

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-cmake.txt |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index d5a7029..02f1dbb 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -95,7 +95,17 @@ typical packages will therefore only use a few of them.
   pass to CMake. By default, empty.
 
 * +LIBFOO_CONF_OPTS+, to specify additional configure options to pass
-  to CMake. By default, empty.
+  to CMake. By default, empty. A number of common CMake options are
+  set by the +cmake-package+ infrastructure; so it is normally not
+  necessary to set them in the package's +*.mk+ file unless you want
+  to override them:
+
+** +CMAKE_BUILD_TYPE+ is driven by +BR2_ENABLE_DEBUG+;
+** +CMAKE_INSTALL_PREFIX+;
+** +BUILD_SHARED_LIBS+ is driven by +BR2_PREFER_STATIC_LIBS+;
+** +BUILD_DOC+, +BUILD_DOCS+ are disabled;
+** +BUILD_EXAMPLE+, +BUILD_EXAMPLES+ are disabled;
+** +BUILD_TEST+, +BUILD_TESTS+, +BUILD_TESTING+ are disabled.
 
 * +LIBFOO_MAKE+, to specify an alternate +make+ command. This is
   typically useful when parallel make is enabled in the configuration
