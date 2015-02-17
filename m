From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 17 Feb 2015 13:26:54 -0300
Subject: [Buildroot] [PATCH 2/6] binutils: nios2: Prevent selecting
	unsupported versions
In-Reply-To: <1424190418-883-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1424190418-883-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1424190418-883-3-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Versions previous to binutils v2.25 do not support the Nios-II architecture,
so disable them.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/binutils/Config.in.host | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 504e9ca..d0ed84e 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -8,17 +8,20 @@ choice
 	  Select the version of binutils you wish to use.
 
 	config BR2_BINUTILS_VERSION_2_22
-		depends on !BR2_aarch64 && !BR2_microblaze && !BR2_powerpc64le
+		depends on !BR2_aarch64 && !BR2_microblaze && \
+			   !BR2_powerpc64le && !BR2_nios2
 		bool "binutils 2.22"
 
 	# bfin disabled for newer binutils due to
 	# https://sourceware.org/bugzilla/show_bug.cgi?id=17334
 	config BR2_BINUTILS_VERSION_2_23_2
-		depends on !BR2_aarch64 && !BR2_bfin && !BR2_microblaze && !BR2_powerpc64le
+		depends on !BR2_aarch64 && !BR2_bfin && !BR2_microblaze && \
+			   !BR2_powerpc64le && !BR2_nios2
 		bool "binutils 2.23.2"
 
 	config BR2_BINUTILS_VERSION_2_24
 		depends on !BR2_bfin
+		depends on !BR2_nios2 # supported, but broken on Nios-II
 		bool "binutils 2.24"
 
 	config BR2_BINUTILS_VERSION_2_25
-- 
2.3.0
