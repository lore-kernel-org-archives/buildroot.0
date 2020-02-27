From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 27 Feb 2020 09:39:38 -0300
Subject: [Buildroot] [PATCH 4/4] package/busybox: document the use of
 BUSYBOX_BUILD_CONFIG in openrc.mk
In-Reply-To: <20200227123938.13412-1-unixmania@gmail.com>
References: <20200227123938.13412-1-unixmania@gmail.com>
Message-ID: <20200227123938.13412-5-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Prevent filures if the variable is removed or renamed in the future.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/busybox/busybox.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 9eeb784d2a..a761ff569f 100644
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
-- 
2.18.2
