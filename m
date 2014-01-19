From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 19 Jan 2014 22:04:02 +0100
Subject: [Buildroot] [PATCH v3 06/12] libshairplay: new package
In-Reply-To: <1390165448-9130-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1390165448-9130-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1390165448-9130-7-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libshairplay is a client library that emulates an airplay server
This package was originally found at : https://github.com/huceke/buildroot-rbp
By gimli <ebsi4711@gmail.com>

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: gimli <ebsi4711@gmail.com>
---
Changes v2 -> v3:
  - Fix dependencies (Yann E. Morin)
  - Fix licenses (Yann E. Morin)
Changes v1 -> v2:
  - Fix header (Yann E. Morin)
  - Fix comment on toolchain option (Peter Korsgaard)
---
 package/Config.in                    |  1 +
 package/libshairplay/Config.in       | 11 +++++++++++
 package/libshairplay/libshairplay.mk | 15 +++++++++++++++
 3 files changed, 27 insertions(+)
 create mode 100644 package/libshairplay/Config.in
 create mode 100644 package/libshairplay/libshairplay.mk

diff --git a/package/Config.in b/package/Config.in
index 3a867b0..d400ea2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -680,6 +680,7 @@ source "package/liboping/Config.in"
 source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
 source "package/librsync/Config.in"
+source "package/libshairplay/Config.in"
 source "package/libsoup/Config.in"
 source "package/libtirpc/Config.in"
 source "package/libtorrent/Config.in"
diff --git a/package/libshairplay/Config.in b/package/libshairplay/Config.in
new file mode 100644
index 0000000..9fad7b4
--- /dev/null
+++ b/package/libshairplay/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBSHAIRPLAY
+  bool "libshairplay"
+  depends on BR2_INET_IPV6
+  help
+    libshairplay is a client library that emulates an airplay
+    server
+
+    https://github.com/juhovh/shairplay
+
+comment "libshairplay needs a toolchain w/ IPv6"
+	depends on !BR2_INET_IPV6
diff --git a/package/libshairplay/libshairplay.mk b/package/libshairplay/libshairplay.mk
new file mode 100644
index 0000000..c40a1b5
--- /dev/null
+++ b/package/libshairplay/libshairplay.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libshairplay
+#
+################################################################################
+
+LIBSHAIRPLAY_VERSION = 139d5ef55564514c31f02dd82cef91236c9ff523
+LIBSHAIRPLAY_SITE = $(call github,juhovh,shairplay,$(LIBSHAIRPLAY_VERSION))
+LIBSHAIRPLAY_INSTALL_STAGING = YES
+LIBSHAIRPLAY_INSTALL_TARGET = YES
+LIBSHAIRPLAY_AUTORECONF = YES
+LIBSHAIRPLAY_LICENSE = MIT, BSD-3c, LGPLv2.1+
+LIBSHAIRPLAY_LICENSE_FILES = LICENSE
+
+$(eval $(autotools-package))
-- 
1.8.5.2
