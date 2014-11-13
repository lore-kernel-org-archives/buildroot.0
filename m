From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Nov 2014 23:17:22 +0100
Subject: [Buildroot] [PATCH 0/4] Fix locale generation with uClibc,
	and related improvements
Message-ID: <1415917046-14446-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This set of patches fix the locale generation with uClibc: without those fixes, the value in the BR2_GENERATE_LOCALE option is ignored due to a regression introduced by a rework of the main Makefile.

The most important patch is PATCH 2, which does the actual fix. PATCH
1 is a preparatory cleanup. PATCH 3 and 4 are additional minor
improvements to the BR2_GENERATE_LOCALE option logic.

I think this should be considered material for 2014.11.

Best regards,

Thomas

Thomas Petazzoni (4):
  Makefile: use more sensible names for locale related variables
  uclibc: do not use GENERATE_LOCALE
  toolchain: do not allow BR2_GENERATE_LOCALE with musl
  toolchain: do not allow locale generation when locale support is not
    available

 Makefile                      | 10 +++++-----
 package/uclibc/uclibc.mk      |  6 ++++--
 toolchain/toolchain-common.in |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.1.0
