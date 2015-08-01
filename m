From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 1 Aug 2015 10:21:32 +0200
Subject: [Buildroot] [PATCH 00/47] package/kodi: bump version to 15.0
 Isengard
In-Reply-To: <20150730153431.1cb277b8@free-electrons.com>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <20150730153431.1cb277b8@free-electrons.com>
Message-ID: <20150801082132.GA8475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Bernd,
> 
> On Wed, 22 Jul 2015 22:30:22 +0200, Bernd Kuhls wrote:
> 
> > Kodi 15.0 Isengard was released yesterday:
> > http://kodi.tv/kodi-15-0-isengard-one-release-to-rule-them-all/
> 
> Another thing: it does not build on ARM with uClibc. I get the
> following error:
> 
> /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/4.7.4/libgcc.a(linux-atomic-64bit.o): In function `__check_for_sync8_kernelhelper':
> /opt/toolchain-build/build/host-gcc-final-4.7.4/build/arm-buildroot-linux-uclibcgnueabi/libgcc/../../../libgcc/config/arm/linux-atomic-64bit.c:59: undefined reference to `__write'
> collect2: error: ld returned 1 exit status
> Makefile:486: recipe for target 'kodi.bin' failed
> 
> This is with the toolchain configuration at
> http://autobuild.buildroot.org/toolchains/configs/br-arm-full.config +
> rpi-userland as the OpenGL ES backend.
> 
> This error is apparently due to the fact that we're using a 64 bits
> atomic operation implemented by libgcc, which requires assistance from
> the kernel. libgcc has some code to print a message when the kernel
> doesn't provide the necessary syscall, and this code calls __write().
> This function seems to not be provided by uClibc (while it is probably
> provided by glibc).
> 
> I'm Cc'ing Waldemar, maybe he has some ideas.
> 
> However, generally speaking I believe supporting Kodi on uClibc is a
> bit useless: Kodi is anyway so big that the size benefits of uClibc are
> no longer significant. So if this problem pops up in the autobuilders
> and isn't fixed by then, I'll mark Kodi as glibc only for the moment.
> 
> Thanks!

It is not useless in my point of view. When we support bigger
applications with long runtimes with uClibc, we can be sure to have
good quality in the C library. So even if we do not do it because of
any space limitations it will uncover some bugs.

So please do not disable it. I tried a build with Kodi and uClibc-ng
with OpenADK and did not get a build error.

May be the GCC version is problematic? 4.7.4 is rather old. Does it
happen with gcc 4.9.3?

best regards
 Waldemar
