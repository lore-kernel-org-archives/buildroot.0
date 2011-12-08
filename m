From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 8 Dec 2011 23:35:37 +0100
Subject: [Buildroot] [git commit] binutils: don't default to 2.22
Message-ID: <20111208224035.6786B8F702@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7d7873df78c3f6745a188baf5d41abab7cfe3f23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Lots of packages are failing with binutils 2.22 with undefined symbols,
as it defaults to --no-copy-dt-needed-entries. Long term, the packages
should get fixed, but let's keep it at 2.21.1 for now.

For more details, see:
- http://wiki.debian.org/ToolChain/DSOLinking
- https://wiki.ubuntu.com/NattyNarwhal/ToolchainTransition

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/binutils/Config.in.host |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index f829549..aec51b3 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -3,7 +3,7 @@ comment "Binutils Options"
 choice
 	prompt "Binutils Version"
 	default BR2_BINUTILS_VERSION_2_21 if (BR2_mips || BR2_mipsel || BR2_sh)
-	default BR2_BINUTILS_VERSION_2_22 if (BR2_UCLIBC_VERSION_0_9_32 || BR2_UCLIBC_VERSION_SNAPSHOT)
+	default BR2_BINUTILS_VERSION_2_21_1 if (BR2_UCLIBC_VERSION_0_9_32 || BR2_UCLIBC_VERSION_SNAPSHOT)
 	default BR2_BINUTILS_VERSION_2_21
 	help
 	  Select the version of binutils you wish to use.
