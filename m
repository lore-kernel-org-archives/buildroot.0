From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Mon, 20 Aug 2007 15:59:08 +0100
Subject: [Buildroot] AVR32 now requires setting the kernel binary format
In-Reply-To: <d6cda7730708200757g18983a3clf5833aba059aee9e@mail.gmail.com>
References: <d6cda7730708200757g18983a3clf5833aba059aee9e@mail.gmail.com>
Message-ID: <d6cda7730708200759s71a623e6m61e414a11fc2c56a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, the build stops after the kernel is compiled, as it's looking it
at the wrong place:

  OBJCOPY arch/avr32/boot/images/vmlinux.bin
  GZIP    arch/avr32/boot/images/vmlinux.gz
  UIMAGE arch/avr32/boot/images/uImage
Image Name:   Linux-2.6.22.1
Created:      Mon Aug 20 08:57:18 2007
Image Type:   AVR32 Linux Kernel Image (gzip compressed)
Data Size:    932780 Bytes = 910.92 kB = 0.89 MB
Load Address: 0x10000000
Entry Point:  0x90000000
  Image arch/avr32/boot/images/uImage is ready
make[1]: Leaving directory
`/root/novacomm/buildroot/buildroot/build_avr32/linux-2.6.22.1'
cp -dpf /root/novacomm/buildroot/buildroot/build_avr32/linux-2.6.22.1/uImage
/root/novacomm/buildroot/buildroot/binaries/pppserver/pppserver-linux-2.6.22.1
cp: cannot stat
`/root/novacomm/buildroot/buildroot/build_avr32/linux-2.6.22.1/uImage':
No such file or directory
make: *** [/root/novacomm/buildroot/buildroot/binaries/pppserver/pppserver-linux-2.6.22.1]
Error 1


This one I don't know where to fix :(

On 8/20/07, Thiago A. Corr?a <thiago.correa@gmail.com> wrote:
> Hi,
>
>   Not sure if this is intended, but now to build the AVR32 one has to
> set the kernel format in menuconfig, since the default changed from
> uImage to zImage and the AVR32 linux fails to build zImage with
> unknown target.
>
>   Perhaps some variable missing in target/devices/Atmel
>
> Cheers,
>    Thiago A. Correa
>
