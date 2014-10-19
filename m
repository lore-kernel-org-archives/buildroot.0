From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 20:04:51 +0200
Subject: [Buildroot] [PATCH 15/15] docs/manual: update cmake-package
	infrastructure section
In-Reply-To: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1413741891-30113-16-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch documents the CMake options preset by the cmake-package
infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/adding-packages-cmake.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/docs/manual/adding-packages-cmake.txt b/docs/manual/adding-packages-cmake.txt
index d5a7029..0f36c7d 100644
--- a/docs/manual/adding-packages-cmake.txt
+++ b/docs/manual/adding-packages-cmake.txt
@@ -96,6 +96,16 @@ typical packages will therefore only use a few of them.
 
 * +LIBFOO_CONF_OPTS+, to specify additional configure options to pass
   to CMake. By default, empty.
+  A number of common CMake options are set by the +cmake-package+
+  infrastructure; so it should not be necessary to set them in the
+  package's +*.mk+ file unless you want to override them:
+
+** +CMAKE_BUILD_TYPE+ is driven by +BR2_ENABLE_DEBUG+;
+** +CMAKE_INSTALL_PREFIX+;
+** +BUILD_SHARED_LIBS+ is driven by +BR2_PREFER_STATIC_LIBS+;
+** +BUILD_DOC+, +BUILD_DOCS+ are disabled;
+** +BUILD_EXAMPLE+, +BUILD_EXAMPLES+ are disabled;
+** +BUILD_TEST+, +BUILD_TESTS+, +BUILD_TESTING+ are disabled.
 
 * +LIBFOO_MAKE+, to specify an alternate +make+ command. This is
   typically useful when parallel make is enabled in the configuration
-- 
2.1.2
