From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 18:37:57 +0200
Subject: [Buildroot] [PATCHv2 0/7] Toolchain fixes
Message-ID: <1408120684-18295-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a new version of the patch series with toolchain
fixes. It fixes bugs #7208 and #7250. Changes since v1:

 - Fix minor typo noticed by Thomas DS in the commit log of the first
   four patches.

 - Add three patches to fix bug #7208.

Those patches are aimed for 2014.08.

Thanks,

Thomas

Thomas Petazzoni (7):
  gcc/4.7: add patch to enable more C++ features with uClibc
  gcc/4.8: add patch to enable more C++ features with uClibc
  gcc/4.9: add patch to enable more C++ features with uClibc
  gcc/arc-4.8-R3: add patch to enable more C++ features with uClibc
  gcc/4.7: fix C++ exceptions and pthread_exit()
  gcc/4.8: fix C++ exceptions and pthread_exit()
  gcc/4.9: fix C++ exceptions and pthread_exit()

 package/gcc/4.7.4/302-c99-snprintf.patch           |  13 -
 package/gcc/4.7.4/850-libstdcxx-uclibc-c99.patch   | 273 +++++++++++++++++++++
 package/gcc/4.7.4/900-musl-support.patch           |  61 ++---
 package/gcc/4.8.3/302-c99-snprintf.patch           |  13 -
 package/gcc/4.8.3/850-libstdcxx-uclibc-c99.patch   | 273 +++++++++++++++++++++
 package/gcc/4.8.3/900-musl-support.patch           | 213 ++++++++--------
 package/gcc/4.9.1/302-c99-snprintf.patch           |  13 -
 package/gcc/4.9.1/850-libstdcxx-uclibc-c99.patch   | 273 +++++++++++++++++++++
 package/gcc/4.9.1/900-musl-support.patch           |  66 ++---
 .../gcc/arc-4.8-R3/100-libstdcxx-uclibc-c99.patch  | 273 +++++++++++++++++++++
 10 files changed, 1246 insertions(+), 225 deletions(-)
 delete mode 100644 package/gcc/4.7.4/302-c99-snprintf.patch
 create mode 100644 package/gcc/4.7.4/850-libstdcxx-uclibc-c99.patch
 delete mode 100644 package/gcc/4.8.3/302-c99-snprintf.patch
 create mode 100644 package/gcc/4.8.3/850-libstdcxx-uclibc-c99.patch
 delete mode 100644 package/gcc/4.9.1/302-c99-snprintf.patch
 create mode 100644 package/gcc/4.9.1/850-libstdcxx-uclibc-c99.patch
 create mode 100644 package/gcc/arc-4.8-R3/100-libstdcxx-uclibc-c99.patch

-- 
2.0.0
