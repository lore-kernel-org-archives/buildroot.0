From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 17:21:28 +0100
Subject: [Buildroot] [git commit] package/pkg-meson: <pkg>_SUBDIR cleanup
Message-ID: <20190206162018.AD9DB81F17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be0bb26f29238f9c3210e21dd456f09e0d7b63bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No functional change is brought by this modification.

This patch:
* removes a redundant <pkg>_SRCDIR declaration (already defined in
  pkg-generic.mk)
* documents the usage of <pkg>_SUBDIR in the meson-specific section of
  the manual.

Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-meson.txt | 6 ++++++
 package/pkg-meson.mk                  | 1 -
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-meson.txt b/docs/manual/adding-packages-meson.txt
index 549319b192..30c338f486 100644
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
index 256e5645e4..a637299476 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -48,7 +48,6 @@ define inner-meson-package
 $(2)_CONF_ENV		?=
 $(2)_CONF_OPTS		?=
 $(2)_NINJA_ENV		?=
-$(2)_SRCDIR		= $$($(2)_DIR)/$$($(2)_SUBDIR)
 
 #
 # Configure step. Only define it if not already defined by the package
