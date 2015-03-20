From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 21:51:02 +0100
Subject: [Buildroot] [git commit] binutils: remove blackfin conditionals
Message-ID: <20150320211258.3818F81897@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f206d745a49d11cfd3e5b55e3c0e5d349fa5606a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we don't support the internal blackfin toolchain any more
remove unnecessary conditionals.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 4049cf6..ec1bd17 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -12,20 +12,16 @@ choice
 			   !BR2_powerpc64le && !BR2_nios2
 		bool "binutils 2.22"
 
-	# bfin disabled for newer binutils due to
-	# https://sourceware.org/bugzilla/show_bug.cgi?id=17334
 	config BR2_BINUTILS_VERSION_2_23_2
-		depends on !BR2_aarch64 && !BR2_bfin && !BR2_microblaze && \
+		depends on !BR2_aarch64 && !BR2_microblaze && \
 			   !BR2_powerpc64le && !BR2_nios2
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24
-		depends on !BR2_bfin
 		depends on !BR2_nios2 # supported, but broken on Nios-II
 		bool "binutils 2.24"
 
 	config BR2_BINUTILS_VERSION_2_25
-		depends on !BR2_bfin
 		bool "binutils 2.25"
 
 endchoice
