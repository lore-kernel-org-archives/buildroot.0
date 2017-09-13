From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 13 Sep 2017 22:17:55 +0200
Subject: [Buildroot] [PATCH] package/lmv2: add missing host-pkgconf
	dependency
Message-ID: <20170913201755.9871-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

configure.ac use PKG_CHECK_MODULES macro to find some libraries dependencies.
So add host-pkgconf in LVM2_DEPENDENCIES.

Fixes:
checking pkg-config is at least version 0.9.0... ./configure: line 9875: [...]/host/bin/pkg-config: No such file or directory

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/lvm2/lvm2.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 63ac109..f7f7069 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -21,6 +21,8 @@ LVM2_CONF_OPTS += \
 	--enable-dmeventd \
 	--disable-nls
 
+LVM2_DEPENDENCIES += host-pkgconf
+
 # LVM2 uses autoconf, but not automake, and the build system does not
 # take into account the toolchain passed at configure time.
 LVM2_MAKE_ENV = $(TARGET_CONFIGURE_OPTS)
-- 
2.9.5
