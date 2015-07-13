From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 17:13:15 +0200
Subject: [Buildroot] [git commit] toolchain/helpers.mk: use --chmod on rsync
Message-ID: <20150713151902.5C3898194A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=40b28322b378da087a795e4e544d8700001d28ea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This makes sure we don't have any weird permissions on the staging dir,
which could affect the target.

Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 0dc1864..895f3f1 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -139,7 +139,7 @@ copy_toolchain_sysroot = \
 	SUPPORT_LIB_DIR="$(strip $5)" ; \
 	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
 		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
-			rsync -au --chmod=Du+w --exclude 'usr/lib/locale' \
+			rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
 				--exclude lib --exclude lib32 --exclude lib64 \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
