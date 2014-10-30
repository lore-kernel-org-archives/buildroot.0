From: Andreas Larsson <andreas@gaisler.com>
Date: Thu, 30 Oct 2014 09:29:34 +0100
Subject: [Buildroot] [PATCH 0/2] Clean up leon cpu types and remove gcc 4.4.x
Message-ID: <1414657776-32427-1-git-send-email-andreas@gaisler.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[Resent due to server rejection]

Use -mcpu=leon3 for LEON systems, remove the non-mainline sparcsfleon,
sparchfleon, sparcsfleonv8, and sparchfleonv8 targets, and remove gcc
4.4.x that no longer have any architectures needing it.

Andreas Larsson (2):
  arch: sparc: Add leon3 cpu type and remove sparc{s,h}fleon{,v8}
  gcc: remove version 4.4.x

 Config.in.legacy                                   |    7 +
 arch/Config.in.sparc                               |   15 +-
 package/gcc/4.4.7/100-uclibc-conf.patch            |   13 --
 package/gcc/4.4.7/301-missing-execinfo_h.patch     |   11 -
 package/gcc/4.4.7/302-c99-snprintf.patch           |   13 --
 .../gcc/4.4.7/305-libmudflap-susv3-legacy.patch    |   49 ----
 package/gcc/4.4.7/810-arm-softfloat-libgcc.patch   |   38 ----
 package/gcc/4.4.7/950-sparc-leon.patch             |  239 --------------------
 package/gcc/4.4.7/gcc-44-pr39429.patch             |   24 --
 .../powerpc-link-with-math-lib.patch.conditional   |  137 -----------
 package/gcc/Config.in.host                         |   39 +---
 11 files changed, 14 insertions(+), 571 deletions(-)
 delete mode 100644 package/gcc/4.4.7/100-uclibc-conf.patch
 delete mode 100644 package/gcc/4.4.7/301-missing-execinfo_h.patch
 delete mode 100644 package/gcc/4.4.7/302-c99-snprintf.patch
 delete mode 100644 package/gcc/4.4.7/305-libmudflap-susv3-legacy.patch
 delete mode 100644 package/gcc/4.4.7/810-arm-softfloat-libgcc.patch
 delete mode 100644 package/gcc/4.4.7/950-sparc-leon.patch
 delete mode 100644 package/gcc/4.4.7/gcc-44-pr39429.patch
 delete mode 100644 package/gcc/4.4.7/powerpc-link-with-math-lib.patch.conditional

-- 
1.7.10.4
