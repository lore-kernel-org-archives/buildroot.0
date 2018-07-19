From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Date: Thu, 19 Jul 2018 13:02:00 +0200
Subject: [Buildroot] [PATCH v2 0/3] Hardening build flags fixes
Message-ID: <1531998123-28360-1-git-send-email-stefan.sorensen@spectralink.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series provides a number of fixes and cleanups of the build flags
releated to hardened builds.

Changes v1->v2:
  * Drop patch removing linker flags from TARGET_CFLAGS
  * Use a single spec file for compiler and linker flags

Stefan S?rensen (3):
  package/Makefile.in: Do not use CPPFLAGS for hardening options
  package/Makefile.in: Add missing options to LDFLAGS for full RELRO
    build
  package/Makefile.in: Use gcc spec files for PIE build flags

 package/Makefile.in     | 18 +++++++++---------
 toolchain/gcc-specs-pie |  5 +++++
 2 files changed, 14 insertions(+), 9 deletions(-)
 create mode 100644 toolchain/gcc-specs-pie

-- 
1.8.3.1
