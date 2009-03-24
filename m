From: Per-Henrik Lundblom <ph@whatever.nu>
Date: Tue, 24 Mar 2009 15:46:17 +0100
Subject: [Buildroot] Tool building problem EABI+PXA270
In-Reply-To: <20090324143904.GD22599@buzzloop.caiaq.de>
References: <20090318142514.GE27893@whatever.nu>
	<20090318144657.GC19956@buzzloop.caiaq.de>
	<20090318155323.GG27893@whatever.nu>
	<20090319083953.GE30293@buzzloop.caiaq.de>
	<20090324123710.GW27893@whatever.nu>
	<20090324131156.GA22599@buzzloop.caiaq.de>
	<20090324131904.GX27893@whatever.nu>
	<20090324132946.GA23829@buzzloop.caiaq.de>
	<20090324135302.GY27893@whatever.nu>
	<20090324143904.GD22599@buzzloop.caiaq.de>
Message-ID: <20090324144617.GZ27893@whatever.nu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Daniel Mack <daniel@caiaq.de> [090324 15:39]:
 
> You can't judge from the names, but the location is fine. Just make
> sure you get a EABI enabled gcc that does not use the fancy iwmmxt
> extensions _by_default_. Play around with the br2-settings, your problem
> is certainly somewhere there. And could you post the solution here for
> others? :)

Got that from the thread you linked to. Do the options listed with
xxx-gcc -v show what options that is used by default och what options
gcc was compiled for and therefore supports? For example I have this:

./build_arm/staging_dir/usr/bin/arm-linux-uclibcgnueabi-gcc -v
Using built-in specs.
Target: arm-linux-uclibcgnueabi
Configured with:
/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot-2009.02/toolchain_build_arm/gcc-4.3.2/configure --prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=arm-linux-uclibcgnueabi --enable-languages=c --with-sysroot=/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot-2009.02/build_arm/staging_dir --with-build-time-tools=/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot-2009.02/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/bin --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-shared --with-gmp=/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot-2009.02/toolchain_build_arm/gmp --with-mpfr=/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot-2009.02/toolchain_build_arm/mpfr --disable-nls --enable-threads --disable-multilib --disable-decimal-float --with-float=soft --with-abi=aapcs-linux --with-arch=iwmmxt --with-tune=iwmmxt : (reconfigured) /home/per-henrik.lundblom/KB9202B/kuk/br/buildroot-2009.02/toolchain_build_arm/gcc-4.3.2/configure --prefix=/usr --build=i386-pc-linux-gnu --host=i386-pc-linux-gnu --target=arm-linux-uclibcgnueabi --enable-languages=c --with-sysroot=/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot-2009.02/build_arm/staging_dir --with-build-time-tools=/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot-2009.02/build_arm/staging_dir/usr/arm-linux-uclibcgnueabi/bin --disable-__cxa_atexit --enable-target-optspace --with-gnu-ld --disable-shared --with-gmp=/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot-2009.02/toolchain_build_arm/gmp --with-mpfr=/home/per-henrik.lundblom/KB9202B/kuk/br/buildroot-2009.02/toolchain_build_arm/mpfr --disable-nls --enable-threads --disable-multilib --disable-decimal-float --with-float=soft --with-abi=aapcs-linux --with-arch=iwmmxt --with-tune=iwmmxt
Thread model: posix
gcc version 4.3.2 (GCC)

How do I know if the iwmmxt stuff is used by default?

/PH

--
Per-Henrik Lundblom           epost: ph at whatever.nu
telefon: 0733-20 71 26        hemsida: www.whatever.nu
