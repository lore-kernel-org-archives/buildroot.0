From: Pedro Aguilar <paguilar@paguilar.org>
Date: Mon,  3 Nov 2014 01:34:07 +0100
Subject: [Buildroot] [PATCH v2 0/4] package/guile: New package
Message-ID: <1414974851-4819-1-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch should fix all the suggestions made by Yann Morin.
It adds the following:
- libatomic_ops: Add host-autotools-package
- libunistring: Add host-autotools-package
- bdwgc: A garbage collector library for C/C++
- Guile: A progamming language similar to Lisp.

Thanks!

Pedro Aguilar (4):
  libatomic_ops: Add host-autotools-package
  bdwgc: new package
  libunistring: Add host-autotools-package
  guile: new package

 package/Config.in                                  |  2 ++
 package/bdwgc/Config.in                            | 11 ++++++++
 package/bdwgc/bdwgc.mk                             | 19 +++++++++++++
 package/guile/Config.in                            | 17 ++++++++++++
 package/guile/guile-01-fix_arm_endianness.patch    | 19 +++++++++++++
 .../guile/guile-02-calculate-csqrt_manually.patch  | 17 ++++++++++++
 .../guile-03-undef_use_gnu_local_locale_api.patch  | 16 +++++++++++
 package/guile/guile.mk                             | 32 ++++++++++++++++++++++
 package/libatomic_ops/libatomic_ops.mk             |  1 +
 package/libunistring/libunistring.mk               |  1 +
 10 files changed, 135 insertions(+)
 create mode 100644 package/bdwgc/Config.in
 create mode 100644 package/bdwgc/bdwgc.mk
 create mode 100644 package/guile/Config.in
 create mode 100644 package/guile/guile-01-fix_arm_endianness.patch
 create mode 100644 package/guile/guile-02-calculate-csqrt_manually.patch
 create mode 100644 package/guile/guile-03-undef_use_gnu_local_locale_api.patch
 create mode 100644 package/guile/guile.mk

-- 
1.9.1
