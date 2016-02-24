From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Feb 2016 15:00:39 -0300
Subject: [Buildroot] [PATCH 1/2] gcc: mark 4.7.x as deprecated
Message-ID: <1456336840-14890-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We're already using 4.9.x as default, and have 4.8.x on the lower side
together with 5.x (5.3.0) on the higher side.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index cad6896..c677c65 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -40,6 +40,7 @@ choice
 
 	config BR2_GCC_VERSION_4_7_X
 		bool "gcc 4.7.x"
+		depends on BR2_DEPRECATED_SINCE_2016_05
 		# Broken or unsupported architectures
 		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
 			&& !BR2_powerpc64le && !BR2_nios2
-- 
2.4.10
