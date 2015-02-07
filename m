From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 7 Feb 2015 21:14:15 +0100
Subject: [Buildroot] [git commit] oprofile: add missing indirect dependency
	on NPTL for PPC
Message-ID: <20150207202910.5DDAC8046C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bacdf4c8e9fc4003cfab052c5cab3e498c3ed85f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: also adjust comment dependencies]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/oprofile/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index 3ea07d9..9cf5693 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -9,7 +9,7 @@ config BR2_PACKAGE_OPROFILE
 	depends on BR2_USE_WCHAR # binutils
 	depends on !BR2_xtensa
 	# libpfm4 is needed on PowerPC, and requires thread support
-	depends on BR2_TOOLCHAIN_HAS_THREADS || !BR2_powerpc
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_powerpc
 	help
 	  OProfile is a system-wide profiler for Linux systems,
 	  capable of profiling all running code at low overhead.
@@ -31,6 +31,6 @@ comment "oprofile needs a toolchain w/ C++, wchar"
 	depends on !BR2_aarch64 && !BR2_nios2 && !BR2_xtensa
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
-comment "oprofile needs a toolchain w/ threads on PPC"
+comment "oprofile needs a toolchain w/ NPTL on PPC"
 	depends on BR2_USE_MMU && BR2_powerpc
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
