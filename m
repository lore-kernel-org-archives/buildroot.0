From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 20:18:08 +0100
Subject: [Buildroot] [git commit] uclibc: Get rid of stale
 UCLIBC_INSTALL_LDSO_SYMLINKS
Message-ID: <20181118191609.F1EB183934@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=89fcb4cdb4bd4b70819329d21d5dd967ce810483
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

UCLIBC_INSTALL_LDSO_SYMLINKS is not defined anywhere to nuke it.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uclibc/uclibc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 63d36943ed..27e4d5873a 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -425,7 +425,6 @@ define UCLIBC_INSTALL_TARGET_CMDS
 		RUNTIME_PREFIX=/ \
 		install_runtime
 	$(UCLIBC_INSTALL_UTILS_TARGET)
-	$(UCLIBC_INSTALL_LDSO_SYMLINKS)
 endef
 
 # STATIC has no ld* tools, only getconf
