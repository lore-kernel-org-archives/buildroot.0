From: Pedro Aguilar <paguilar@paguilar.org>
Date: Sun,  2 Nov 2014 16:15:43 +0100
Subject: [Buildroot] [PATCH 0/2] package/guile: New package
Message-ID: <1414941345-16581-1-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a couple of things:
- bdwgc: A garbage collector library for C/C++
- Guile: A progamming language similar to Lisp.
bdwgc was the last requirement needed by Guile that was not included by 
buildroot. Could you please check the LICENSE type for this library since
I didn't find a clear/specific reference to it? 

Guile needs a host Guile for building, so it first builds 
host-guile and then guile for the target with its respective patches.

Thanks.

Pedro Aguilar (2):
  Add package bdwgc: A garbage collector for C and C++. The
    Boehm-Demers-Weiser conservative garbage collector can be used as a
    garbage collecting replacement for C 'malloc' or C++ 'new'.
  Add guile programming language: Guile is an interpreter and compiler
    for the Scheme programming language, a clean and elegant dialect of
    Lisp.

 package/Config.in                                  |  2 ++
 package/bdwgc/Config.in                            |  9 +++++++
 package/bdwgc/bdwgc.mk                             | 18 ++++++++++++++
 package/guile/Config.in                            | 14 +++++++++++
 package/guile/guile-001-fix_arm_endianness.patch   | 13 ++++++++++
 .../guile/guile-002-calculate-csqrt_manually.patch | 11 +++++++++
 .../guile-003-undef_use_gnu_local_locale_api.patch | 11 +++++++++
 package/guile/guile.mk                             | 28 ++++++++++++++++++++++
 8 files changed, 106 insertions(+)
 create mode 100644 package/bdwgc/Config.in
 create mode 100644 package/bdwgc/bdwgc.mk
 create mode 100644 package/guile/Config.in
 create mode 100644 package/guile/guile-001-fix_arm_endianness.patch
 create mode 100644 package/guile/guile-002-calculate-csqrt_manually.patch
 create mode 100644 package/guile/guile-003-undef_use_gnu_local_locale_api.patch
 create mode 100644 package/guile/guile.mk

-- 
1.9.1
