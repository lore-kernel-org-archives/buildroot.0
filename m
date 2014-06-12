From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 12 Jun 2014 18:51:38 +0200
Subject: [Buildroot] [PATCH] gcc 4.8.x does not compile a working kernel for
	sparc
Message-ID: <20140612165138.GA12634@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the switch to 4.8.x as default, the qemu-sparc target is broken.
For a gcc bug report see here:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60624

Switch back to gcc 4.7.x as default for sparc.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gcc/Config.in.host |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b6d4b5e..ecb98fc 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -10,6 +10,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
+	default BR2_GCC_VERSION_4_7_X if BR2_sparc
 	default BR2_GCC_VERSION_4_8_X if BR2_aarch64
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
 	default BR2_GCC_VERSION_4_9_X if BR2_microblaze || BR2_powerpc64le
-- 
1.7.10.4
