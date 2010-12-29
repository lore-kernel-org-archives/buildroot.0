From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 30 Dec 2010 00:01:01 +0100
Subject: [Buildroot] [git commit master 1/1] New package: sdparm
Message-ID: <20101230073531.77CA382826@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fe008aaf38f3ac2d8083ec88f68616c721cd5c53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add utility to accesses SCSI device parameters.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/sdparm/Config.in |    6 ++++++
 package/sdparm/sdparm.mk |    5 +++++
 3 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 package/sdparm/Config.in
 create mode 100644 package/sdparm/sdparm.mk

diff --git a/package/Config.in b/package/Config.in
index 27d8023..ec5d73e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -189,6 +189,7 @@ source "package/ntfs-3g/Config.in"
 source "package/ntfsprogs/Config.in"
 source "package/pciutils/Config.in"
 source "package/rng-tools/Config.in"
+source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 # busybox has fdisk
diff --git a/package/sdparm/Config.in b/package/sdparm/Config.in
new file mode 100644
index 0000000..cec0f84
--- /dev/null
+++ b/package/sdparm/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SDPARM
+	bool "sdparm"
+	help
+	  Utility to accesses SCSI device parameters.
+
+	  http://sg.danny.cz/sg/sdparm.html
diff --git a/package/sdparm/sdparm.mk b/package/sdparm/sdparm.mk
new file mode 100644
index 0000000..ecb30c5
--- /dev/null
+++ b/package/sdparm/sdparm.mk
@@ -0,0 +1,5 @@
+SDPARM_VERSION = 1.06
+SDPARM_SOURCE = sdparm-$(SDPARM_VERSION).tgz
+SDPARM_SITE = http://sg.danny.cz/sg/p/
+
+$(eval $(call AUTOTARGETS,package,sdparm))
-- 
1.7.2.2
