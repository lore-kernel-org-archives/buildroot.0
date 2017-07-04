From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Tue,  4 Jul 2017 11:40:40 +0200
Subject: [Buildroot] [PATCH 3/3] spidev-test: s/BR2_DL_DIR/DL_DIR/
In-Reply-To: <20170704094040.19767-1-maxime.hadjinlian@gmail.com>
References: <20170704094040.19767-1-maxime.hadjinlian@gmail.com>
Message-ID: <20170704094040.19767-3-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_DL_DIR is not to be used by the package's Makefile.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/spidev_test/spidev_test.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index 1f34c6afd..1d657803b 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -32,7 +32,7 @@ endef
 SPIDEV_TEST_POST_PATCH_HOOKS += SPIDEV_ADD_LINUX_IOCTL
 
 define SPIDEV_TEST_EXTRACT_CMDS
-	cp $(BR2_DL_DIR)/$(SPIDEV_TEST_SOURCE) $(@D)/spidev_test.c
+	cp $(DL_DIR)/$(SPIDEV_TEST_SOURCE) $(@D)/spidev_test.c
 endef
 
 define SPIDEV_TEST_BUILD_CMDS
-- 
2.11.0
