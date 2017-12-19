From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Date: Tue, 19 Dec 2017 16:58:31 -0500
Subject: [Buildroot] package "expat" fails to build without a C++ compiler
Message-ID: <20171219215831.4rlfcixr32ocr7tg@workotop.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


I tried to build an image with the "expat" package in it, using a
toolchain without a C++ compiler. It fails with the following error:

  configure: error: in `/home/dkc/src/buildroot/build/build/expat-2.2.4':
  configure: error: C++ preprocessor "/lib/cpp" fails sanity check

Enabling C++ support fixed that error.

It's weird because the C++ preprocessor is supposed to checked by the
AC_PROG_CXXCPP macro, which is not present in configure.ac, but maybe
that macro is implied with recent versions of autotools when using
AC_PROG_CXX?

Anyways, should "expat" depends on BR2_INSTALL_LIBSTDCP?


Thank you,
-- 
Damien
