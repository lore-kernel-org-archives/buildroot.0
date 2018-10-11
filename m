From: Lionel Orry <lionel.orry@gmail.com>
Date: Thu, 11 Oct 2018 11:57:53 +0200
Subject: [Buildroot] [PATCH v2 2/4] pkg-meson: <pkg>_SUBDIR cleanup
In-Reply-To: <20181011095755.9188-1-lionel.orry@gmail.com>
References: <20181011095755.9188-1-lionel.orry@gmail.com>
Message-ID: <20181011095755.9188-2-lionel.orry@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No functional change is brought by this modification.

This patch:
* removes a redundant <pkg>_SRCDIR declaration (already defined in
  pkg-generic.mk)
* documents the usage of <pkg>_SUBDIR in the meson-specific section of
  the manual.

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
---
 docs/manual/adding-packages-meson.txt | 6 ++++++
 package/pkg-meson.mk                  | 1 -
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
index c52fe10506..a0f64ba09e 100644
--- a/docs/manual/adding-packages-meson.txt
+++ b/docs/manual/adding-packages-meson.txt
@@ -85,6 +85,12 @@ A few additional variables, specific to the Meson infrastructure, can also be
 defined. Many of them are only useful in very specific cases, typical packages
 will therefore only use a few of them.
 
+* +FOO_SUBDIR+ may contain the name of a subdirectory inside the
+  package that contains the main meson.build file. This is useful,
+  if for example, the main meson.build file is not at the root of
+  the tree extracted by the tarball. If +HOST_FOO_SUBDIR+ is not
+  specified, it defaults to +FOO_SUBDIR+.
+
 * +FOO_CONF_ENV+, to specify additional environment variables to pass to
   +meson+ for the configuration step. By default, empty.
 
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 507e686068..5f2955b460 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -48,7 +48,6 @@ define inner-meson-package
 $(2)_CONF_ENV		?=
 $(2)_CONF_OPTS		?=
 $(2)_NINJA_ENV		?=
-$(2)_SRCDIR		= $$($(2)_DIR)/$$($(2)_SUBDIR)
 
 #
 # Configure step. Only define it if not already defined by the package
-- 
2.19.1
