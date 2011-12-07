From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Dec 2011 20:50:06 +0100
Subject: [Buildroot] [PATCH v2] Add Armadeus systems APF9328 support.
In-Reply-To: <1321640272-20793-1-git-send-email-julien.boibessot@free.fr>
 (julien boibessot's message of "Fri, 18 Nov 2011 19:17:52 +0100")
References: <1321640272-20793-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <87ehwgcgb5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "julien" == julien boibessot <julien.boibessot@free.fr> writes:

 julien> From: Julien Boibessot <julien.boibessot@armadeus.com>

 julien> The APF9328 is an i.MXL+FPGA based SOM (System On Module). Here
 julien> only minimal support is added: booting Linux kernel (UART,
 julien> Ethernet and NOR), Buildroot toolchain and JFFS2 rootfs.

Thanks, committed with minor tweak.

 julien> +++ b/configs/armadeus_apf9328_defconfig
 julien> @@ -0,0 +1,32 @@
 julien> +# Architecture
 julien> +BR2_arm=y
 julien> +BR2_arm920t=y
 julien> +
 julien> +# Toolchain
 julien> +BR2_STRIP_sstrip=y
 julien> +BR2_GCC_VERSION_4_4_X=y
 julien> +BR2_PACKAGE_GDB=y
 julien> +BR2_PACKAGE_GDB_HOST=y
 julien> +BR2_ENABLE_LOCALE_PURGE=y
 julien> +BR2_TARGET_OPTIMIZATION="-Os -pipe"

This isn't needed. It defaults to -pipe and BR2_OPTIMIZE_S (which adds
-Os) is enabled by default, so I dropped this line.

-- 
Bye, Peter Korsgaard
