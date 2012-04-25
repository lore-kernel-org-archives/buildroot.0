From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Apr 2012 13:10:42 -0300
Subject: [Buildroot] [PATCH 3/4] package/multimedia: move multimedia libs out
In-Reply-To: <1335370243-27044-1-git-send-email-gustavo@zacarias.com.ar>
References: <1335370243-27044-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1335370243-27044-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move multimedia libraries ouf of the Audio and Video category into the
Libraries/Multimedia one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                                  |    9 +++++++++
 package/{multimedia => }/libdvdnav/Config.in       |    0
 package/{multimedia => }/libdvdnav/libdvdnav.mk    |    0
 package/{multimedia => }/libdvdread/Config.in      |    0
 package/{multimedia => }/libdvdread/libdvdread.mk  |    0
 package/{multimedia => }/libmpeg2/Config.in        |    0
 .../libmpeg2/libmpeg2-0.5.1-altivec.patch          |    0
 package/{multimedia => }/libmpeg2/libmpeg2.mk      |    0
 package/{multimedia => }/libogg/Config.in          |    0
 package/{multimedia => }/libogg/libogg.mk          |    0
 package/{multimedia => }/libplayer/Config.in       |    0
 package/{multimedia => }/libplayer/libplayer.mk    |    0
 package/{multimedia => }/libtheora/Config.in       |    0
 package/{multimedia => }/libtheora/libtheora.mk    |    0
 package/multimedia/Config.in                       |    6 ------
 15 files changed, 9 insertions(+), 6 deletions(-)
 rename package/{multimedia => }/libdvdnav/Config.in (100%)
 rename package/{multimedia => }/libdvdnav/libdvdnav.mk (100%)
 rename package/{multimedia => }/libdvdread/Config.in (100%)
 rename package/{multimedia => }/libdvdread/libdvdread.mk (100%)
 rename package/{multimedia => }/libmpeg2/Config.in (100%)
 rename package/{multimedia => }/libmpeg2/libmpeg2-0.5.1-altivec.patch (100%)
 rename package/{multimedia => }/libmpeg2/libmpeg2.mk (100%)
 rename package/{multimedia => }/libogg/Config.in (100%)
 rename package/{multimedia => }/libogg/libogg.mk (100%)
 rename package/{multimedia => }/libplayer/Config.in (100%)
 rename package/{multimedia => }/libplayer/libplayer.mk (100%)
 rename package/{multimedia => }/libtheora/Config.in (100%)
 rename package/{multimedia => }/libtheora/libtheora.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 22fd38d..3337139 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -367,6 +367,15 @@ source "package/jquery-validation/Config.in"
 source "package/jsmin/Config.in"
 endmenu
 
+menu "Multimedia"
+source "package/libdvdread/Config.in"
+source "package/libdvdnav/Config.in"
+source "package/libmpeg2/Config.in"
+source "package/libogg/Config.in"
+source "package/libplayer/Config.in"
+source "package/libtheora/Config.in"
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
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 2871f8b..6188553 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -13,12 +13,6 @@ source "package/multimedia/gst-plugins-good/Config.in"
 source "package/multimedia/gst-plugins-bad/Config.in"
 source "package/multimedia/gst-plugins-ugly/Config.in"
 source "package/multimedia/lame/Config.in"
-source "package/multimedia/libdvdread/Config.in"
-source "package/multimedia/libdvdnav/Config.in"
-source "package/multimedia/libmpeg2/Config.in"
-source "package/multimedia/libogg/Config.in"
-source "package/multimedia/libplayer/Config.in"
-source "package/multimedia/libtheora/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
-- 
1.7.3.4
