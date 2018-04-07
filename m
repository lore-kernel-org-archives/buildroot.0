From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  7 Apr 2018 13:52:30 +0200
Subject: [Buildroot] [PATCH 1/1] mpd: add mms support
Message-ID: <20180407115230.22559-1-fontaine.fabrice@gmail.com>
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
index 6c7468e173..831e4ab0d7 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -180,6 +180,12 @@ config BR2_PACKAGE_MPD_CURL
 	help
 	  Enable curl streaming (http) support.
 
+config BR2_PACKAGE_MPD_LIBMMS
+	bool "mms"
+	select BR2_PACKAGE_LIBMMS
+	help
+	  Enable MMS support.
+
 config BR2_PACKAGE_MPD_LIBNFS
 	bool "nfs"
 	# libnfs -> libtirpc
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index 639c8c1981..64471d4da5 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -120,6 +120,13 @@ else
 MPD_CONF_OPTS += --disable-libmpdclient
 endif
 
+ifeq ($(BR2_PACKAGE_MPD_LIBMMS),y)
+MPD_DEPENDENCIES += libmms
+MPD_CONF_OPTS += --enable-mms
+else
+MPD_CONF_OPTS += --disable-mms
+endif
+
 ifeq ($(BR2_PACKAGE_MPD_LIBNFS),y)
 MPD_DEPENDENCIES += libnfs
 MPD_CONF_OPTS += --enable-nfs
-- 
2.14.1
