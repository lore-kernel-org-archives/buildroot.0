From: Baruch Siach <baruch@tkos.co.il>
Date: Thu,  6 Jul 2017 07:28:00 +0300
Subject: [Buildroot] [PATCH] toolchain-external: drop reference to
	non-existing variable
Message-ID: <e2b199b7fd2f97c0689cf643ba191cd013ae8f35.1499315280.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 32bec8ee2fb0 (toolchain-external: copy ld*.so* for all C libraries)
removed the definition of TOOLCHAIN_EXTERNAL_MUSL_LD_LINK. Remove also the
reference to it.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
This addresses my comment on the patch.
http://lists.busybox.net/pipermail/buildroot/2017-July/195993.html
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 33449d37a5ec..1c5a5790f0e1 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -561,10 +561,6 @@ define $(2)_INSTALL_STAGING_CMDS
 	$$(TOOLCHAIN_EXTERNAL_INSTALL_GDBINIT)
 endef
 
-ifeq ($$(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
-$(2)_POST_INSTALL_STAGING_HOOKS += TOOLCHAIN_EXTERNAL_MUSL_LD_LINK
-endif
-
 # Even though we're installing things in both the staging, the host
 # and the target directory, we do everything within the
 # install-staging step, arbitrarily.
-- 
2.13.2
