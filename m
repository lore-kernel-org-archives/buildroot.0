From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 24 Dec 2018 18:12:35 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/brcm-patchram-plus: Add new
 package
Message-ID: <20181224161235.1747-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add tool which allows to setup broadcom bluetooth
device via UART.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---

v3:
    1) Specify src/main.c as license file [Yann E. Morin]

v2:
    1) Add link to the github in Config.in help section [Yann E. Morin]
    2) Use autoreconf instaed of direct call to autogen.sh [Yann E. Morin]

 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/brcm-patchram-plus/Config.in               |  7 +++++++
 package/brcm-patchram-plus/brcm-patchram-plus.hash |  2 ++
 package/brcm-patchram-plus/brcm-patchram-plus.mk   | 12 ++++++++++++
 5 files changed, 25 insertions(+)
 create mode 100644 package/brcm-patchram-plus/Config.in
 create mode 100644 package/brcm-patchram-plus/brcm-patchram-plus.hash
 create mode 100644 package/brcm-patchram-plus/brcm-patchram-plus.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d58ea9014..03727e8fa4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2141,6 +2141,9 @@ N:	Tzu-Jung Lee <roylee17@gmail.com>
 F:	package/dropwatch/
 F:	package/tstools/
 
+N:	Vadim Kochan <vadim4j@gmail.com>
+F:	package/brcm-patchram-plus/
+
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
 F:	package/clinfo/
diff --git a/package/Config.in b/package/Config.in
index c3e069134e..72a52a0682 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1819,6 +1819,7 @@ menu "Networking applications"
 	source "package/bmon/Config.in"
 	source "package/boa/Config.in"
 	source "package/boinc/Config.in"
+	source "package/brcm-patchram-plus/Config.in"
 	source "package/bridge-utils/Config.in"
 	source "package/bwm-ng/Config.in"
 	source "package/c-icap/Config.in"
diff --git a/package/brcm-patchram-plus/Config.in b/package/brcm-patchram-plus/Config.in
new file mode 100644
index 0000000000..2742016eb7
--- /dev/null
+++ b/package/brcm-patchram-plus/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BRCM_PATCHRAM_PLUS
+	bool "brcm-patchram-plus"
+	help
+	  Broadcom utility to flash Bluetooth firmwares, extended with
+	  per-device Low Power Mode configuration.
+
+	  https://github.com/AsteroidOS/brcm-patchram-plus
diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.hash b/package/brcm-patchram-plus/brcm-patchram-plus.hash
new file mode 100644
index 0000000000..59263f23d4
--- /dev/null
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256  7d63f3a0c79cb5d187a0f2647734601f9c97d4eb8e545ce9ace7653c1f3f9a58  brcm-patchram-plus-94fb127e614b19a9a95561b8c1a0716e2e1e6293.tar.gz
diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.mk b/package/brcm-patchram-plus/brcm-patchram-plus.mk
new file mode 100644
index 0000000000..9f2f8d33ea
--- /dev/null
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# brcm-patchram-plus
+#
+################################################################################
+
+BRCM_PATCHRAM_PLUS_VERSION = 94fb127e614b19a9a95561b8c1a0716e2e1e6293
+BRCM_PATCHRAM_PLUS_SITE = $(call github,AsteroidOS,brcm-patchram-plus,$(BRCM_PATCHRAM_PLUS_VERSION))
+BRCM_PATCHRAM_PLUS_LICENSE = src/main.c
+BRCM_PATCHRAM_PLUS_AUTORECONF = YES
+
+$(eval $(autotools-package))
-- 
2.14.1
