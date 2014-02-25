From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Feb 2014 08:28:28 +0100
Subject: [Buildroot] Link error when building latest rootfs for i.MX6
In-Reply-To: <44C2037B3E0E704C9BB751CAFFB640483C55A413@SV950-MBX1.corp.intusurg.com>
References: <44C2037B3E0E704C9BB751CAFFB640483C55A413@SV950-MBX1.corp.intusurg.com>
Message-ID: <20140225082828.52251e2b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jason Jiang,

On Mon, 24 Feb 2014 18:57:40 +0000, Jason Jiang wrote:

> I had a problem building the latest rootfs for my i.MX6 board. I got the latest one from http://www.buildroot.org/download.html. I tried to build it in the following way:

Could you provide your .config file?

> $ make menuconfig...
> 
> #  Target ARM (Little-Endian)
> 
> #  Target Cortex A-9
> 
> #  Under toolchain:
> 
> #      External
> 
> #      Sourcery Codebench ARM 2013.05
> 
> #      Downloaded and installed

This is not possible: either you use a toolchain downloaded by
Buildroot, or that is already installed on your system.

> But at the end, I got link error: "/opt/freescale/usr/local/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/fsl-linaro-toolchain/bin/../lib/gcc/arm-fsl-linux-gnueabi/4.6.2/../../../../arm-fsl-linux-gnueabi/bin/ld: cannot find crti.o: No such file or directory". I googled around for the whole day and just couldn't figure out the solution. Could you help please?

It clearly looks like the toolchain you're using is *not* Sourcery
Codebench ARM 2013.05, but a different Freescale toolchain, which we
have never tested.

Where can I get this toolchain, in order to test it?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
