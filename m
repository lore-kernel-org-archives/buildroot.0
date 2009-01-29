From: hartleys <hartleys@visionengravers.com>
Date: Thu, 29 Jan 2009 13:35:46 -0500
Subject: [Buildroot] svn commit: trunk/buildroot/target/device:
	ARMLTDARMLTD/integrator926 ARMLTD/inte etc...
In-Reply-To: <20090129174137.BB3DC76D75@busybox.osuosl.org>
References: <20090129174137.BB3DC76D75@busybox.osuosl.org>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090114B446@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, January 29, 2009 10:42 AM, ulf at uclibc.org wrote:
> Log:
> Clean  up ARM Ltd BSP
> 
> Added:
>    trunk/buildroot/target/device/ARMLTD/integrator926/
>
trunk/buildroot/target/device/ARMLTD/integrator926/integrator926_defconf
ig
>
trunk/buildroot/target/device/ARMLTD/integrator926/linux-2.6.22.9.config
>    trunk/buildroot/target/device/ARMLTD/integrator926_huge/
>
trunk/buildroot/target/device/ARMLTD/integrator926_huge/integrator926_hu
ge_defconfig
>
trunk/buildroot/target/device/ARMLTD/integrator926_huge/linux-2.6.26.8.c
onfig
> 
> Removed:
>    trunk/buildroot/target/device/ARMLTD/integrator926_defconfig
>    trunk/buildroot/target/device/ARMLTD/integrator926_huge_defconfig
>    trunk/buildroot/target/device/ARMLTD/linux26.integrator926.config
>
trunk/buildroot/target/device/ARMLTD/linux26.integrator926_huge.config
> 
> Modified:
>    trunk/buildroot/target/device/ARMLTD/Config.in
>    trunk/buildroot/target/device/ARMLTD/Makefile.in
>    trunk/buildroot/target/device/Config.in
> 

I think trunk/buildroot/target/device/ARMLTD/Config.in needs a bit more
work.

$ make menuconfig
target/device/ARMLTD/Config.in:19:warning: defaults for choice values
not supported
target/device/ARMLTD/Config.in:26:warning: defaults for choice values
not supported

Also, are the various:

	depends on BR2_arm && BR2_TARGET_ARMLTD

really needed?  I don't think you can even get into the choices until
those depends are already satisfied.

Just my two cents...  Keep up the great work!
Hartley
