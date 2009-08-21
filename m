From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 21 Aug 2009 12:37:50 -0400
Subject: [Buildroot] Kernel panic - not syncing: Attempted to kill init!
In-Reply-To: <20090821114447.188fc839@surf>
References: <BD79186B4FD85F4B8E60E381CAEE190901BEA43C@mi8nycmail19.Mi8.com><20090819214237.534c433f@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA476@mi8nycmail19.Mi8.com><20090819233037.1d8e5a5d@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA4AD@mi8nycmail19.Mi8.com><20090820143514.7c5e56a2@surf><BD79186B4FD85F4B8E60E381CAEE190901BEA58B@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA5DB@mi8nycmail19.Mi8.com><BD79186B4FD85F4B8E60E381CAEE190901BEA675@mi8nycmail19.Mi8.com>
	<20090821114447.188fc839@surf>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901BEA738@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, August 21, 2009 2:45 AM, Thomas Petazzoni wrote:
> Hello,
> 
> Thanks for all your researches, they are very interesting.

Right now I'm in a panic mode just trying to get it to work.

> 
> Le Thu, 20 Aug 2009 20:53:33 -0400,
> "H Hartley Sweeten" <hartleys@visionengravers.com> a ?crit :
> 
>>  The current external toolchain support doesn't appear to work
>> correctly for a multilib toolchain. 
> 
> I've definitely never used multilib toolchains with the external
> toolchain support. That's something that must be extended.
> 
> > Any ideas on how to make this work?
> 
> In the menuconfig, the CPU type can be specified in the ? Target
> Architecture Variant ?, the value of this option can be used to call
> -print-sysroot properly.

Does the -print-sysroot work and return the correct path on your
non-multilib external toolchain?

I already have the "Target Architecture Variant" and the other options
set correctly.

BR2_arm=y
BR2_ARM_TYPE="ARM920T"
BR2_ARM_EABIT=y
BR2_ARCH="arm"
BR2_ENDIAN="LITTLE"
BR2_GCC_TARGET_TUNE="arm920t"
BR2_GCC_TARGET_ARCH="armv4t"
BR2_GCC_TARGET_ABI="aapcs-linux"

> 
> And as you said, the handling of ?Target Architecture Variant? is
> currently incorrect for external toolchains.
> 
> Do you want me to work on this, or do you plan to work on it yourself ?

I'm still trying to get it to work but I'm a bit lost.  There are still
a bunch of things about makefiles and all the shell stuff in them that
I just don't get ;-).

The main problem I am having is modifying ext-tool.mk correctly.

If you have the time I would appreciate any help.  I can test anything
that you might suggest.

Thanks,
Hartley
