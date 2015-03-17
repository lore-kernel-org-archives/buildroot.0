From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 19:44:16 -0300
Subject: [Buildroot] [PATCH 1/4] binutils: remove blackfin conditionals
Message-ID: <1426632259-1972-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we don't support the internal blackfin toolchain any more
remove unnecessary conditionals.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/binutils/Config.in.host | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

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
-- 
2.0.5
