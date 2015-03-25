From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 21:39:06 +0100
Subject: [Buildroot] [git commit] gcc: mark 4.5.x as deprecated
Message-ID: <20150325203909.78AB280179@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89854b0f792553786fa3aac4966fb63e60844b7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was kept for the internal blackfin toolchain which has been removed
since because of lack of maintenance and testing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 6d514af..cf96c73 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -16,6 +16,7 @@ choice
 
 	config BR2_GCC_VERSION_4_5_X
 		bool "gcc 4.5.x"
+		depends on BR2_DEPRECATED_SINCE_2015_05
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
 			&& !BR2_powerpc64le && !BR2_nios2
