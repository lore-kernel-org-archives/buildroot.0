From: Marcin Bis <marcin@bis.org.pl>
Date: Wed, 26 Dec 2012 07:44:32 +0100
Subject: [Buildroot] [PATCH] usbip: new package
Message-ID: <CAOPBCFULJTm7iooZ8=nnpMoooaRq=1PK11hhYyyGVr=DdM2e2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

The following patch adds new package: usbip (tools for sharing USB
devices over network).
I have tested it under various ARM builds.

Please consider adding it to Buildroot.

Signed-off-by: Marcin Bis <marcin@bis.org.pl>
--
 package/Config.in       |    1 +
 package/usbip/Config.in |   13 +++++++++++++
 package/usbip/usbip.mk  |   15 +++++++++++++++
 3 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 3d556b2..c773c46 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -684,6 +684,7 @@ source "package/transmission/Config.in"
 source "package/ttcp/Config.in"
 source "package/udpcast/Config.in"
 source "package/ulogd/Config.in"
+source "package/usbip/Config.in"
 source "package/ushare/Config.in"
 source "package/vde2/Config.in"
 source "package/vpnc/Config.in"
diff --git a/package/usbip/Config.in b/package/usbip/Config.in
new file mode 100644
index 0000000..3cdbbc7
--- /dev/null
+++ b/package/usbip/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_USBIP
+	bool "usbip"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBSYSFS
+	help
+	  Userspace tools for sharing USB devices over TCP/IP network.
+
+	  http://usbip.sourceforge.net/
+
+	  This package adds both: client and server support.
+	  Note: For exporting or connecting to exported USB devices
+	  additional kernel drivers are needed (available since 2.6.28
+	  under Stagging).
diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
new file mode 100644
index 0000000..2ec3ce9
--- /dev/null
+++ b/package/usbip/usbip.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# usbip
+#
+#############################################################
+
+USBIP_VERSION = 0.1.7
+USBIP_SITE = http://downloads.sourceforge.net/project/usbip/usbip/$(USBIP_VERSION)
+USBIP_LICENSE = GPLv2+
+USBIP_LICENSE_FILES = COPYING
+USBIP_CONF_OPT = --without-tcpwrappers
+USBIP_SUBDIR = src
+USBIP_AUTORECONF = YES
+
+$(eval $(autotools-package))
