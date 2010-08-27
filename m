From: Choi, David <David.Choi@Micrel.Com>
Date: Fri, 27 Aug 2010 07:40:00 -0700
Subject: [Buildroot] uImage build error
In-Reply-To: <20100827100125.21e2ccc8@surf>
References: <C43529A246480145B0A6D0234BDB0F0D481DAC@MELANITE.micrel.com><4C7590FB.1000700@googlemail.com><C43529A246480145B0A6D0234BDB0F0D481DAD@MELANITE.micrel.com>
	<20100827100125.21e2ccc8@surf>
Message-ID: <C43529A246480145B0A6D0234BDB0F0D481DAE@MELANITE.micrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas & all,

Thank you. I got it.

Regards,
David J. Choi


-----Original Message-----
From: buildroot-bounces@busybox.net
[mailto:buildroot-bounces at busybox.net] On Behalf Of Thomas Petazzoni
Sent: Friday, August 27, 2010 1:01 AM
To: buildroot at busybox.net
Subject: Re: [Buildroot] uImage build error

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
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
