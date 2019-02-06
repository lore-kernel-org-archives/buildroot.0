From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 15:57:09 +0100
Subject: [Buildroot] [git commit] package/brcm-patchram-plus: new package
Message-ID: <20190206145549.34CED81300@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=98831985440d08436529cd743a257d08dc2004b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add tool which allows to setup broadcom bluetooth
device via UART.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas: add hash for license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  3 +++
 package/Config.in                                  |  1 +
 package/brcm-patchram-plus/Config.in               |  7 +++++++
 package/brcm-patchram-plus/brcm-patchram-plus.hash |  3 +++
 package/brcm-patchram-plus/brcm-patchram-plus.mk   | 13 +++++++++++++
 5 files changed, 27 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e0340e851d..56d6e939c0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2149,6 +2149,9 @@ N:	Tzu-Jung Lee <roylee17@gmail.com>
 F:	package/dropwatch/
 F:	package/tstools/
 
+N:	Vadim Kochan <vadim4j@gmail.com>
+F:	package/brcm-patchram-plus/
+
 N:	Valentin Korenblit <valentinkorenblit@gmail.com>
 F:	package/clang/
 F:	package/clinfo/
diff --git a/package/Config.in b/package/Config.in
index 9d023b94fe..cc232b9fba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1821,6 +1821,7 @@ menu "Networking applications"
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
index 0000000000..fb7a91f114
--- /dev/null
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  7d63f3a0c79cb5d187a0f2647734601f9c97d4eb8e545ce9ace7653c1f3f9a58  brcm-patchram-plus-94fb127e614b19a9a95561b8c1a0716e2e1e6293.tar.gz
+sha256  3bbeac0dc9f456695e692687c9d90a3c4ffc0253b0476d487d8cede207a8dc5b  src/main.c
diff --git a/package/brcm-patchram-plus/brcm-patchram-plus.mk b/package/brcm-patchram-plus/brcm-patchram-plus.mk
new file mode 100644
index 0000000000..511ec991bc
--- /dev/null
+++ b/package/brcm-patchram-plus/brcm-patchram-plus.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# brcm-patchram-plus
+#
+################################################################################
+
+BRCM_PATCHRAM_PLUS_VERSION = 94fb127e614b19a9a95561b8c1a0716e2e1e6293
+BRCM_PATCHRAM_PLUS_SITE = $(call github,AsteroidOS,brcm-patchram-plus,$(BRCM_PATCHRAM_PLUS_VERSION))
+BRCM_PATCHRAM_PLUS_LICENSE = Apache-2.0
+BRCM_PATCHRAM_PLUS_LICENSE_FILES = src/main.c
+BRCM_PATCHRAM_PLUS_AUTORECONF = YES
+
+$(eval $(autotools-package))
