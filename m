From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 5 May 2019 23:31:52 +0200
Subject: [Buildroot] [git commit]
 package/gstreamer1/gstreamer1-editing-services: bump to version 1.16.0
Message-ID: <20190505212653.12AB881121@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8efe29384e67db08d06952c96c4f3420815f619
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also removed upstreamed patch 0001-examples-ges-ui-fix-some-gtk2-ism.patch.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-examples-ges-ui-fix-some-gtk2-ism.patch   | 66 ----------------------
 .../gstreamer1-editing-services.hash               |  4 +-
 .../gstreamer1-editing-services.mk                 |  2 +-
 3 files changed, 3 insertions(+), 69 deletions(-)

diff --git a/package/gstreamer1/gstreamer1-editing-services/0001-examples-ges-ui-fix-some-gtk2-ism.patch b/package/gstreamer1/gstreamer1-editing-services/0001-examples-ges-ui-fix-some-gtk2-ism.patch
deleted file mode 100644
index 5a074941fd..0000000000
--- a/package/gstreamer1/gstreamer1-editing-services/0001-examples-ges-ui-fix-some-gtk2-ism.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From 76f3dcb8f11a240fc7147ab556c57f10abc9e957 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim-Philipp=20M=C3=BCller?= <tim@centricular.com>
-Date: Sun, 20 May 2018 23:46:42 +0100
-Subject: [PATCH] examples: ges-ui: fix some gtk2-ism
-
-Still lots of deprecated API to update.
-
-https://bugzilla.gnome.org/show_bug.cgi?id=796243
-
-Upstream: https://cgit.freedesktop.org/gstreamer/gst-editing-services/commit/?id=76f3dcb8f11a240fc7147ab556c57f10abc9e957
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- examples/c/ges-ui.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/examples/c/ges-ui.c b/examples/c/ges-ui.c
-index 4acd1ee9..45694a6b 100644
---- a/examples/c/ges-ui.c
-+++ b/examples/c/ges-ui.c
-@@ -106,7 +106,7 @@ static int n_instances = 0;
-  * These are declared non-static for signal auto-connection
-  */
- 
--gboolean window_delete_event_cb (GtkObject * window, GdkEvent * event,
-+gboolean window_delete_event_cb (GtkWidget * window, GdkEvent * event,
-     App * app);
- void new_activate_cb (GtkMenuItem * item, App * app);
- void open_activate_cb (GtkMenuItem * item, App * app);
-@@ -1076,14 +1076,14 @@ gboolean
- add_effect_dlg_delete_event_cb (GtkWidget * widget, GdkEvent * event,
-     gpointer * app)
- {
--  gtk_widget_hide_all (((App *) app)->add_effect_dlg);
-+  gtk_widget_hide (((App *) app)->add_effect_dlg);
-   return TRUE;
- }
- 
- void
- on_cancel_add_effect_cb (GtkButton * button, App * app)
- {
--  gtk_widget_hide_all (app->add_effect_dlg);
-+  gtk_widget_hide (app->add_effect_dlg);
- }
- 
- void
-@@ -1103,7 +1103,7 @@ on_apply_effect_cb (GtkButton * button, App * app)
- 
-   gtk_entry_set_text (GTK_ENTRY (app->audio_effect_entry), "");
- 
--  gtk_widget_hide_all (app->add_effect_dlg);
-+  gtk_widget_hide (app->add_effect_dlg);
- }
- 
- static void
-@@ -1347,7 +1347,7 @@ app_new_from_uri (gchar * uri)
- /* UI callbacks  ************************************************************/
- 
- gboolean
--window_delete_event_cb (GtkObject * window, GdkEvent * event, App * app)
-+window_delete_event_cb (GtkWidget * window, GdkEvent * event, App * app)
- {
-   app_dispose (app);
-   return FALSE;
--- 
-2.19.0
-
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
index a388a097dd..7d6ab30829 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
@@ -1,5 +1,5 @@
-# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.14.4.tar.xz.sha256sum
-sha256 53d1d25b356009505ae0d22c218d6c6b1215399d9f6e3fe5d7b88e156531b35f gstreamer-editing-services-1.14.4.tar.xz
+# From https://gstreamer.freedesktop.org/src/gstreamer-editing-services/gstreamer-editing-services-1.16.0.tar.xz.sha256sum
+sha256 82a3faefb2b0d91e134fd02cddeee718b7846a07cbf0127fed7aa03e25495ad1 gstreamer-editing-services-1.16.0.tar.xz
 
 # Hashes for license files:
 sha256 f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a COPYING
diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
index 74a36824ed..9412e277e6 100644
--- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
+++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GSTREAMER1_EDITING_SERVICES_VERSION = 1.14.4
+GSTREAMER1_EDITING_SERVICES_VERSION = 1.16.0
 GSTREAMER1_EDITING_SERVICES_SOURCE = gstreamer-editing-services-$(GSTREAMER1_EDITING_SERVICES_VERSION).tar.xz
 GSTREAMER1_EDITING_SERVICES_SITE = http://gstreamer.freedesktop.org/src/gstreamer-editing-services
 GSTREAMER1_EDITING_SERVICES_LICENSE = LGPL-2.0+
