From: Clayton Shotwell <clshotwe@rockwellcollins.com>
Date: Thu, 12 Dec 2013 12:27:18 -0600
Subject: [Buildroot] [ PATCH v4 18/20] busybox: ensure it finds pkg-config
	by setting PATH
In-Reply-To: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
References: <1386872840-22051-1-git-send-email-clshotwe@rockwellcollins.com>
Message-ID: <1386872840-22051-19-git-send-email-clshotwe@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Clayton Shotwell <clshotwe@rockwellcollins.com>
---
 package/busybox/busybox.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 24f0695..1a40b43 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -38,6 +38,7 @@ BUSYBOX_MAKE_ENV = \
 	CFLAGS="$(BUSYBOX_CFLAGS)" \
 	CFLAGS_busybox="$(BUSYBOX_CFLAGS_busybox)"
 BUSYBOX_MAKE_OPTS = \
+	PATH="$(TARGET_PATH)" \
 	CC="$(TARGET_CC)" \
 	ARCH=$(KERNEL_ARCH) \
 	PREFIX="$(TARGET_DIR)" \
-- 
1.7.1
