From: Alexey Brodkin <alexey.brodkin@synopsys.com>
Date: Wed, 14 Nov 2018 19:30:29 +0300
Subject: [Buildroot] [PATCH] uclibc: Get rid of stale
 UCLIBC_INSTALL_LDSO_SYMLINKS
Message-ID: <20181114163029.33006-1-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

UCLIBC_INSTALL_LDSO_SYMLINKS is not defined anywhere to nuke it.

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
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
-- 
2.16.2
