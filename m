From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 23:42:57 +0200
Subject: [Buildroot] [PATCH 1/1] cifs-utils: new package
In-Reply-To: <cover.1316468572.git.thomas.petazzoni@free-electrons.com>
References: <cover.1316468572.git.thomas.petazzoni@free-electrons.com>
Message-ID: <515aeaac2f96b302ad89abf28796ab86f1b940d7.1316468572.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/cifs-utils/Config.in     |   13 +++++++++++++
 package/cifs-utils/cifs-utils.mk |    5 +++++
 3 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 package/cifs-utils/Config.in
 create mode 100644 package/cifs-utils/cifs-utils.mk

diff --git a/package/Config.in b/package/Config.in
index 451b271..b480483 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -398,6 +398,7 @@ source "package/bridge-utils/Config.in"
 source "package/bwm-ng/Config.in"
 source "package/can-utils/Config.in"
 source "package/ctorrent/Config.in"
+source "package/cifs-utils/Config.in"
 source "package/cups/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
diff --git a/package/cifs-utils/Config.in b/package/cifs-utils/Config.in
new file mode 100644
index 0000000..861aaeb
--- /dev/null
+++ b/package/cifs-utils/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_CIFS_UTILS
+        bool "cifs-utils"
+	help
+	  The in-kernel CIFS filesystem is generally the preferred
+	  method for mounting SMB/CIFS shares on Linux. The in-kernel
+	  CIFS filesystem relies on a set of user-space tools. That
+	  package of tools is called cifs-utils. Although not really
+	  part of Samba proper, these tools were originally part of
+	  the Samba package. For several reasons, shipping these tools
+	  as part of Samba was problematic and it was deemed better to
+	  split them off into their own package.
+
+	  http://wiki.samba.org/index.php/LinuxCIFS_utils
\ No newline at end of file
diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
new file mode 100644
index 0000000..70c9796
--- /dev/null
+++ b/package/cifs-utils/cifs-utils.mk
@@ -0,0 +1,5 @@
+CIFS_UTILS_VERSION = 5.0
+CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
+CIFS_UTILS_SITE    = ftp://ftp.samba.org/pub/linux-cifs/cifs-utils/
+
+$(eval $(call AUTOTARGETS,package,cifs-utils))
\ No newline at end of file
-- 
1.7.4.1
