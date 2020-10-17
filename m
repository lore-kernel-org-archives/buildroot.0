From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 18 Oct 2020 00:17:42 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/busybox: explicitly state
 binutil paths
In-Reply-To: <20201017221743.160029-1-nolange79@gmail.com>
References: <20201017221743.160029-1-nolange79@gmail.com>
Message-ID: <20201017221743.160029-3-nolange79@gmail.com>
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
index 01f7331221..221b8adf59 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -94,6 +94,9 @@ BUSYBOX_MAKE_ENV += \
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
