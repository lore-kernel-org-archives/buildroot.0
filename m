From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Dec 2020 22:56:11 +0100
Subject: [Buildroot] [git commit] toolchain: update option descriptions for
 ARC tools arc-2020.09-release
Message-ID: <20201201214730.C678182858@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0b4c7ba01cfe4ec3ea417e6f6b1eacad233e19e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.buildroot.net/buildroot/commit/?id=0791abfba0227803b19895ea22326f4e17ac93dc

bumped
* Binutils 2.34.50 with additional ARC patches
* GCC 10.0.2 with additional ARC patches
* GDB 10.0.50 with additional ARC patches

but forgot to update the version numbers stored in option descriptions.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/Config.in.host | 2 +-
 package/gcc/Config.in.host      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index b690b952dc..89c6894a1f 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -39,7 +39,7 @@ config BR2_BINUTILS_VERSION_2_35_X
 	depends on !BR2_BINFMT_FLAT
 
 config BR2_BINUTILS_VERSION_ARC
-	bool "binutils arc (2.31)"
+	bool "binutils arc (2.34.50)"
 	depends on BR2_arc
 
 config BR2_BINUTILS_VERSION_CSKY
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 10688ff568..2ed159314c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -9,7 +9,7 @@ choice
 	  Select the version of gcc you wish to use.
 
 config BR2_GCC_VERSION_ARC
-	bool "gcc arc (9.x)"
+	bool "gcc arc (10.x)"
 	# Only supported architecture
 	depends on BR2_arc
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
