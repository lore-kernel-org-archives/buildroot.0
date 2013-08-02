From: Charles Krinke <charles.krinke@gmail.com>
Date: Fri, 2 Aug 2013 11:18:52 -0700
Subject: [Buildroot] Problem with an MPC8272 build
In-Reply-To: <51FB8EC3.3030309@zacarias.com.ar>
References: <51FAF401.60702@rftechnology.com.au>
 <51FB8EC3.3030309@zacarias.com.ar>
Message-ID: <CALo-6+hZ1-BzFd=uU-9gxazw+Z09R=rXPKY1Q0qC1x46ag8ucA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Good point Gustavo. If I recall, if the dtb is wrong, one will not get
as far in the kernel boot process.

In looking at the output, it looks like it is all the way to running
the init process. Usually when that happens in the systems I work
with, it is a matter of not satisfying the init process properly. Most
usually that is a mismatch of the name of the root console.

For whatever reason, in recent years, all the folks making SOC designs
have gone away from the old, original ttyS0 and every vendor seems to
have a special name for their serial port, so I thought that would be
the most fruitful place to look.

Charles

On 8/2/13, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> On 08/01/2013 08:49 PM, Jason Rennie wrote:
>> Buildroot does run successfully, and I have put the rootfs that is made
>> on the device and it does boot successfully with the older kernel (well
>> mostly, some networking stuff appears to be missing). But when I put the
>> new kernel on the device I get nothing. I've tried enabling early kernel
>> debugging but with no success (setting the CPM to the addresses
>> suggested by the old kernels output). I also don't seem to be able to
>> get U-Boot to work and I need to end up breaking out the BDI2000 anytime
>> I try to update U-Boot with the newer version as I brick the device.
>>
>> I have tried with the most basic possible build, not tweaking anything
>> and basically just doing the stock buildroot build for the MPC8272
>> through to poking and tweaking all sorts of thing.
>>
>> Any tips? I've attached the old dmesg output if tht helps. I'm
>> hopelessly confused and been beating my head against this for a month so
>> any help would be greatly appreciated. I'm pretty much out of ideas.
>
> A buildroot .config would help so we can see if there's anything that
> could go wrong.
> On the toolchain side a 603e should be the target, if that's wrong then
> anything you build might fail.
> On the kernel side are you building a 2.6.18ish kernel with a new
> buildroot or a newer kernel? An updated kernel will very likely need an
> updated DTB as well.
> Regards.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Charles Krinke
