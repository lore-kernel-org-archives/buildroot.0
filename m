From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 17 Mar 2015 02:30:26 +0300
Subject: [Buildroot] [PATCH 0/2] uclibc: fix getsubopt issues
Message-ID: <1426548628-29644-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this series fixes UCLIBC_HAS_GNU_GETSUBOPT handling in uClibc-0.9.33.2,
bringing it in sync with uClibc and uClibc-ng tips and enables
UCLIBC_HAS_GNU_GETSUBOPT in all uClibc configs, which fixes build of
packages that use getsubopt unconoditionally.

Max Filippov (2):
  uclibc: Fix getopt implementations conditional compilation
  uclibc: enable UCLIBC_HAS_GNU_GETSUBOPT in all configs

 ...t-implementations-conditional-compilation.patch |   58 ++++++++++++++++++++
 package/uclibc/uClibc-0.9.33.config                |    2 +-
 package/uclibc/uClibc-ng.config                    |    2 +-
 package/uclibc/uClibc-snapshot.config              |    2 +-
 4 files changed, 61 insertions(+), 3 deletions(-)
 create mode 100644 package/uclibc/0.9.33.2/0068-Fix-getopt-implementations-conditional-compilation.patch

-- 
1.7.7.6
