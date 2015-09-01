From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  2 Sep 2015 00:01:14 +0200
Subject: [Buildroot] [PATCHv3 13/15] directfb-examples: remove options for
	each example
In-Reply-To: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1441144876-2628-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1441144876-2628-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For some historical reasons, the directfb-examples package has one
sub-option for each example, and the .mk files go through some great
lengths to install only the needed data files for each example.

This is a bit silly for several reasons:

 * In no other Buildroot package we do offer such a fine-grained
   selection of what the package installs;

 * directfb-examples are examples, they are therefore typically not
   meant to be used on a final production system, but more during
   development or for demonstration. Those are situations where size
   generally isn't that critical (all installed, the package takes 2.4
   MB on the rootfs);

 * Those options and the .mk file logic has to be updated whenever the
   package is bumped;

 * Users can always use a post-build script to keep only the examples
   they are interested in.

All the options are moved to Config.in.legacy. However, we could
debate on whether this is actually useful, since the main option
BR2_PACKAGE_DIRECTFB_EXAMPLES will now install a superset of whatever
was selected before through sub-options.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                               | 209 +++++++++++++++++++++++++
 package/directfb-examples/Config.in            | 151 ------------------
 package/directfb-examples/directfb-examples.mk |  93 -----------
 3 files changed, 209 insertions(+), 244 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index d0e2c81..52031fe 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -107,6 +107,215 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2015.11"
 
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
+	bool "DirectFB example df_andi has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD
+	bool "DirectFB example df_bltload has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD
+	bool "DirectFB example df_cpuload has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER
+	bool "DirectFB example df_databuffer has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD
+	bool "DirectFB example df_dioload has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK
+	bool "DirectFB example df_dok has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST
+	bool "DirectFB example df_drivertest has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE
+	bool "DirectFB example df_fire has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP
+	bool "DirectFB example df_flip has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS
+	bool "DirectFB example df_fonts has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT
+	bool "DirectFB example df_input has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK
+	bool "DirectFB example df_joystick has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES
+	bool "DirectFB example df_knuckles has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER
+	bool "DirectFB example df_layer has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX
+	bool "DirectFB example df_matrix has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER
+	bool "DirectFB example df_matrix_water has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO
+	bool "DirectFB example df_neo has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD
+	bool "DirectFB example df_netload has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE
+	bool "DirectFB example df_palette has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE
+	bool "DirectFB example df_particle has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER
+	bool "DirectFB example df_porter has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS
+	bool "DirectFB example df_stress has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE
+	bool "DirectFB example df_texture has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO
+	bool "DirectFB example df_video has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE
+	bool "DirectFB example df_video_particle has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
+config BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW
+	bool "DirectFB example df_window has been removed"
+	select BR2_PACKAGE_DIRECTFB_EXAMPLES
+	help
+	  The per-DirectFB example options have been removed. The
+	  BR2_PACKAGE_DIRECTFB_EXAMPLES option now installs all
+	  examples.
+
 config BR2_PACKAGE_SAWMAN
 	bool "sawman package removed"
 	select BR2_LEGACY
diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
index f69cd3b..eef9f5c 100644
--- a/package/directfb-examples/Config.in
+++ b/package/directfb-examples/Config.in
@@ -7,154 +7,3 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES
 	  DirectFB features.
 
 	  http://directfb.org/downloads/Extras/README.DirectFB-examples
-
-if BR2_PACKAGE_DIRECTFB_EXAMPLES
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI
-	bool "df_andi"
-	help
-	  Penguin demo, press 'space' to form convergence logo,
-	  's'/'d' to spawn/destroy 'a' penguin, 'r' to revive penguin
-	  after space was pressed, 'c' tests clipping.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD
-	bool "df_bltload"
-	help
-	  Reads information from /proc/bltstat.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD
-	bool "df_cpuload"
-	help
-	  CPU Load with data from /proc/stat.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER
-	bool "df_databuffer"
-	help
-	  Simple test application for data buffers.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD
-	bool "df_dioload"
-	help
-	  Disk IO with data from /proc/stat.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK
-	bool "df_dok"
-	help
-	  DirectFB benchmark application, runs some tests and
-	  displays benchmark results afterwards.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST
-	bool "df_drivertest"
-	help
-	  Tool to check drivers for bugs and accuracy.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE
-	bool "df_fire"
-	help
-	  The famous fire effect ported to DirectFB (16 bpp only).
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP
-	bool "df_flip"
-	help
-	  Raw Flip() benchmark.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS
-	bool "df_fonts"
-	help
-	  Takes a list of font files and shows character tables.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT
-	bool "df_input"
-	help
-	  Test application for input devices.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK
-	bool "df_joystick"
-	help
-	  A colored version of df_particle, fointain can be moved with
-	  joystick. The particles of different colors can be spawned
-	  with different joystick buttons (1-4).
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES
-	bool "df_knuckles"
-	help
-	  3D skull drawn using triangles that can be rotated using
-	  the mouse. 'Space' switches to wireframe, 'b' toggles
-	  backface culling.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER
-	bool "df_layer"
-	help
-	  Simple videoplayer with layers.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX
-	bool "df_matrix"
-	help
-	  Testing SetMatrix() for free transforms.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER
-	bool "df_matrix_water"
-	help
-	  Same as df_matrix, but using new Water API.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO
-	bool "df_neo"
-	help
-	  Port from a gdk-pixbuf demo to DirectFB, uses scaling,
-	  alpha blending and color modulation, use cursor keys and
-	  space to change parameters.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD
-	bool "df_netload"
-	help
-	  Network statistica from /proc/net/dev.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE
-	bool "df_palette"
-	help
-	  A example blitting from a surface with a
-	  rotating/morphing palette.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE
-	bool "df_particle"
-	help
-	  A moving fountain consisting of alphablended rectangles,
-	  nice and fast if hardware accelerated.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER
-	bool "df_porter"
-	help
-	  Shows porter/duff blending rules.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS
-	bool "df_stress"
-	help
-	  Stress tests surface manager, for debugging purposes only.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE
-	bool "df_texture"
-	help
-	  A simple texture example. The 3d windows can be rotated
-	  with the mouse.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO
-	bool "df_video"
-	help
-	  Shows window stack with alpha blending and video playback
-	  in a moving window.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE
-	bool "df_video_particle"
-	help
-	  Same as df_particle, but the rectangles have been
-	  replaced by a video (via video4linux). Nice color effects.
-
-config BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW
-	bool "df_window"
-	help
-	  Simple demonstration of the DirectFB window stack, follow
-	  the instructions in the upper left corner. Pass a video
-	  device file or a movie file on the command-line to enable
-	  video playback in one of the windows.
-
-endif
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 3ba33b4..f40a030 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -16,97 +16,4 @@ ifeq ($(BR2_STATIC_LIBS),y)
         DIRECTFB_EXAMPLES_CONF_OPTS += LIBS=-lstdc++
 endif
 
-DIRECTFB_EXAMPLES_TARGETS_ =
-DIRECTFB_EXAMPLES_TARGETS_y =
-
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI) += usr/bin/df_andi
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_BLTLOAD) += usr/bin/df_bltload
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_CPULOAD) += usr/bin/df_cpuload
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DATABUFFER) += usr/bin/df_databuffer
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DIOLOAD) += usr/bin/df_dioload
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/bin/df_dok
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST) += usr/bin/df_drivertest
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_FIRE) += usr/bin/df_fire
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_FLIP) += usr/bin/df_flip
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS) += usr/bin/df_fonts
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT) += usr/bin/df_input
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_JOYSTICK) += usr/bin/df_joystick
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_KNUCKLES) += usr/bin/df_knuckles
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_LAYER) += usr/bin/df_layer
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX) += usr/bin/df_matrix
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_MATRIX_WATER) += usr/bin/df_matrix_water
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO) += usr/bin/df_neo
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NETLOAD) += usr/bin/df_netload
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_PALETTE) += usr/bin/df_palette
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_PARTICLE) += usr/bin/df_particle
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_PORTER) += usr/bin/df_porter
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS) += usr/bin/df_stress
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE) += usr/bin/df_texture
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO) += usr/bin/df_video
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE) += usr/bin/df_video_particle
-DIRECTFB_EXAMPLES_TARGETS_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW) += usr/bin/df_window
-
-DIRECTFB_EXAMPLES_DATA_ =
-DIRECTFB_EXAMPLES_DATA_y =
-
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI) += usr/share/directfb-examples/destination_mask.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI) += usr/share/directfb-examples/tux.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_ANDI) += usr/share/directfb-examples/wood_andi.jpg
-
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/biglogo.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/card.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/melted.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/meter.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/pngtest*.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/colorkeyed.gif
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/intro.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/fish.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/swirl.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DOK) += usr/share/directfb-examples/rose.png
-
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST) += usr/share/directfb-examples/pngtest.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_DRIVERTEST) += usr/share/directfb-examples/testmask.png
-
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT) += usr/share/directfb-examples/joystick.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT) += usr/share/directfb-examples/gnu-keys.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_INPUT) += usr/share/directfb-examples/gnome-mouse.png
-
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO) += usr/share/directfb-examples/apple-red.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO) += usr/share/directfb-examples/gnome-*.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO) += usr/share/directfb-examples/gnu-*.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_NEO) += usr/share/directfb-examples/background*.jpg
-
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_STRESS) += usr/share/directfb-examples/melted.png
-
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_TEXTURE) += usr/share/directfb-examples/texture.png
-
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO) += usr/share/directfb-examples/shot.png
-
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_VIDEO_PARTICLE) += usr/share/directfb-examples/convergence.png
-
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW) += usr/share/directfb-examples/desktop.png
-DIRECTFB_EXAMPLES_DATA_$(BR2_PACKAGE_DIRECTFB_EXAMPLES_WINDOW) += usr/share/directfb-examples/dfblogo.png
-
-DIRECTFB_EXAMPLES_FONT_y =
-ifeq ($(BR2_PACKAGE_DIRECTFB_EXAMPLES_FONTS),y)
-DIRECTFB_EXAMPLES_FONT_y = usr/share/directfb-examples/fonts/*
-endif
-
-define DIRECTFB_EXAMPLES_INSTALL_TARGET_CMDS
-	$(Q)mkdir -p $(TARGET_DIR)/usr/bin
-	$(Q)mkdir -p $(TARGET_DIR)/usr/share/directfb-examples/
-	$(Q)mkdir -p $(TARGET_DIR)/usr/share/directfb-examples/fonts/
-	$(Q)for file in $(DIRECTFB_EXAMPLES_TARGETS_y); do \
-	        cp -dpf $(STAGING_DIR)/$$file $(TARGET_DIR)/$$file; \
-	done
-	$(Q)cp -rdpf $(STAGING_DIR)/usr/share/directfb-examples/fonts/decker.ttf $(TARGET_DIR)/usr/share/directfb-examples/fonts/
-	$(Q)for file in $(DIRECTFB_EXAMPLES_FONT_y); do \
-		$(INSTALL) -m 0644 $(STAGING_DIR)/$$file $(TARGET_DIR)/usr/share/directfb-examples/fonts/; \
-	done
-	$(Q)$(INSTALL) -m 0755 -d $(TARGET_DIR)/usr/share/directfb-examples
-	$(Q)for file in $(DIRECTFB_EXAMPLES_DATA_y); do \
-		$(INSTALL) -m 0644 $(STAGING_DIR)/$$file $(TARGET_DIR)/usr/share/directfb-examples; \
-	done
-endef
-
 $(eval $(autotools-package))
-- 
2.5.1
