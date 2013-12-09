From: James Hogan <james.hogan@imgtec.com>
Date: Mon, 9 Dec 2013 17:05:02 +0000
Subject: [Buildroot] [PATCH 0/2] uclibc: Add some 0.9.33.2 patches for MIPS
Message-ID: <1386608704-3761-1-git-send-email-james.hogan@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add some of patches from uClibc upstream to fix EFD_NONBLOCK (which
breaks QEMU) and __SIGRTMAX (which breaks GDB) on MIPS.

James Hogan (2):
  uclibc: add patch to fix arch specific eventfd defs
  uclibc: add patches to fix MIPS __SIGRTMAX and SIG127

 ...se-new-bits-scheme-for-arch-specific-flag.patch | 284 +++++++++++++++++++++
 ...-_NSIG-to-128-not-129.-This-matches-glibc.patch |  43 ++++
 ...atus.h-correctly-interpret-status-0x007f-.patch |  54 ++++
 3 files changed, 381 insertions(+)
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0055-Use-new-bits-scheme-for-arch-specific-flag.patch
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0056-MIPS-set-_NSIG-to-128-not-129.-This-matches-glibc.patch
 create mode 100644 package/uclibc/0.9.33.2/uclibc-0057-bits-waitstatus.h-correctly-interpret-status-0x007f-.patch

-- 
1.8.1.2
