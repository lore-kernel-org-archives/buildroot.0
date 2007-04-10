From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 10 Apr 2007 14:18:38 +0200
Subject: [Buildroot] BSP patch
In-Reply-To: <017101c771ed$52dbe8c0$01c4af0a@Glamdring>
References: <02a401c76c07$c75473c0$01c4af0a@Glamdring>
	<20070321224324.GD5468@aon.at>
	<02e801c76c0e$c9eec980$01c4af0a@Glamdring>
	<20070322132609.GA11410@aon.at>
	<017101c771ed$52dbe8c0$01c4af0a@Glamdring>
Message-ID: <20070410121838.GA16751@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 29, 2007 at 12:30:43PM +0200, Ulf Samuelsson wrote:
>[snip]
>
>>>The BSP patch is really there to allow two different configurations
>>>to be built within the same buildroot directory so they can share:
>>>
>>>* toolchain
>>>* root file system build directory.
>>>but have different configurations for linux kernel and busybox
>>>and eventually you may want to have different content of the root file
>>>system.
>>>
>>>The solution is to create a new directory structure
>>>target_build_<arch>/<board> where everything is built.
>>>The patch allows pre/postfixes to this directory name.
>>>
>>>The BSP patch also put some structure on where the result ends up.
>>>Today everything is stored in the top directory, but if you
>>>want to build multiple boards, then you are going to get a lot of clutter.
>>
>>We need to better differentiate between arch and cpu (generally, not in
>>your board support patch).
>>
>>Applying your patch now locally. Let's see..
>>
>
>Any progress?

[I've just replied to you to a privately sent message, fwiw]

random remarks:
avr32_binutils/toolchain_binutils_binutils.mk.patch
There is already a BR2_ATMEL_MIRROR in the toplevel Config.in, use that
instead.


avr32_binutils/toolchain_binutils_Config.in.patch
I won't comment on you using a deprecated version of binutils (current
release is 2.17).
Please put the !avr32 next to !nios, i.e. before the DEPRECATED.


avr32_kernel_headers/toolchain_kernel-headers_Config.in.patch
I won't comment on you using an old kernel.
Please put the !avr32 before the DEPRECATED


avr32_gcc/toolchain_gcc_Config.in.patch
Please put the !avr32 before the DEPRECATED


avr32_gcc/toolchain_gcc_4.0.2_gcc-4.0.2-atmel.0.99.2.patch.patch
4.0.2 is deprecated. The current stable release is 4.1.2, 4.0.4 was the
last release of 4.0 so far.
There are lots of changes due to RCS IDs in this patch, please drop those
parts.
