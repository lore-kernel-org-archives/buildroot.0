From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Aug 2010 10:01:25 +0200
Subject: [Buildroot] uImage build error
In-Reply-To: <C43529A246480145B0A6D0234BDB0F0D481DAD@MELANITE.micrel.com>
References: <C43529A246480145B0A6D0234BDB0F0D481DAC@MELANITE.micrel.com>
	<4C7590FB.1000700@googlemail.com>
	<C43529A246480145B0A6D0234BDB0F0D481DAD@MELANITE.micrel.com>
Message-ID: <20100827100125.21e2ccc8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello David,

On Thu, 26 Aug 2010 17:26:09 -0700
"Choi, David" <David.Choi@Micrel.Com> wrote:

> Thank you for your e-mail. Basically I understand Buildroot is an
> independent from linux kernel, as you pointed out in your previous
> e-mail.
> 
> The reason I posted the question is that users can select [kernel
> binary format] from [make menuconfig] in the buildroot of
> v2010.08-rc1.  
> 
> As I need u-boot and linux kernel, I put the need information properly
> from the [make menuconfig]. When I choose vmlinux as a kernel binary
> format,
> 
> I can see the root file system, kernel and u-boot in the output/image
> direcoty(rootfs.initcramfs, u-boot.bin and vmlinux.bin).
> 
> But when I change uImage as a kernel binary format, there is an error
> message( make[1]: ***No rule to make target uImage. Stop).

From your previous post, I understand that you are building for MIPS.
However, the kernel doesn't provide a "make uImage" target for the MIPS
architecture: you have to produce the mkimage'd kernel manually.

On the Buildroot side, we should just prevent you from selecting
"uImage" if the architecture does not support it.

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
