From: Will Newton <will.newton@gmail.com>
Date: Mon, 7 Mar 2011 17:51:58 +0000
Subject: [Buildroot] gcc 4.2.4 libstdc++ locale support
Message-ID: <AANLkTi=2d0MJicfXHAHnHCM7WUCpsb9ip87AmGtrghUq@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I recently tried to build a toolchain with a combination of gcc 4.2.4,
C++ support and locale support but it failed to build.

The problem seems to be caused by some patches that are applied to
libstdc++ which are no longer compatible with the headers that current
uClibc is installing. I removed the patches and the build proceeds,
although I have no idea if any of the functionality is broken. The
patches are:

toolchain/gcc/4.2.4/200-uclibc-locale.patch
toolchain/gcc/4.2.4/203-uclibc-locale-no__x.patch
toolchain/gcc/4.2.4/204-uclibc-locale-wchar_fix.patch
toolchain/gcc/4.2.4/205-uclibc-locale-update.patch
toolchain/gcc/4.2.4/306-libstdc++-namespace.patch

Does anybody recall what they do or why they are needed?

Thanks,
