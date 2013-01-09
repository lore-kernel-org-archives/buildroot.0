From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Wed,  9 Jan 2013 19:56:12 +0100
Subject: [Buildroot] [PATCH] dvbsnoop: new package dvbsnoop
In-Reply-To: <1357757772-10661-1-git-send-email-c.schoenert@gmail.com>
References: <201301091834.38893.yann.morin.1998@free.fr>
 <1357757772-10661-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1357757772-10661-2-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@t-online.de>

dvbsnoop is a DVB/MPEG stream analyzer. It's designed to debug, dump or
view the digital stream info available via

    satellite   -> DVB-S, DVB-S2
    cable       -> DVB-C, DVB-C2
    terrestrial -> DVB-T, DVB-T2

dvbsnoop can be used on any digital settopbox that running on linux and
provides the DVB APIv3. It's also usable on classical PCs that contains
a DVB hardware (PCI Card or USB Plug).

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
Changes for v2:
    - moved from 'Audio and video ...' to 'Hardware Handling' as 
      suggested by Yann
    - Removing from _SITE_METHOD from the Makefile

 package/Config.in            |    1 +
 package/dvbsnoop/Config.in   |    9 +++++++++
 package/dvbsnoop/dvbsnoop.mk |   12 ++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/dvbsnoop/Config.in
 create mode 100644 package/dvbsnoop/dvbsnoop.mk

diff --git a/package/Config.in b/package/Config.in
index bd1db6b..84a53a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -218,6 +218,7 @@ endif
 source "package/dmidecode/Config.in"
 source "package/dmraid/Config.in"
 source "package/dvb-apps/Config.in"
+source "package/dvbsnoop/Config.in"
 source "package/eeprog/Config.in"
 source "package/evtest/Config.in"
 source "package/flashrom/Config.in"
diff --git a/package/dvbsnoop/Config.in b/package/dvbsnoop/Config.in
new file mode 100644
index 0000000..afd0bc5
--- /dev/null
+++ b/package/dvbsnoop/Config.in
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
diff --git a/package/dvbsnoop/dvbsnoop.mk b/package/dvbsnoop/dvbsnoop.mk
new file mode 100644
index 0000000..e987dc6
--- /dev/null
+++ b/package/dvbsnoop/dvbsnoop.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# dvbsnoop
+#
+#############################################################
+
+DVBSNOOP_VERSION        = 1.4.50
+DVBSNOOP_SITE           = http://downloads.sourceforge.net/project/dvbsnoop/dvbsnoop/dvbsnoop-$(DVBSNOOP_VERSION)
+DVBSNOOP_LICENSE        = GPLv2
+DVBSNOOP_LICENSE_FILE   = COPYING
+
+$(eval $(autotools-package))
-- 
1.7.10.4
