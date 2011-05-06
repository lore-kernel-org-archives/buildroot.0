From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 6 May 2011 14:26:36 +0200
Subject: [Buildroot] [git commit] sh: Only use the CodeSourcery toolchain
	for SH4A devices
Message-ID: <20110506122735.77B1482DF8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e46ba3c65bb76de30e6534a5552db7562c354d3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CodeSourcery toolchain listed is only for SH4A devices.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.7.3.4
