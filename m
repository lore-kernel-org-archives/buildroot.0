From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Mar 2015 09:15:05 -0300
Subject: [Buildroot] [PATCH 1/2] gcc: mark 4.5.x as deprecated
Message-ID: <1427199306-24508-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It was kept for the internal blackfin toolchain which has been removed
since because of lack of maintenance and testing.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.0.5
