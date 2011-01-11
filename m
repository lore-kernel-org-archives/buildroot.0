From: Divick Kishore <divick.kishore@gmail.com>
Date: Tue, 11 Jan 2011 17:55:15 +0530
Subject: [Buildroot] Illegal instruction when running some of the cross
	compiled binaries
Message-ID: <AANLkTi=0q8wUTjBSdVUv2KTVyxYc9NTSumE_+MrN4faf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
    I have built a custom root filesystem using build root, but
certain binaries (built with the packages selected during menuconfig)
when run give "Illegal Instruction".

# sshd
Illegal instruction

Having looked at the logs, the compiler flags used to build the binary
seems fine (-mtune=arm920t -march=armv4t -mabi=aapcs-linux
-msoft-float ) i.e. right for my H/W (ATMEL AT91RM9200).

1. Toolchain used CodeSourcery G++ Lite 2010.09-50
(arm-none-linux-gnueabi-gcc-4.5.1).
2. Linux kernel using the above mentioned toolchain.
3. Version of buildroot used is buildroot-2010.11.

Could anyone please suggest what is going wrong? It seems people have
similar kind of issue
(http://www.embeddedrelated.com/groups/AT91SAM/show/3547.php)
but the bug pointed for the issue doesn't seem to exist.

Another related issue that I see is that the pthreads libraries are
not copied in the rootfilesystem image from toolchain for some
reasons. Is it a known issue?

Thanks & Regards,
DivKis
