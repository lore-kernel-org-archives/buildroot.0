From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 19:32:49 +0100
Subject: [Buildroot] [PATCH 08/10] directfb-exambles: adding new examples to
	the menu
In-Reply-To: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
References: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1362940371-25899-9-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>


Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/directfb-examples/Config.in            |   12 ++++++++++++
 package/directfb-examples/directfb-examples.mk |    2 ++
 2 files changed, 14 insertions(+)

diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
index abd0e25..e84f0f7 100644
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
-- 
1.7.10.4
