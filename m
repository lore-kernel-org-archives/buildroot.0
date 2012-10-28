From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 28 Oct 2012 17:20:37 +0100
Subject: [Buildroot] Load Address and EntryPoint for Kernel
Message-ID: <508D5B55.1070401@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have successful created up my own config of buildroot to build a basic
filesystem for an ARM Target. Buildroot does everything without any
errors. To start with a low barrier I just selected support for U-Boot,
the kernel and a simple standard filesystem.

Now I have tried to start the builded kernel via U-Boot that's already
on the target. The tftpload works correct an I started the kernel.

> HDx> tftpboot 192.168.136.4:ubi/uImage
> TFTP from server 192.168.136.4; our IP address is 192.168.136.10
> Filename 'ubi/uImage'.
> Load address: 0xe000000
> Loading: #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #################################################################
>          #####################
> done
> T Bytes transferred = 2101868 (20126c hex)
> HDx> bootm 0xe000000
> ## Booting kernel from Legacy Image at 0e000000 ...
>    Image Name:   Linux-2.6.34.13-nevis
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    2101804 Bytes =  2 MB
>    Load Address: 00008000
>    Entry Point:  00008000
>    Verifying Checksum ... OK
>    Loading Kernel Image ... OK
> OK
> 
> Starting kernel ...
> 

But more is not to see. The original kernel from the manufacture looks
like this.

> ## Booting kernel from Legacy Image at f0080000 ...
>    Image Name:   Coolstream HDx Kernel
>    Image Type:   ARM Linux Kernel Image (uncompressed)
>    Data Size:    2116856 Bytes =  2 MB
>    Load Address: 00048000
>    Entry Point:  00048000
>    Verifying Checksum ... OK

As I can see the Load Address and the Entry Point is a little bit, but
significant :) different.

I have search the point there I can change this while mkimage is called
to generate the uImage but haven't found the correct point for this.

Can someone give me a hint?
Thx

Carsten
