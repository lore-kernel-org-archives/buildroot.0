From: Norbert Lange <nolange79@gmail.com>
Date: Wed, 14 Oct 2020 21:40:01 +0200
Subject: [Buildroot] [PATCH 3/3] package/busybox: explicitly state binutil
 paths
In-Reply-To: <20201014194002.9753-1-nolange79@gmail.com>
References: <20201014194002.9753-1-nolange79@gmail.com>
Message-ID: <20201014194002.9753-3-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pass paths to ar, nm, ranlib binaries. This allows linker-plugins
to be used.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/busybox/busybox.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 7862beb790..ddac4070d6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -93,6 +93,9 @@ BUSYBOX_MAKE_ENV += \
 endif
 
 BUSYBOX_MAKE_OPTS = \
+	AR="$(TARGET_AR)" \
+	NM="$(TARGET_NM)" \
+	RANLIB="$(TARGET_RANLIB)" \
 	CC="$(TARGET_CC)" \
 	ARCH=$(KERNEL_ARCH) \
 	PREFIX="$(TARGET_DIR)" \
-- 
2.28.0
