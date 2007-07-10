From: Albert Siersema <albert@friendly.net>
Date: Tue, 10 Jul 2007 17:33:40 +0200
Subject: [Buildroot] buildroot with propolice/SSP
Message-ID: <4693A6D4.9080707@friendly.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: RIPEMD160


Hello,

I tried compiling buildroot (buildroot-20070709.tar.bz2 to be precise) with propolice support.
For starters: is this known to work ?

My uclibc .config contains:

#
# Security options
#
UCLIBC_BUILD_PIE=y
UCLIBC_HAS_ARC4RANDOM=y
# HAVE_NO_SSP is not set
UCLIBC_HAS_SSP=y
# UCLIBC_HAS_SSP_COMPAT is not set
# SSP_QUICK_CANARY is not set
PROPOLICE_BLOCK_ABRT=y
# PROPOLICE_BLOCK_SEGV is not set
UCLIBC_BUILD_SSP=y
UCLIBC_BUILD_RELRO=y
UCLIBC_BUILD_NOW=y
UCLIBC_BUILD_NOEXECSTACK=y

(i'm feeding it to make with UCLIBC_CONFIG_FILE=)

The make however quits with:

make[2]: *** [libc/libc.oS] Error 1
make[1]: *** [lib/libc.so.0] Error 2
make[1]: Leaving directory `buildroot/toolchain_build_i586/uClibc-0.9.29'
make: *** [buildroot/toolchain_build_i586/uClibc-0.9.29/lib/libc.a] Error 2


Host system checks:

CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
INCLUDES clean:                                 Ok
CXXFLAGS clean:                                 Ok
which installed:                                Ok
sed works:                                      Ok (/bin/sed)
GNU make version '3.81':                        Ok
C compiler '/usr/bin/gcc'
C compiler version '4.1.2':                     Ok
C++ compiler '/usr/bin/g++'
C++ compiler version '4.1.2':                   Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
makeinfo installed:                             Ok
Build system dependencies:                      Ok



Anyone have any ideas ?

Cheers,
Albert
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFGk6bUKltZixSsH2QRA/yGAJ9Zjymxmi7R7CvRZZ6NE5fOvOWCpQCdHTqY
EAdu/f/cR+s44RthwmSQF4s=
=OEpn
-----END PGP SIGNATURE-----
