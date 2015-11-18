From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Tue, 17 Nov 2015 21:15:41 -0300
Subject: [Buildroot] [PATCH] sbc: new package
Message-ID: <1447805741-9339-1-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/Config.in     |  1 +
 package/sbc/Config.in |  8 ++++++++
 package/sbc/sbc.hash  |  2 ++
 package/sbc/sbc.mk    | 15 +++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/sbc/Config.in
 create mode 100644 package/sbc/sbc.hash
 create mode 100644 package/sbc/sbc.mk

diff --git a/package/Config.in b/package/Config.in
index 7c10837..f9af31c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -732,6 +732,7 @@ menu "Audio/Sound"
 	source "package/opus/Config.in"
 	source "package/opusfile/Config.in"
 	source "package/portaudio/Config.in"
+	source "package/sbc/Config.in"
 	source "package/speex/Config.in"
 	source "package/taglib/Config.in"
 	source "package/tinyalsa/Config.in"
diff --git a/package/sbc/Config.in b/package/sbc/Config.in
new file mode 100644
index 0000000..f1dbc0e
--- /dev/null
+++ b/package/sbc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_SBC
+	bool "sbc"
+	select BR2_PACKAGE_LIBSNDFILE
+	help
+	  An audio codec to connect bluetooth high quality audio
+	  devices like headphones or loudspeakers.
+
+	  http://www.bluez.org/
diff --git a/package/sbc/sbc.hash b/package/sbc/sbc.hash
new file mode 100644
index 0000000..be3c8f7
--- /dev/null
+++ b/package/sbc/sbc.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc
+sha256	e61022cf576f14190241e7071753fdacdce5d1dea89ffd704110fc50be689309	sbc-1.3.tar.xz
diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
new file mode 100644
index 0000000..620c5bb
--- /dev/null
+++ b/package/sbc/sbc.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# sbc
+#
+################################################################################
+
+SBC_VERSION = 1.3
+SBC_SOURCE = sbc-$(SBC_VERSION).tar.xz
+SBC_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
+SBC_INSTALL_STAGING = YES
+SBC_DEPENDENCIES = libsndfile host-pkgconf
+SBC_LICENSE = GPLv2+ LGPLv2.1+
+SBC_LICENSE_FILES = COPYING COPYING.LIB
+
+$(eval $(autotools-package))
-- 
2.4.10
