From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 30 Apr 2012 10:33:52 -0300
Subject: [Buildroot] [PATCHv2 1/3] package/multimedia: move multimedia
	libraries out
In-Reply-To: <1335792834-25918-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335792834-25918-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335792834-25918-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move multimedia libraries ouf of the Audio and Video category into the
Libraries/Multimedia one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                  |   11 +++++++++++
 package/{multimedia => }/libdvdnav/Config.in       |    0
 package/{multimedia => }/libdvdnav/libdvdnav.mk    |    0
 package/{multimedia => }/libdvdread/Config.in      |    0
 package/{multimedia => }/libdvdread/libdvdread.mk  |    0
 package/{multimedia => }/libmms/Config.in          |    0
 package/{multimedia => }/libmms/libmms.mk          |    0
 package/{multimedia => }/libmpeg2/Config.in        |    0
 .../libmpeg2/libmpeg2-0.5.1-altivec.patch          |    0
 package/{multimedia => }/libmpeg2/libmpeg2.mk      |    0
 package/{multimedia => }/libogg/Config.in          |    0
 package/{multimedia => }/libogg/libogg.mk          |    0
 package/{multimedia => }/libplayer/Config.in       |    0
 package/{multimedia => }/libplayer/libplayer.mk    |    0
 package/{multimedia => }/libtheora/Config.in       |    0
 package/{multimedia => }/libtheora/libtheora.mk    |    0
 package/{multimedia => }/live555/Config.in         |    0
 package/{multimedia => }/live555/live555.mk        |    0
 package/multimedia/Config.in                       |    8 --------
 19 files changed, 11 insertions(+), 8 deletions(-)
 rename package/{multimedia => }/libdvdnav/Config.in (100%)
 rename package/{multimedia => }/libdvdnav/libdvdnav.mk (100%)
 rename package/{multimedia => }/libdvdread/Config.in (100%)
 rename package/{multimedia => }/libdvdread/libdvdread.mk (100%)
 rename package/{multimedia => }/libmms/Config.in (100%)
 rename package/{multimedia => }/libmms/libmms.mk (100%)
 rename package/{multimedia => }/libmpeg2/Config.in (100%)
 rename package/{multimedia => }/libmpeg2/libmpeg2-0.5.1-altivec.patch (100%)
 rename package/{multimedia => }/libmpeg2/libmpeg2.mk (100%)
 rename package/{multimedia => }/libogg/Config.in (100%)
 rename package/{multimedia => }/libogg/libogg.mk (100%)
 rename package/{multimedia => }/libplayer/Config.in (100%)
 rename package/{multimedia => }/libplayer/libplayer.mk (100%)
 rename package/{multimedia => }/libtheora/Config.in (100%)
 rename package/{multimedia => }/libtheora/libtheora.mk (100%)
 rename package/{multimedia => }/live555/Config.in (100%)
 rename package/{multimedia => }/live555/live555.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index ed66c05..48ec61f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -351,6 +351,17 @@ source "package/jquery-validation/Config.in"
 source "package/jsmin/Config.in"
 endmenu
 
+menu "Multimedia"
+source "package/libdvdread/Config.in"
+source "package/libdvdnav/Config.in"
+source "package/libmms/Config.in"
+source "package/libmpeg2/Config.in"
+source "package/libogg/Config.in"
+source "package/libplayer/Config.in"
+source "package/libtheora/Config.in"
+source "package/live555/Config.in"
+endmenu
+
 menu "Networking"
 source "package/glib-networking/Config.in"
 source "package/libcgi/Config.in"
diff --git a/package/multimedia/libdvdnav/Config.in b/package/libdvdnav/Config.in
similarity index 100%
rename from package/multimedia/libdvdnav/Config.in
rename to package/libdvdnav/Config.in
diff --git a/package/multimedia/libdvdnav/libdvdnav.mk b/package/libdvdnav/libdvdnav.mk
similarity index 100%
rename from package/multimedia/libdvdnav/libdvdnav.mk
rename to package/libdvdnav/libdvdnav.mk
diff --git a/package/multimedia/libdvdread/Config.in b/package/libdvdread/Config.in
similarity index 100%
rename from package/multimedia/libdvdread/Config.in
rename to package/libdvdread/Config.in
diff --git a/package/multimedia/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
similarity index 100%
rename from package/multimedia/libdvdread/libdvdread.mk
rename to package/libdvdread/libdvdread.mk
diff --git a/package/multimedia/libmms/Config.in b/package/libmms/Config.in
similarity index 100%
rename from package/multimedia/libmms/Config.in
rename to package/libmms/Config.in
diff --git a/package/multimedia/libmms/libmms.mk b/package/libmms/libmms.mk
similarity index 100%
rename from package/multimedia/libmms/libmms.mk
rename to package/libmms/libmms.mk
diff --git a/package/multimedia/libmpeg2/Config.in b/package/libmpeg2/Config.in
similarity index 100%
rename from package/multimedia/libmpeg2/Config.in
rename to package/libmpeg2/Config.in
diff --git a/package/multimedia/libmpeg2/libmpeg2-0.5.1-altivec.patch b/package/libmpeg2/libmpeg2-0.5.1-altivec.patch
similarity index 100%
rename from package/multimedia/libmpeg2/libmpeg2-0.5.1-altivec.patch
rename to package/libmpeg2/libmpeg2-0.5.1-altivec.patch
diff --git a/package/multimedia/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
similarity index 100%
rename from package/multimedia/libmpeg2/libmpeg2.mk
rename to package/libmpeg2/libmpeg2.mk
diff --git a/package/multimedia/libogg/Config.in b/package/libogg/Config.in
similarity index 100%
rename from package/multimedia/libogg/Config.in
rename to package/libogg/Config.in
diff --git a/package/multimedia/libogg/libogg.mk b/package/libogg/libogg.mk
similarity index 100%
rename from package/multimedia/libogg/libogg.mk
rename to package/libogg/libogg.mk
diff --git a/package/multimedia/libplayer/Config.in b/package/libplayer/Config.in
similarity index 100%
rename from package/multimedia/libplayer/Config.in
rename to package/libplayer/Config.in
diff --git a/package/multimedia/libplayer/libplayer.mk b/package/libplayer/libplayer.mk
similarity index 100%
rename from package/multimedia/libplayer/libplayer.mk
rename to package/libplayer/libplayer.mk
diff --git a/package/multimedia/libtheora/Config.in b/package/libtheora/Config.in
similarity index 100%
rename from package/multimedia/libtheora/Config.in
rename to package/libtheora/Config.in
diff --git a/package/multimedia/libtheora/libtheora.mk b/package/libtheora/libtheora.mk
similarity index 100%
rename from package/multimedia/libtheora/libtheora.mk
rename to package/libtheora/libtheora.mk
diff --git a/package/multimedia/live555/Config.in b/package/live555/Config.in
similarity index 100%
rename from package/multimedia/live555/Config.in
rename to package/live555/Config.in
diff --git a/package/multimedia/live555/live555.mk b/package/live555/live555.mk
similarity index 100%
rename from package/multimedia/live555/live555.mk
rename to package/live555/live555.mk
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index ca6b791..89c5041 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -20,21 +20,13 @@ source "package/multimedia/libao/Config.in"
 source "package/multimedia/libcdaudio/Config.in"
 source "package/multimedia/libcue/Config.in"
 source "package/multimedia/libcuefile/Config.in"
-source "package/multimedia/libdvdread/Config.in"
-source "package/multimedia/libdvdnav/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
-source "package/multimedia/libmms/Config.in"
 source "package/multimedia/libmpd/Config.in"
-source "package/multimedia/libmpeg2/Config.in"
-source "package/multimedia/libogg/Config.in"
-source "package/multimedia/libplayer/Config.in"
 source "package/multimedia/libreplaygain/Config.in"
 source "package/multimedia/libsamplerate/Config.in"
 source "package/multimedia/libsndfile/Config.in"
-source "package/multimedia/libtheora/Config.in"
 source "package/multimedia/libvorbis/Config.in"
-source "package/multimedia/live555/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
-- 
1.7.3.4
