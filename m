From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Apr 2018 18:51:36 +0200
Subject: [Buildroot] [PATCH 1/1] mpd: enable cdio-paranoia support
Message-ID: <20180428165136.29617-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpd/Config.in | 6 ++++++
 package/mpd/mpd.mk    | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index 831e4ab0d7..857f212477 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -174,6 +174,12 @@ config BR2_PACKAGE_MPD_TWOLAME
 
 comment "Input plugins"
 
+config BR2_PACKAGE_MPD_CDIO_PARANOIA
+	bool "cdio-paranoia"
+	select BR2_PACKAGE_LIBCDIO_PARANOIA
+	help
+	  Enable cdio-paranoia support.
+
 config BR2_PACKAGE_MPD_CURL
 	bool "curl"
 	select BR2_PACKAGE_LIBCURL
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 64471d4da5..d41ffe1571 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -59,6 +59,13 @@ else
 MPD_CONF_OPTS += --disable-bzip2
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_CDIO_PARANOIA),y)
+MPD_DEPENDENCIES += libcdio-paranoia
+MPD_CONF_OPTS += --enable-cdio-paranoia
+else
+MPD_CONF_OPTS += --disable-cdio-paranoia
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_CURL),y)
 MPD_DEPENDENCIES += libcurl
 MPD_CONF_OPTS += --enable-curl
-- 
2.14.1
