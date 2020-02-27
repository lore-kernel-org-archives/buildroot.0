From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 27 Feb 2020 17:08:15 -0300
Subject: [Buildroot] [PATCH v2 4/4] package/busybox.mk: document the use of
 variables in openrc.mk
In-Reply-To: <20200227200815.26613-1-unixmania@gmail.com>
References: <20200227200815.26613-1-unixmania@gmail.com>
Message-ID: <20200227200815.26613-5-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Prevent filures if the variables are removed or renamed in the future.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/busybox/busybox.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9eeb784d2a..241a488e45 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -80,7 +80,9 @@ BUSYBOX_CFLAGS += "`$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
 BUSYBOX_CFLAGS_busybox += "`$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`"
 endif
 
+# Warning: this is also used in package/openrc/openrc.mk.
 BUSYBOX_BUILD_CONFIG = $(BUSYBOX_DIR)/.config
+
 # Allows the build system to tweak CFLAGS
 BUSYBOX_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
@@ -105,8 +107,10 @@ ifndef BUSYBOX_CONFIG_FILE
 BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 endif
 
+# Warning: these two are also used in package/openrc/openrc.mk.
 BUSYBOX_KCONFIG_FILE = $(BUSYBOX_CONFIG_FILE)
 BUSYBOX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG_FRAGMENT_FILES))
+
 BUSYBOX_KCONFIG_EDITORS = menuconfig xconfig gconfig
 BUSYBOX_KCONFIG_OPTS = $(BUSYBOX_MAKE_OPTS)
 
-- 
2.18.2
