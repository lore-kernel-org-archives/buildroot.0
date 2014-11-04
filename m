From: Pedro Aguilar <paguilar@paguilar.org>
Date: Wed,  5 Nov 2014 00:28:25 +0100
Subject: [Buildroot] [PATCH v3 0/4] package/guile: New package
Message-ID: <1415143709-10963-1-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch should fix all the suggestions made by Thomas and Arnout for 
guile and bdwgc, respectively.

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
 package/bdwgc/Config.in                            | 11 +++++++
 package/bdwgc/bdwgc.mk                             | 21 +++++++++++++
 package/guile/Config.in                            | 15 +++++++++
 package/guile/guile-01-fix_arm_endianness.patch    | 25 +++++++++++++++
 .../guile/guile-02-calculate-csqrt_manually.patch  | 16 ++++++++++
 package/guile/guile-03-remove_unused_funcs.patch   | 36 ++++++++++++++++++++++
 package/guile/guile.mk                             | 26 ++++++++++++++++
 package/libatomic_ops/libatomic_ops.mk             |  1 +
 package/libunistring/libunistring.mk               |  1 +
 10 files changed, 154 insertions(+)
 create mode 100644 package/bdwgc/Config.in
 create mode 100644 package/bdwgc/bdwgc.mk
 create mode 100644 package/guile/Config.in
 create mode 100644 package/guile/guile-01-fix_arm_endianness.patch
 create mode 100644 package/guile/guile-02-calculate-csqrt_manually.patch
 create mode 100644 package/guile/guile-03-remove_unused_funcs.patch
 create mode 100644 package/guile/guile.mk

-- 
1.9.1
