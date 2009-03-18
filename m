From: Per-Henrik Lundblom <ph@whatever.nu>
Date: Wed, 18 Mar 2009 13:25:15 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090318114711.GA19956@buzzloop.caiaq.de>
References: <20090318112308.GA27893@whatever.nu>
	<20090318114711.GA19956@buzzloop.caiaq.de>
Message-ID: <20090318122515.GB27893@whatever.nu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Daniel Mack <daniel@caiaq.de> [090318 12:47]:

> You could try using the svn version. There were a number of fixes for
> gcc builds, and I'm not totally aware whether they make it to the
> release version you got.

Got latest version...

> Try the following changes, thing work fine here for me, also with
> gcc-4.3.2 built for PXA270/300.
> 
> > # Automatically generated make config: don't edit
> > # Tue Mar 17 13:25:58 2009
> 
> [...]
> 
> > BR2_xscale=y
> > # BR2_iwmmxt is not set
> > BR2_ARM_TYPE="ARM_XSCALE"
> > # BR2_ARM_OABI is not set
> > BR2_ARM_EABI=y
> > BR2_ARCH="arm"
> > BR2_ENDIAN="LITTLE"
> > BR2_GCC_TARGET_TUNE="xscale"
> > BR2_GCC_TARGET_ABI="aapcs-linux"
> 
> # BR2_xscale is not set
> BR2_iwmmxt=y
> BR2_ARM_TYPE="ARM_IWMMXT"
> # BR2_ARM_OABI is not set
> BR2_ARM_EABI=y
> BR2_ARCH="arm"
> BR2_ENDIAN="LITTLE"
> BR2_GCC_TARGET_TUNE="iwmmxt"
> BR2_GCC_TARGET_ARCH="iwmmxt"

...using these settings I get this result. It is a result of using
iwmxxt target because I got the same error when I tried different
combinations of xscale/iwmmxt.

-------------------------------
<snip>

Checking multilib configuration for libgcc...
mkdir -p -- arm-linux-uclibc/libgcc
Configuring in arm-linux-uclibc/libgcc
configure: creating cache ./config.cache
checking for --enable-version-specific-runtime-libs... no
checking for a BSD-compatible install... /usr/bin/install -c
checking for gawk... gawk
checking build system type... i386-pc-linux-gnu
checking host system type... arm-unknown-linux-uclibc
checking for arm-linux-uclibc-ar...
/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ar
checking for arm-linux-uclibc-lipo... arm-linux-uclibc-lipo
checking for arm-linux-uclibc-nm...
/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/toolchain_build_arm/gcc-4.3.2-initial/./gcc/nm
checking for arm-linux-uclibc-ranlib...
/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-ranlib
checking for arm-linux-uclibc-strip...
/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-strip
checking whether ln -s works... yes
checking for arm-linux-uclibc-gcc...
/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/toolchain_build_arm/gcc-4.3.2-initial/./gcc/xgcc
-B/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/toolchain_build_arm/gcc-4.3.2-initial/./gcc/
-B/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/bin/
-B/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/lib/
-isystem
/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/include
-isystem
/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/build_arm/staging_dir/usr/arm-linux-uclibc/sys-include
checking for suffix of object files... configure: error: cannot compute
suffix of object files: cannot compile
See `config.log' for more details.
make[1]: *** [configure-target-libgcc] Error 1
make[1]: Leaving directory
`/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/toolchain_build_arm/gcc-4.3.2-initial'
make: ***
[/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot/toolchain_build_arm/gcc-4.3.2-initial/.compiled]
Error 2
-------------------------------

That is, the GCC is not at some point built. Other tools are though:

> ls -1 build_arm/staging_dir/usr/bin
rm-linux-uclibc-addr2line
arm-linux-uclibc-ar
arm-linux-uclibc-as
arm-linux-uclibc-c++filt
arm-linux-uclibc-gprof
arm-linux-uclibc-ld
arm-linux-uclibc-nm
arm-linux-uclibc-objcopy
arm-linux-uclibc-objdump
arm-linux-uclibc-ranlib
arm-linux-uclibc-readelf
arm-linux-uclibc-size
arm-linux-uclibc-strings
arm-linux-uclibc-strip

Any suggesttions why gcc crosscompiler at some point isn't available?

Regards,

PH

--
Per-Henrik Lundblom           epost: ph at whatever.nu
telefon: 0733-20 71 26        hemsida: www.whatever.nu
