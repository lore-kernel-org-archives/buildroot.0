From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Feb 2015 22:04:26 +0100
Subject: [Buildroot] [git commit] gcc: nios2: Prevent selecting unsupported
	versions
Message-ID: <20150302222719.B0D4B807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8bc506a648542fc32b9e19bd2edbbc82a99643ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Versions older than GCC v4.9 do not support the Nios-II architecture
so disable them.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 567f66a..dd61f51 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -19,7 +19,7 @@ choice
 		bool "gcc 4.5.x"
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
-			&& !BR2_powerpc64le
+			&& !BR2_powerpc64le && !BR2_nios2
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a7 && !BR2_cortex_a12 && \
 			!BR2_cortex_a15 && !BR2_fa526 && !BR2_pj4
@@ -40,7 +40,7 @@ choice
 		bool "gcc 4.7.x"
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
-			&& !BR2_bfin && !BR2_powerpc64le
+			&& !BR2_bfin && !BR2_powerpc64le && !BR2_nios2
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12 && !BR2_pj4
 		# Broken or unsupported PPC cores
@@ -56,7 +56,7 @@ choice
 		bool "gcc 4.8.x"
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_arc \
-			&& !BR2_bfin && !BR2_powerpc64le
+			&& !BR2_bfin && !BR2_powerpc64le && !BR2_nios2
 		# Broken or unsupported ARM cores
 		depends on !BR2_cortex_a12
 		# Broken or unsupported PPC cores
