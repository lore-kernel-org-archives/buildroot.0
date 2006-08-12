From: Brian C. Lane <bcl@brianlane.com>
Date: Sat, 12 Aug 2006 16:32:28 -0700
Subject: [Buildroot] Building for ARM
Message-ID: <44DE650C.2060402@brianlane.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I am trying to build a basic system for ARM to use with qemu. I have
successfully doen this for i386 so all the tools are in place.

1. I configured buildroot for armeb and the ARM926 processor and then
built the basic filesystem and tools (I have also tried with arm instead
of armeb).

2. I configured kernel 2.6.12.6 for ARM (make ARCH="arm" menuconfig) and
selected Versatile for the ARM system type (qemu supports this and
Integrator)

3. I added the buildroot tools to the beginning of the path and try to
compile the kernel with:

export PATH=../buildroot/build_armeb/staging_dir/bin:$PATH
make CROSS-COMPILE="armeb-linux-" ARCH="arm" bzImage

I get this result:

CC      arch/arm/kernel/asm-offsets.s
cc1: error: invalid option ?little-endian?
cc1: error: invalid option ?apcs?
cc1: error: invalid option ?no-sched-prolog?
cc1: error: invalid option ?abi=apcs-gnu?
arch/arm/kernel/asm-offsets.c:1: error: bad value (armv4) for -march= switch
arch/arm/kernel/asm-offsets.c:1: error: bad value (arm9tdmi) for -mtune=
switch

It is acting like the compiler doesn't support arm, but I obviously set
the PATH and CROSS-COMPILE to point to the buildroot tools.

Does anyone have any idea of what I'm doing wrong? I've also done a
bunch of googleing and haven't come up with a decent howto for building
a basic system (coverage of uclibc, busybox and buildroot are great, but
none seem to talk about the kernel).

Thanks,

Brian

- --
- ---[Office 72.2F]--[Outside 70.8F]--[Server 86.2F]--[Coaster 72.2F]---
Linux Software Developer                      http://www.brianlane.com
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)
Comment: Remember Lexington Green!

iD8DBQFE3mUMIftj/pcSws0RAgc5AJ9vYQKixGR9Irk/b7prQBOUIaDECgCghMwO
nrXIo1CQoMItua5NvuEwNWw=
=+r66
-----END PGP SIGNATURE-----
