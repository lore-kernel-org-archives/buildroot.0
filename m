From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 9 Feb 2012 12:50:51 +0100
Subject: [Buildroot] [PATCH v2 2/2] udev: bump to 181 and other fixes
In-Reply-To: <4F338D22.5010801@visionsystems.de>
References: <1328694625-17204-1-git-send-email-yegorslists@googlemail.com>
 <1328694625-17204-2-git-send-email-yegorslists@googlemail.com>
 <87k43x3ufp.fsf@macbook.be.48ers.dk> <4F33753D.7030002@visionsystems.de>
 <20120209100228.1ad88a30@skate> <4F338D22.5010801@visionsystems.de>
Message-ID: <CAGm1_ksbZpH=SxJ2_y9uXnyS0gedKoEE+=MkfkVV7X8=RRxnYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 9, 2012 at 10:08 AM, Yegor Yefremov
<yegor_sub1@visionsystems.de> wrote:
> Am 09.02.2012 10:02, schrieb Thomas Petazzoni:
>> Le Thu, 09 Feb 2012 08:26:53 +0100,
>> Yegor Yefremov <yegor_sub1@visionsystems.de> a ?crit :
>>
>>> O.K. Thanks for reviewing and committing. Due to kernel version
>>> dependency we can almost retire these toolchains in case of udev:
>>>
>>> Sourcery CodeBench ARM 2010q1
>>> Sourcery CodeBench ARM 2009q3
>>> Sourcery CodeBench ARM 2009q1
>> No everybody needs udev, so I don't think it is valid to remove those
>> toolchains just because they can't work with udev.
>
> I didn't mean to remove them (how would I get my u-boot compiled?). ?I just wanted to state this fact.
>
> Testing ct-ng right now to determine if u-boot is not allergic against it.

It looks good. I've taken default ct-ng config for Cortex-A8 and
u-boot could start the kernel without a problem.

output/host/usr/bin/arm-linux-gcc -v
Using built-in specs.
Target: arm-unknown-linux-uclibcgnueabi
Configured with:
/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/build/build-toolchain/.build/src/gcc-4.4.6/configure
--build=x86_64-build_unknown-linux-gnu
--host=x86_64-build_unknown-linux-gnu
--target=arm-unknown-linux-uclibcgnueabi
--prefix=/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/host/usr
--with-sysroot=/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot
--enable-languages=c,c++ --disable-multilib --with-arch=armv7-a
--with-tune=cortex-a8 --with-float=soft
--with-pkgversion='crosstool-NG 1.13.3 - buildroot
2012.02-git-00434-g0829989' --enable-__cxa_atexit --disable-libmudflap
--disable-libgomp --disable-libssp
--with-gmp=/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/build/build-toolchain/.build/arm-unknown-linux-uclibcgnueabi/build/static
--with-mpfr=/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/build/build-toolchain/.build/arm-unknown-linux-uclibcgnueabi/build/static
--with-ppl=/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/build/build-toolchain/.build/arm-unknown-linux-uclibcgnueabi/build/static
--with-cloog=/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/build/build-toolchain/.build/arm-unknown-linux-uclibcgnueabi/build/static
--with-host-libstdcxx='-static-libgcc -Wl,-Bstatic,-lstdc++,-Bdynamic
-lm' --enable-threads=posix --enable-target-optspace
--with-local-prefix=/home/YegorYefremov/projects/versioned/tests/br-queue-python/output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot
--disable-nls --enable-c99 --enable-long-long
Thread model: posix
gcc version 4.4.6 (crosstool-NG 1.13.3 - buildroot 2012.02-git-00434-g0829989)

Yegor
