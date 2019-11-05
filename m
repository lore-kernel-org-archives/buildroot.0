From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Nov 2019 20:47:41 +0100
Subject: [Buildroot] [git commit] package/linux-serial-test: new package
Message-ID: <20191105194638.694BF8E822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=91aaa934368a3e05a3fb10dbf5f3f10740798b40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[yann.morin.1998 at free.fr: add hash for license file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                       |  1 +
 package/Config.in                                |  1 +
 package/linux-serial-test/Config.in              |  6 ++++++
 package/linux-serial-test/linux-serial-test.hash |  3 +++
 package/linux-serial-test/linux-serial-test.mk   | 12 ++++++++++++
 5 files changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 24c57b25f7..33273ce6c8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2504,6 +2504,7 @@ F:	package/libsocketcan/
 F:	package/libubox/
 F:	package/libuci/
 F:	package/linux-firmware/
+F:	package/linux-serial-test/
 F:	package/modem-manager/
 F:	package/nftables/
 F:	package/nuttcp/
diff --git a/package/Config.in b/package/Config.in
index 1ad1d49a8a..f72c77b416 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -470,6 +470,7 @@ endmenu
 	source "package/libubootenv/Config.in"
 	source "package/libuio/Config.in"
 	source "package/linux-backports/Config.in"
+	source "package/linux-serial-test/Config.in"
 	source "package/linuxconsoletools/Config.in"
 	source "package/lirc-tools/Config.in"
 	source "package/lm-sensors/Config.in"
diff --git a/package/linux-serial-test/Config.in b/package/linux-serial-test/Config.in
new file mode 100644
index 0000000000..9ba4badc92
--- /dev/null
+++ b/package/linux-serial-test/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LINUX_SERIAL_TEST
+	bool "linux-serial-test"
+	help
+	  Serial port test utility.
+
+	  https://github.com/cbrake/linux-serial-test
diff --git a/package/linux-serial-test/linux-serial-test.hash b/package/linux-serial-test/linux-serial-test.hash
new file mode 100644
index 0000000000..64340d3e52
--- /dev/null
+++ b/package/linux-serial-test/linux-serial-test.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  d04f4420abfeda5ee62662e790ea6ae5ddc2e758870e04ab76fa35d6de9cdce0  linux-serial-test-9965dad53ba63eea0eea05a0f9d5cb851425fcba.tar.gz
+sha256  a2a6760c2c6fa779a635e4a7ad00f668862ebcadb2a8a57d16662543e103e08c  LICENSES/MIT
diff --git a/package/linux-serial-test/linux-serial-test.mk b/package/linux-serial-test/linux-serial-test.mk
new file mode 100644
index 0000000000..e10a45ce90
--- /dev/null
+++ b/package/linux-serial-test/linux-serial-test.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# linux-serial-test
+#
+################################################################################
+
+LINUX_SERIAL_TEST_VERSION = 9965dad53ba63eea0eea05a0f9d5cb851425fcba
+LINUX_SERIAL_TEST_SITE = $(call github,cbrake,linux-serial-test,$(LINUX_SERIAL_TEST_VERSION))
+LINUX_SERIAL_TEST_LICENSE = MIT
+LINUX_SERIAL_TEST_LICENSE_FILES = LICENSES/MIT
+
+$(eval $(cmake-package))
