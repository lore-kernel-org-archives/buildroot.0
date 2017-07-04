From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 17:19:24 +0200
Subject: [Buildroot] [git commit] spidev-test: s/BR2_DL_DIR/DL_DIR/
Message-ID: <20170704151621.EB40F81D56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c18b5c378947cb61206ddc841546e1309884bba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_DL_DIR is not to be used by the package's Makefile.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/spidev_test/spidev_test.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
index 1f34c6a..1d65780 100644
--- a/package/spidev_test/spidev_test.mk
+++ b/package/spidev_test/spidev_test.mk
@@ -32,7 +32,7 @@ endef
 SPIDEV_TEST_POST_PATCH_HOOKS += SPIDEV_ADD_LINUX_IOCTL
 
 define SPIDEV_TEST_EXTRACT_CMDS
-	cp $(BR2_DL_DIR)/$(SPIDEV_TEST_SOURCE) $(@D)/spidev_test.c
+	cp $(DL_DIR)/$(SPIDEV_TEST_SOURCE) $(@D)/spidev_test.c
 endef
 
 define SPIDEV_TEST_BUILD_CMDS
