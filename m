From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Jul 2017 11:45:00 +0200
Subject: [Buildroot] [git commit] toolchain-external: drop reference to
	non-existing variable
Message-ID: <20170706094145.B91AA807BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0efb7785eab110dc8860c271c361fdf67d3d1fb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 32bec8ee2fb0 (toolchain-external: copy ld*.so* for all C libraries)
removed the definition of TOOLCHAIN_EXTERNAL_MUSL_LD_LINK. Remove also the
reference to it.

Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/pkg-toolchain-external.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 33449d3..1c5a579 100644
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
