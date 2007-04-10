From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 10 Apr 2007 15:22:38 +0200
Subject: [Buildroot] BSP patch
References: <02a401c76c07$c75473c0$01c4af0a@Glamdring>
	<20070321224324.GD5468@aon.at>
	<02e801c76c0e$c9eec980$01c4af0a@Glamdring>
	<20070322132609.GA11410@aon.at>
	<017101c771ed$52dbe8c0$01c4af0a@Glamdring>
	<20070410121838.GA16751@aon.at>
Message-ID: <009801c77b74$6b3533a0$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
To: "Ulf Samuelsson" <ulf@atmel.com>
Cc: <buildroot@uclibc.org>
Sent: Tuesday, April 10, 2007 2:18 PM
Subject: Re: [Buildroot] BSP patch


> On Thu, Mar 29, 2007 at 12:30:43PM +0200, Ulf Samuelsson wrote:
>>[snip]
>>
>>>>The BSP patch is really there to allow two different configurations
>>>>to be built within the same buildroot directory so they can share:
>>>>
>>>>* toolchain
>>>>* root file system build directory.
>>>>but have different configurations for linux kernel and busybox
>>>>and eventually you may want to have different content of the root file
>>>>system.
>>>>
>>>>The solution is to create a new directory structure
>>>>target_build_<arch>/<board> where everything is built.
>>>>The patch allows pre/postfixes to this directory name.
>>>>
>>>>The BSP patch also put some structure on where the result ends up.
>>>>Today everything is stored in the top directory, but if you
>>>>want to build multiple boards, then you are going to get a lot of clutter.
>>>
>>>We need to better differentiate between arch and cpu (generally, not in
>>>your board support patch).
>>>
>>>Applying your patch now locally. Let's see..
>>>
>>
>>Any progress?
> 
> [I've just replied to you to a privately sent message, fwiw]
> 
> random remarks:
> avr32_binutils/toolchain_binutils_binutils.mk.patch
> There is already a BR2_ATMEL_MIRROR in the toplevel Config.in, use that
> instead.

OK.

> 
> avr32_binutils/toolchain_binutils_Config.in.patch
> I won't comment on you using a deprecated version of binutils (current
> release is 2.17).
> Please put the !avr32 next to !nios, i.e. before the DEPRECATED.
> 
> 
> avr32_kernel_headers/toolchain_kernel-headers_Config.in.patch
> I won't comment on you using an old kernel.
> Please put the !avr32 before the DEPRECATED
> 
> 
> avr32_gcc/toolchain_gcc_Config.in.patch
> Please put the !avr32 before the DEPRECATED
> 
> 
> avr32_gcc/toolchain_gcc_4.0.2_gcc-4.0.2-atmel.0.99.2.patch.patch
> 4.0.2 is deprecated. The current stable release is 4.1.2, 4.0.4 was the
> last release of 4.0 so far.

I know, you told me before.
And does not contain any AVR32 patches.
Everyone using the AVR32 will have to live with the 4.0.1 release
until the AVR32 team provides an updated compiler.
The only viable alternative is to not provide AVR32 support at all in buildroot.

> There are lots of changes due to RCS IDs in this patch, please drop those
> parts.

The main drwaback of that is Size, I guess.
My plan is to let buildroot download the patches instead of storing them
inside the mainstream buildroot tarball.
I have not generated those patches, and will not be able to test any modifications.

> 
> 

As mentioned in the other mail.
These things are just for your reference to show where I am going
and not official patch submissions.
Need to establish the framework first with the BSP patch and then
I will send in "clean" patches for submission later.

Best Regards
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57
