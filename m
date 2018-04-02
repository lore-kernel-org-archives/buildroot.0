From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 20:50:54 +0200
Subject: [Buildroot] [git commit] ti-cgt-pru: use HOST_TI_CGT_PRU_DL_DIR
 instead of TI_CGT_PRU_DL_DIR
Message-ID: <20180402185204.C23D68144C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e5874e47c6169b9e037232209d5c71d5b47449f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The infrastructure only provides HOST_TI_CGT_PRU_DL_DIR, because this
package is host only. Ideally the infra should provide TI_CGT_PRU_DL_DIR,
but it doesn't currently, and that requires more significant changes.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ti-cgt-pru/ti-cgt-pru.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ti-cgt-pru/ti-cgt-pru.mk b/package/ti-cgt-pru/ti-cgt-pru.mk
index df3b97bef5..3665d2cec8 100644
--- a/package/ti-cgt-pru/ti-cgt-pru.mk
+++ b/package/ti-cgt-pru/ti-cgt-pru.mk
@@ -13,8 +13,8 @@ TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.2.x_manifest.html \
 	pru_rts_2_2_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx
 
 define HOST_TI_CGT_PRU_EXTRACT_CMDS
-	chmod +x $(TI_CGT_PRU_DL_DIR)/$(TI_CGT_PRU_SOURCE)
-	$(TI_CGT_PRU_DL_DIR)/$(TI_CGT_PRU_SOURCE) --prefix $(@D) --mode unattended
+	chmod +x $(HOST_TI_CGT_PRU_DL_DIR)/$(TI_CGT_PRU_SOURCE)
+	$(HOST_TI_CGT_PRU_DL_DIR)/$(TI_CGT_PRU_SOURCE) --prefix $(@D) --mode unattended
 	mv $(@D)/ti-cgt-pru_$(TI_CGT_PRU_VERSION)/* $(@D)
 	rmdir $(@D)/ti-cgt-pru_$(TI_CGT_PRU_VERSION)/
 endef
