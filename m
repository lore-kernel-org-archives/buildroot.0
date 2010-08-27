From: Choi, David <David.Choi@Micrel.Com>
Date: Thu, 26 Aug 2010 17:26:09 -0700
Subject: [Buildroot] uImage build error
In-Reply-To: <4C7590FB.1000700@googlemail.com>
References: <C43529A246480145B0A6D0234BDB0F0D481DAC@MELANITE.micrel.com>
	<4C7590FB.1000700@googlemail.com>
Message-ID: <C43529A246480145B0A6D0234BDB0F0D481DAD@MELANITE.micrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcus,

 

Thank you for your e-mail. Basically I understand Buildroot is an
independent from linux kernel, as you pointed out in your previous
e-mail.

The reason I posted the question is that users can select [kernel binary
format] from [make menuconfig] in the buildroot of v2010.08-rc1.  

 

As I need u-boot and linux kernel, I put the need information properly
from the [make menuconfig]. When I choose vmlinux as a kernel binary
format,

I can see the root file system, kernel and u-boot in the output/image
direcoty(rootfs.initcramfs, u-boot.bin and vmlinux.bin).

 

But when I change uImage as a kernel binary format, there is an error
message( make[1]: ***No rule to make target uImage. Stop).

 

I also read the doc that you pointed but I can not find the clue to fix
this issue. 

 

If there is misunderstanding at my side, please make me correct.

 

 

Regards,

David J. Choi

 

 

________________________________

From: buildroot-bounces@busybox.net
[mailto:buildroot-bounces at busybox.net] On Behalf Of Marcus Osdoba
Sent: Wednesday, August 25, 2010 2:54 PM
To: buildroot at busybox.net
Subject: Re: [Buildroot] uImage build error

 

Am 25.08.2010 23:41, schrieb Choi, David: 

Hi all,

 

I am new to buildroot. The version that I use is v2010.05(stable
version)

 

As you see the attached, I almost the default value except mips(little
endian mode).

My Linux version is 2.6.33.5(default version) and configuration is
tb0229_defconfig.

 

Whenever I have tried to build uImage, I have gotten an error message
saying "make[1]: *** No rule to make target `uImage`. Stop.

(Even though I have tried with v2010.08(rc1), I had the same error
message)

 

Hi,

Make sure to run 2010.08(rc1) or higher (there were some patches in the
past concerning kernel image building). Please activate the U-Boot
bootloader. This should compile a mkimage which will be needed for
creating an uImage.
>make menuconfig (activate u-boot and/or kernel building if you want
this)
>make

( Are you trying to run make uImage after deflating? This is not the
linux kernel. Buildroot is an independant project.
Please read docu page first:
http://buildroot.uclibc.org/downloads/buildroot.html )

Regards,
Marcus

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100826/e2462082/attachment.html>
