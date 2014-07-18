From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 18 Jul 2014 08:10:41 -0300
Subject: [Buildroot] [PATCH] gcc 4.9.x: Exclude for PPC SPE because of
	PR60102
Message-ID: <1405681841-2943-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Exclude gcc 4.9.x for PowerPC SPE toolchains because of an ICE
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
There's a patch available but it's somewhat intrusive with PPC in
general and hasn't been well tested yet.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/Config.in.host | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index eaff929..afed26b 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -59,6 +59,8 @@ choice
 
 	config BR2_GCC_VERSION_4_9_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_sparc
+		# PR60102 https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60102
+		depends on !BR2_powerpc_SPE
 		select BR2_GCC_NEEDS_MPC
 		select BR2_GCC_SUPPORTS_GRAPHITE
 		bool "gcc 4.9.x"
-- 
1.8.5.5
