From: Thierry Bultel <tbultel@free.fr>
Date: Sat,  6 Dec 2014 15:42:09 +0100
Subject: [Buildroot] [PATCH 1/1] Added mpd-mpc, mpc client to mpd
Message-ID: <1417876929-21438-1-git-send-email-tbultel@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thierry Bultel <tbultel@free.fr>
---
 package/Config.in          |  1 +
 package/mpd-mpc/Config.in  |  8 ++++++++
 package/mpd-mpc/mpd-mpc.mk | 12 ++++++++++++
 3 files changed, 21 insertions(+)
 create mode 100644 package/mpd-mpc/Config.in
 create mode 100644 package/mpd-mpc/mpd-mpc.mk

diff --git a/package/Config.in b/package/Config.in
index a8010d3..19eef96 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -19,6 +19,7 @@ menu "Audio and video applications"
 	source "package/madplay/Config.in"
 	source "package/modplugtools/Config.in"
 	source "package/mpd/Config.in"
+	source "package/mpd-mpc/Config.in"
 	source "package/mpg123/Config.in"
 	source "package/mplayer/Config.in"
 	source "package/musepack/Config.in"
diff --git a/package/mpd-mpc/Config.in b/package/mpd-mpc/Config.in
new file mode 100644
index 0000000..a56e2a6
--- /dev/null
+++ b/package/mpd-mpc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_MPD_MPC
+	bool "mpd-mpc"
+	select BR2_PACKAGE_MPD
+	select BR2_PACKAGE_LIBMPDCLIENT
+	help
+	  A minimalist command line interface to MPD.
+
+	  http://www.musicpd.org/clients/mpc/
diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
new file mode 100644
index 0000000..3950a1e
--- /dev/null
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# mpc
+#
+################################################################################
+
+MPD_MPC_VERSION = 0.26
+MPD_MPC_SITE = http://www.musicpd.org/download/mpc/0
+MPD_MPC_SOURCE=mpc-$(MPD_MPC_VERSION).tar.xz
+MPD_MPC_DEPENDENCIES = mpd libmpdclient
+
+$(eval $(autotools-package))
-- 
1.9.1
