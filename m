From: Phil Edworthy <PHIL.EDWORTHY@renesas.com>
Date: Fri, 06 May 2011 08:47:55 +0100
Subject: [Buildroot] [PATCH] sh: Only use the CodeSourcery toolchain for
	SH4A devices
Message-ID: <1304668075-13114-1-git-send-email-phil.edworthy@renesas.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The CodeSourcery toolchain listed is only for SH4A devices.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 toolchain/toolchain-external/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index ca9892b..c95945f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -88,7 +88,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	bool "CodeSoucery SH 2010.09"
-	depends on BR2_sh
+	depends on BR2_sh4 || BR2_sh4eb
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	help
-- 
1.7.1
