From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Wed,  9 Jan 2013 18:03:34 +0100
Subject: [Buildroot] [PATCH] packages/dvbsnoop: new package dvbsnoop
In-Reply-To: <1357751014-5123-1-git-send-email-c.schoenert@gmail.com>
References: <1357751014-5123-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1357751014-5123-2-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@t-online.de>

dvbsnoop is a DVB/MPEG stream analyzer. It's designed to debug, dump or
view the digital stream info available via

    satellit    -> DVB-S, DVB-S2
    cable       -> DVB-C, DVB-C2
    terrestrial -> DVB-T, DVB-T2

dvbsnoop can be used on any digital settopbox that running on linux and
provides the DVB APIv3. It's also usable on classical PCs that contains
a DVB hardware (PCI Card or USB Plug).

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/multimedia/Config.in            |    1 +
 package/multimedia/dvbsnoop/Config.in   |    9 +++++++++
 package/multimedia/dvbsnoop/dvbsnoop.mk |   13 +++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 package/multimedia/dvbsnoop/Config.in
 create mode 100644 package/multimedia/dvbsnoop/dvbsnoop.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 273d9bc..07b4f1a 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -2,6 +2,7 @@ menu "Audio and video applications"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/aumix/Config.in"
 source "package/multimedia/bellagio/Config.in"
+source "package/multimedia/dvbsnoop/Config.in"
 source "package/multimedia/faad2/Config.in"
 source "package/multimedia/flac/Config.in"
 source "package/multimedia/ffmpeg/Config.in"
diff --git a/package/multimedia/dvbsnoop/Config.in b/package/multimedia/dvbsnoop/Config.in
new file mode 100644
index 0000000..afd0bc5
--- /dev/null
+++ b/package/multimedia/dvbsnoop/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DVBSNOOP
+	bool "dvbsnoop"
+	help
+	  DVB analyzer / MPEG analyzer program to monitor, analyze, debug,
+	  dump or view dvb/mpeg/dsm-cc/mhp stream information (TS, PES,
+	  SECTION) (e.g. digital television) send via satellite, cable or
+	  terrestrial.
+
+	  http://dvbsnoop.sourceforge.net/
diff --git a/package/multimedia/dvbsnoop/dvbsnoop.mk b/package/multimedia/dvbsnoop/dvbsnoop.mk
new file mode 100644
index 0000000..a3ff468
--- /dev/null
+++ b/package/multimedia/dvbsnoop/dvbsnoop.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# dvbsnoop
+#
+#############################################################
+
+DVBSNOOP_VERSION        = 1.4.50
+DVBSNOOP_SITE           = http://downloads.sourceforge.net/project/dvbsnoop/dvbsnoop/dvbsnoop-$(DVBSNOOP_VERSION)
+DVBSNOOP_SITE_METHOD    = gz
+DVBSNOOP_LICENSE        = GPLv2
+DVBSNOOP_LICENSE_FILE   = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4
