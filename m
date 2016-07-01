From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 23:37:49 +0200
Subject: [Buildroot] [git commit] python-scapy3k: new package
Message-ID: <20160701214304.34DAD817BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36c0d4d8e0ac67ad4fa17c50bb6bc4ee801428ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/python-scapy3k/Config.in           |  9 +++++++++
 package/python-scapy3k/python-scapy3k.hash |  2 ++
 package/python-scapy3k/python-scapy3k.mk   | 12 ++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a6cc258..5779d04 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -756,6 +756,7 @@ menu "External python modules"
 	source "package/python-requests/Config.in"
 	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rtslib-fb/Config.in"
+	source "package/python-scapy3k/Config.in"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-service-identity/Config.in"
diff --git a/package/python-scapy3k/Config.in b/package/python-scapy3k/Config.in
new file mode 100644
index 0000000..3e75fcd
--- /dev/null
+++ b/package/python-scapy3k/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_SCAPY3K
+	bool "python-scapy3k"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB
+	help
+	  Network packet and pcap file crafting/sniffing/manipulation
+	  security tool (based on scapy) with python3 compatibility.
+
+	  https://github.com/phaethon/scapy
diff --git a/package/python-scapy3k/python-scapy3k.hash b/package/python-scapy3k/python-scapy3k.hash
new file mode 100644
index 0000000..36d5dfe
--- /dev/null
+++ b/package/python-scapy3k/python-scapy3k.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256  a4c68ef2f787d82a3aec8640cac8dbab6f5b9e31ae4d89a1877efbb9150a9e25  python-scapy3k-v0.18.tar.gz
diff --git a/package/python-scapy3k/python-scapy3k.mk b/package/python-scapy3k/python-scapy3k.mk
new file mode 100644
index 0000000..661cb9d
--- /dev/null
+++ b/package/python-scapy3k/python-scapy3k.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# python-scapy3k
+#
+################################################################################
+
+PYTHON_SCAPY3K_VERSION = v0.18
+PYTHON_SCAPY3K_SITE = $(call github,phaethon,scapy,$(PYTHON_SCAPY3K_VERSION))
+PYTHON_SCAPY3K_SETUP_TYPE = distutils
+PYTHON_SCAPY3K_LICENSE = GPLv2+
+
+$(eval $(python-package))
