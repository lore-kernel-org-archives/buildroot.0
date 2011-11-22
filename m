From: Spenser Gilliland <spenser309@gmail.com>
Date: Tue, 22 Nov 2011 03:07:39 -0600
Subject: [Buildroot] Adding Microblaze support to Buildroot
In-Reply-To: <20111122095809.2ad28649@skate>
References: <4EBC554E.7050605@gmail.com> <4EBC5656.2010103@gmail.com>
 <4EBD18F1.6020804@relinux.de> <4ECB62C8.6030301@relinux.de>
 <20111122095809.2ad28649@skate>
Message-ID: <CA+appbM5S2f=CdFuN68EVTePXvXpYR+y1-CCO4W30OVXwmJKkQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been trying to get the buildroot to work but I have been
stonewalled by the following error.  Not quite sure where to go from
here.  Anyone have some input?

  INSTALL include ->
/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc_dev//usr/include
make[1]: Leaving directory
`/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc'
# Install the kernel headers to the first stage gcc include dir
# if necessary
if [ ! -f /home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc_dev/usr/include/linux/version.h
]; then \
		cp -pLR /home/spenser/Research/buildroot/buildroot/output/toolchain/linux/include/*
\
			/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc_dev/usr/include/;
\
	fi
/home/spenser/Research/buildroot/buildroot/output/host/usr/bin/microblaze-unknown-linux-uclibc-gcc
-nostdlib -nostartfiles -shared -x c /dev/null -o
/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc_dev/usr/lib/libc.so
/tmp/cceEeb5C.o: could not read symbols: No error
collect2: ld returned 1 exit status
make: *** [/home/spenser/Research/buildroot/buildroot/output/toolchain/uClibc/.configured]
Error 1




Spenser



On Tue, Nov 22, 2011 at 2:58 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Tue, 22 Nov 2011 09:52:24 +0100,
> Stephan Hoffmann <sho@relinux.de> a ?crit :
>
>> is there an interest in adding the Microblaze architecture to
>> buildroot?
>
> Definitely, yes.
>
>> And, if it is, would it be acceptable to rely on toolchain and/or
>> bootloader coming from the board vendor or Xilinx, at least for some
>> time?
>
> Yes. It is possible to use the external toolchain mechanism. For
> example, the Blackfin support relies on an external toolchain provided
> by ADI, I'm not sure the internal Buildroot code to build a toolchain
> works for Blackfin. So doing the same for Microblaze seems reasonable.
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



-- 
Spenser Gilliland
Computer Engineer
Illinois Institute of Technology
