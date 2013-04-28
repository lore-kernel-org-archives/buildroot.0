From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 28 Apr 2013 21:52:11 +0200
Subject: [Buildroot] [git commit] directfb-exambles: adding new examples to
	the menu
Message-ID: <20130428205745.E63C29B8AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a6f1927031d80bce111617b84e7d80e44f101c8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/directfb-examples/Config.in            |   12 ++++++++++++
 package/directfb-examples/directfb-examples.mk |    2 ++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
index be5ba86..afd6d6d 100644
--- a/package/directfb-examples/Config.in
+++ b/package/directfb-examples/Config.in
@@ -99,6 +99,18 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER
 	help
 	  Simple videoplayer with layers.
 
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX
+	bool "usr/bin/df_matrix"
+	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  Testing SetMatrix() for free transforms.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER
+	bool "usr/bin/df_matrix_water"
+	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  Same as df_matrix, but using new Water API.
+
 config BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO
 	bool "usr/bin/df_neo"
 	depends on BR2_PACKAGE_DIRECTFB_EXAMPLES
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index c7235d6..1342047 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -27,6 +27,8 @@ DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT) += usr/bin/df_i
 DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK) += usr/bin/df_joystick
 DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES) += usr/bin/df_knuckles
 DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER) += usr/bin/df_layer
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX) += usr/bin/df_matrix
+DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER) += usr/bin/df_matrix_water
 DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO) += usr/bin/df_neo
 DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD) += usr/bin/df_netload
 DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE) += usr/bin/df_palette
