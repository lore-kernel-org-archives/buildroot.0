From: Pedro Aguilar <paguilar@paguilar.org>
Date: Thu,  6 Nov 2014 22:48:02 +0100
Subject: [Buildroot] [PATCH v4 0/4] package/guile: New package
Message-ID: <1415310486-25904-1-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch fixes the suggestion made by Jerzy Grzegorek in 
guile and bdwgc.

The patch adds the following:
- libatomic_ops: Add host-autotools-package
- libunistring: Add host-autotools-package
- bdwgc: New package. A garbage collector library for C/C++
- Guile: New package. A progamming language similar to Lisp.

Pedro Aguilar (4):
  libatomic_ops: Add host-autotools-package
  bdwgc: new package
  libunistring: Add host-autotools-package
  guile: new package

 package/Config.in                                  |  2 ++
 package/bdwgc/Config.in                            | 10 ++++++
 package/bdwgc/bdwgc.mk                             | 20 ++++++++++++
 package/guile/Config.in                            | 15 +++++++++
 package/guile/guile-01-fix_arm_endianness.patch    | 25 +++++++++++++++
 .../guile/guile-02-calculate-csqrt_manually.patch  | 16 ++++++++++
 package/guile/guile-03-remove_unused_funcs.patch   | 36 ++++++++++++++++++++++
 package/guile/guile.mk                             | 25 +++++++++++++++
 package/libatomic_ops/libatomic_ops.mk             |  1 +
 package/libunistring/libunistring.mk               |  1 +
 10 files changed, 151 insertions(+)
 create mode 100644 package/bdwgc/Config.in
 create mode 100644 package/bdwgc/bdwgc.mk
 create mode 100644 package/guile/Config.in
 create mode 100644 package/guile/guile-01-fix_arm_endianness.patch
 create mode 100644 package/guile/guile-02-calculate-csqrt_manually.patch
 create mode 100644 package/guile/guile-03-remove_unused_funcs.patch
 create mode 100644 package/guile/guile.mk

-- 
1.9.1
