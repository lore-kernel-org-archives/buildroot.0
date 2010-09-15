From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Sep 2010 21:19:03 +0200
Subject: [Buildroot] external toolchain question
In-Reply-To: <4C910D9F.2060308@carallon.com>
References: <4C910D9F.2060308@carallon.com>
Message-ID: <20100915211903.6097235c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Sep 2010 19:17:03 +0100
William Wagner <will_wagner@carallon.com> wrote:

> I'm trying to get a crosstool-ng toolchain working and running into a 
> few problems. One thing I found with c++ support was that libstdc++
> was being copied into target/usr/lib but it was located in
> staging/lib.

What's inside staging/ is just a bare copy of the toolchain sysroot. As
the toolchain sysroot organization depends on the toolchain, libstdc++
might be located in lib/ or usr/lib in staging.

For the target, I thought that it'd be a good idea to have it under
usr/lib regardless of whether it was in lib/ or usr/lib/ in the staging
directory. This is because "essential" applications do not usually
depend on libstdc++, so the natural location for libsdc++ is usr/lib.

Is it causing any sort of problem for you ?

> As an aside what is the status of using a buildroot generated
> toolchain as an external toolchain?

It should work, my testing environment includes :

 * CodeSourcery toolchains (ARM, PowerPC, MIPS, sh)
 * Buildroot external toolchains (x86, ARM, AVR32, mipsel,
   powerpc, sh)
 * Crosstool-NG external toolchains (ARM glibc, ARM uclibc, i586
   uclibc, mips uclibc, powerpc uclibc)

All those toolchains work, at least in the cases I've tested, of course.

> Any instructions anywhere on how to do it?

 * Select architecture
 * In Build options, change the staging dir location to where you want
   the toolchain to be installed 
 * Disable the Busybox package
 * Disable the ext2 filesystem generation

That should be it.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
