From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Nov 2015 16:50:50 +0100
Subject: [Buildroot] PowerPC toolchain build failure
Message-ID: <20151108165050.1b825cc8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo, Ryan,

FYI, the following defconfig:

BR2_powerpc=y
BR2_powerpc_970=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

fails to build in glibc with:

../sysdeps/powerpc/powerpc32/dl-irel.h:33:11: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
   return ((Elf32_Addr (*) (unsigned long int)) (addr)) (GLRO(dl_hwcap));

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
