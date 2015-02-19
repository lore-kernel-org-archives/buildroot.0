From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:04:26 +0100
Subject: [Buildroot] [git commit branch/next] binutils: nios2: Prevent
	selecting unsupported versions
Message-ID: <20150219212508.12894801C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=373705b98425d59392de18b67cc763e0784e91ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Versions previous to binutils v2.25 do not support the Nios-II architecture,
so disable them.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/Config.in.host |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

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
