From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2011 21:22:19 +0200
Subject: [Buildroot] [git commit] external toolchains: fix SuperH toolchain
	configuration
Message-ID: <20110804192913.C2B708B73C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d63a817f55a8591893431257657da44bb6c1103b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The CodeSourcery toolchain for SH2-A platforms provide largefile
support, inet RPC, wide char and threads, so adjust the configuration
accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index bedbb53..0253d83 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -156,6 +156,10 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	bool "CodeSoucery SH 2010.09"
 	depends on BR2_sh2a
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
+	select BR2_LARGEFILE
+	select BR2_INET_RPC
+	select BR2_USE_WCHAR
+	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_INSTALL_LIBSTDCPP
 	help
 	  Toolchain for the SuperH architecture, from CodeSourcery. It
-- 
1.7.3.4
