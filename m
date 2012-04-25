From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Apr 2012 13:10:40 -0300
Subject: [Buildroot] [PATCH 1/4] package/multimedia: move networking libs out
Message-ID: <1335370243-27044-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Move networking libraries out of the Audio and Video category into the
Libaries/Networking one.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                           |    3 +++
 package/{multimedia => }/libmms/Config.in   |    0
 package/{multimedia => }/libmms/libmms.mk   |    0
 package/{multimedia => }/libmpd/Config.in   |    0
 package/{multimedia => }/libmpd/libmpd.mk   |    0
 package/{multimedia => }/live555/Config.in  |    0
 package/{multimedia => }/live555/live555.mk |    0
 package/multimedia/Config.in                |    3 ---
 8 files changed, 3 insertions(+), 3 deletions(-)
 rename package/{multimedia => }/libmms/Config.in (100%)
 rename package/{multimedia => }/libmms/libmms.mk (100%)
 rename package/{multimedia => }/libmpd/Config.in (100%)
 rename package/{multimedia => }/libmpd/libmpd.mk (100%)
 rename package/{multimedia => }/live555/Config.in (100%)
 rename package/{multimedia => }/live555/live555.mk (100%)

diff --git a/package/Config.in b/package/Config.in
index 28a08d2..6e03369 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -364,6 +364,8 @@ source "package/neon/Config.in"
 source "package/libmnl/Config.in"
 source "package/libmodbus/Config.in"
 source "package/libmbus/Config.in"
+source "package/libmpd/Config.in"
+source "package/libmms/Config.in"
 source "package/libnl/Config.in"
 source "package/libpcap/Config.in"
 source "package/libosip2/Config.in"
@@ -371,6 +373,7 @@ source "package/librsync/Config.in"
 source "package/libsoup/Config.in"
 source "package/libupnp/Config.in"
 source "package/libvncserver/Config.in"
+source "package/live555/Config.in"
 source "package/zeromq/Config.in"
 endmenu
 
diff --git a/package/multimedia/libmms/Config.in b/package/libmms/Config.in
similarity index 100%
rename from package/multimedia/libmms/Config.in
rename to package/libmms/Config.in
diff --git a/package/multimedia/libmms/libmms.mk b/package/libmms/libmms.mk
similarity index 100%
rename from package/multimedia/libmms/libmms.mk
rename to package/libmms/libmms.mk
diff --git a/package/multimedia/libmpd/Config.in b/package/libmpd/Config.in
similarity index 100%
rename from package/multimedia/libmpd/Config.in
rename to package/libmpd/Config.in
diff --git a/package/multimedia/libmpd/libmpd.mk b/package/libmpd/libmpd.mk
similarity index 100%
rename from package/multimedia/libmpd/libmpd.mk
rename to package/libmpd/libmpd.mk
diff --git a/package/multimedia/live555/Config.in b/package/live555/Config.in
similarity index 100%
rename from package/multimedia/live555/Config.in
rename to package/live555/Config.in
diff --git a/package/multimedia/live555/live555.mk b/package/live555/live555.mk
similarity index 100%
rename from package/multimedia/live555/live555.mk
rename to package/live555/live555.mk
diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index effec38..7e955c9 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -23,8 +23,6 @@ source "package/multimedia/libdvdread/Config.in"
 source "package/multimedia/libdvdnav/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
-source "package/multimedia/libmms/Config.in"
-source "package/multimedia/libmpd/Config.in"
 source "package/multimedia/libmpeg2/Config.in"
 source "package/multimedia/libogg/Config.in"
 source "package/multimedia/libplayer/Config.in"
@@ -33,7 +31,6 @@ source "package/multimedia/libsamplerate/Config.in"
 source "package/multimedia/libsndfile/Config.in"
 source "package/multimedia/libtheora/Config.in"
 source "package/multimedia/libvorbis/Config.in"
-source "package/multimedia/live555/Config.in"
 source "package/multimedia/madplay/Config.in"
 source "package/multimedia/mpd/Config.in"
 source "package/multimedia/mpg123/Config.in"
-- 
1.7.3.4
