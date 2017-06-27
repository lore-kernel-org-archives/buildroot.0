From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 27 Jun 2017 20:57:16 +0300
Subject: [Buildroot] [PATCH 2/2] toolchain-external: remove redundant
	condition
In-Reply-To: <3d0e4832c2a187a5bd63ac094c11e2b237661cd5.1498586236.git.baruch@tkos.co.il>
References: <3d0e4832c2a187a5bd63ac094c11e2b237661cd5.1498586236.git.baruch@tkos.co.il>
Message-ID: <c6c63dde7bd2a853d5ef41869f6bc3266db0c05a.1498586236.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

TOOLCHAIN_EXTERNAL_MUSL_LD_LINK is empty when BR2_TOOLCHAIN_EXTERNAL_MUSL is
not set. No need to add another condition.

Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 8460e37d095f..2c87a367e67b 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -587,9 +587,7 @@ define $(2)_INSTALL_STAGING_CMDS
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
 
-ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
 $(2)_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-endif
 
 # Even though we're installing things in both the staging, the host
 # and the target directory, we do everything within the
-- 
2.11.0
