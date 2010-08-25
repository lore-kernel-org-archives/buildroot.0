From: Marcus Osdoba <marcus.osdoba@googlemail.com>
Date: Wed, 25 Aug 2010 23:54:03 +0200
Subject: [Buildroot] uImage build error
In-Reply-To: <C43529A246480145B0A6D0234BDB0F0D481DAC@MELANITE.micrel.com>
References: <C43529A246480145B0A6D0234BDB0F0D481DAC@MELANITE.micrel.com>
Message-ID: <4C7590FB.1000700@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Am 25.08.2010 23:41, schrieb Choi, David:
>
> Hi all,
>
> I am new to buildroot. The version that I use is v2010.05(stable version)
>
> As you see the attached, I almost the default value except mips(little 
> endian mode).
>
> My Linux version is 2.6.33.5(default version) and configuration is 
> tb0229_defconfig.
>
> Whenever I have tried to build uImage, I have gotten an error message 
> saying "make[1]: *** No rule to make target `uImage`. Stop.
>
> (Even though I have tried with v2010.08(rc1), I had the same error 
> message)
>
Hi,

Make sure to run 2010.08(rc1) or higher (there were some patches in the 
past concerning kernel image building). Please activate the U-Boot 
bootloader. This should compile a mkimage which will be needed for 
creating an uImage.
 >make menuconfig (activate u-boot and/or kernel building if you want this)
 >make

( Are you trying to run make uImage after deflating? This is not the 
linux kernel. Buildroot is an independant project.
Please read docu page first:
http://buildroot.uclibc.org/downloads/buildroot.html )

Regards,
Marcus
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100825/1925be16/attachment.html>
