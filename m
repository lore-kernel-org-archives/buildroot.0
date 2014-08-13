From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Aug 2014 19:51:26 +0200
Subject: [Buildroot] [PATCH 0/4] Fix C++ 11 support (bug #7250)
Message-ID: <1407952290-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of four patches are identical: they fix bug #7250 by making
C++ 11 support available even for uClibc toolchains. The four patches
are related to the four gcc versions: 4.7, 4.8, 4.9 and 4.8-arc.

I consider the older gcc versions as being somewhat deprecated, so I
didn't bother creating the same patches. If that's needed, let me
know, and I'll do the work.

Thanks,

Thomas

Thomas Petazzoni (4):
  gcc/4.7: add patch to enable more C++ features with uClibc
  gcc/4.8: add patch to enable more C++ features with uClibc
  gcc/4.9: add patch to enable more C++ features with uClibc
  gcc/arc-4.8-R3: add patch to enable more C++ features with uClibc

 package/gcc/4.7.4/302-c99-snprintf.patch           |  13 -
 package/gcc/4.7.4/850-libstdcxx-uclibc-c99.patch   | 273 +++++++++++++++++++++
 package/gcc/4.8.3/302-c99-snprintf.patch           |  13 -
 package/gcc/4.8.3/850-libstdcxx-uclibc-c99.patch   | 273 +++++++++++++++++++++
 package/gcc/4.9.1/302-c99-snprintf.patch           |  13 -
 package/gcc/4.9.1/850-libstdcxx-uclibc-c99.patch   | 273 +++++++++++++++++++++
 .../gcc/arc-4.8-R3/100-libstdcxx-uclibc-c99.patch  | 273 +++++++++++++++++++++
 7 files changed, 1092 insertions(+), 39 deletions(-)
 delete mode 100644 package/gcc/4.7.4/302-c99-snprintf.patch
 create mode 100644 package/gcc/4.7.4/850-libstdcxx-uclibc-c99.patch
 delete mode 100644 package/gcc/4.8.3/302-c99-snprintf.patch
 create mode 100644 package/gcc/4.8.3/850-libstdcxx-uclibc-c99.patch
 delete mode 100644 package/gcc/4.9.1/302-c99-snprintf.patch
 create mode 100644 package/gcc/4.9.1/850-libstdcxx-uclibc-c99.patch
 create mode 100644 package/gcc/arc-4.8-R3/100-libstdcxx-uclibc-c99.patch

-- 
2.0.0
