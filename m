From: Sjoerd Venema <srg.venema@gmail.com>
Date: Sun, 25 Feb 2018 11:59:05 +0100
Subject: [Buildroot] Building Kodi; dependencies
Message-ID: <CAPzckP6rcjcRLvdCfPYr5bFUv6JVg6PShaxzq0yirmR41_T3XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using Buildroot for some time now, now decided to make a "Buildroot"
for my Kodi. However, I'm getting stuck at some sort of catch 22 trying to
fulfill all of its dependencies..

*** kodi needs python w/ .py modules, a uClibc or glibc toolchain w/ C++,
threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6 ***
*** kodi needs an OpenGL EGL with either an openGL or an OpenGL ES backend
***

Coming from:

comment "kodi needs python w/ .py modules, a uClibc or glibc toolchain w/
C++, threads, wchar, dynamic library, gcc >= 4.8, host gcc >= 4.6"
depends on BR2_PACKAGE_KODI_ARCH_SUPPORTS
depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS\
|| !BR2_USE_WCHAR || BR2_STATIC_LIBS \
|| !BR2_HOST_GCC_AT_LEAST_4_6 \
|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
|| BR2_TOOLCHAIN_USES_MUSL \
|| !BR2_PACKAGE_PYTHON \
|| BR2_PACKAGE_PYTHON_PYC_ONLY

First off, I assume the ! means a Not, so, for example  !BR2_USE_WCHAR
means that BR2_USE_WCHAR must be [=n]. Correct?

Secondly, can I set all these dependencies via make menuconfig? Or do I
have to configure things outside of that environment?

Now, a "catch 22" seems to be for example: BR2_TOOLCHAIN_HAS_THREADS (must
be false) is selected by BR2_TOOLCHAIN_USES_MUSL (must be true).

What am I missing here? Also, if anyone would have a working Kodi defconfig
for a Raspberry Pi, I'd be very interested ;-)

Thanks!
Sjoerd
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180225/968f7730/attachment.html>
