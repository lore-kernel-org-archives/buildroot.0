From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 10 Dec 2008 16:37:31 +0100
Subject: [Buildroot] Buildroot for target PowerPC 405 (on Xilinx
	XUPV2p	Board)
In-Reply-To: <10d6046f0812100657s396ae2a3n232aa92e681bde94@mail.gmail.com>
References: <10d6046f0812010740u5082e10bk9fded198d8d3bddb@mail.gmail.com>
	<20081201161034.GA20082@mx.loc>
	<10d6046f0812100507k5e51bddbg88dd80732142a73@mail.gmail.com>
	<20081210140059.GA23100@mx.loc>
	<10d6046f0812100613m2f54f43cx4c4c413dbea7df25@mail.gmail.com>
	<20081210144452.GB23100@mx.loc>
	<10d6046f0812100657s396ae2a3n232aa92e681bde94@mail.gmail.com>
Message-ID: <20081210153731.GC23100@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please keep this on the mailing list, it may be helpful for others too.

On Wed, Dec 10, 2008 at 03:57:15PM +0100, Mirko ROCCO wrote:
>Ok, thanks, I realize that the problem was this... now buildroot seems to
>compile, but I have still a doubt: I'm using a kernel from Xilinx, with
>support for same IP core that i need for my board.
>
>So, can I use the .config file for Xilinx kernel even if it is not for a
>"native linux kernel"?

If the kernel is reasonable new then you can use that kernel and appropriate
.config, yes.

If you select Toolchain -> Kernel Headers -> Linux 2.6 snapshot then
a linux-2.6.tar.bz2 tarball is used which has to contain the kernel
sources in the "linux-2.6/" directory.

So, either you git clone git://kernel.org/.... linux-2.6
for an upstream kernel or you can
mv linux-kernel-2.6-from-vendor linux-2.6
# cd linux-2.6 && make mrproper
tar -cjf dl/linux-2.6.tar.bz2 linux-2.6
where "dl/" is the BR2_DL_DIR from your buildroot .config.

>
>Many thanks for any help,
>Mirko ROCCO
>
>
>2008/12/10 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>
>> On Wed, Dec 10, 2008 at 03:13:54PM +0100, Mirko ROCCO wrote:
>> >Hi! This is my config file for buildroot!
>>
>> BR2_KERNEL_none=y
>> # BR2_KERNEL_LINUX is not set
>>
>> You did not enable a kernel.
>> make menuconfig
>> goto the "kernel" and select "Kernel type" linux.
>> Enable "linux kernel" and set ".config file" to the
>> kernel config you want to use (e.g. "br2.ppc-405-kernel.config").
>> If you do not yet have a kernel .config file prepared, then you
>> can copy one of the ppc defconfig to that very file to the toplevel
>> directory.
>>
>> HTH,
>>
>> >
>> >Mirko ROCCO
>> >
>> >
>> >2008/12/10 Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> >
>> >> On Wed, Dec 10, 2008 at 02:07:56PM +0100, Mirko ROCCO wrote:
>> >> >Hi Bernhard!
>> >> >I try to use your tree as you suggest me!
>> >> >
>> >> >Unfortunately I recive this error and i don't know how to solve it:
>> >>
>> >> Please show me your buildroot (toplevel) .config
>> >>
>>
>>
>>
