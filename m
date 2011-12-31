From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 31 Dec 2011 15:07:07 +0100
Subject: [Buildroot] [pull request v3] Pull request for branch
	for-2012.02/valgrind-bump
Message-ID: <cover.1325340331.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a single patch that bumps Valgrind to 3.7.0 and also fixes the
build of Valgrind when the ccache support is enabled.

Changes since v2:

 * Removed the valgrind-3.7.0-readstab-fix.patch, which was a
   tentative to fix the missing a.out.h problem on PowerPC, but it
   doesn't work. The build of Valgrind on PowerPC still fails, but it
   is not a regression introduced by the version bump. Thanks to
   Belisko Marek for testing and reporting!

Changes since v1:

 * Fixed my Git branch to only include this patch and not something
   else.

Thomas

The following changes since commit ef3fe1bef6581c66af3858d540343e011cb9fdd6:

  cdrkit: bump to version 1.1.11 and adjust style (2011-12-21 23:02:31 +0100)

are available in the git repository at:
  http://free-electrons.com/~thomas/buildroot.git for-2012.02/valgrind-bump

Thomas Petazzoni (1):
      valgrind: bump to 3.7.0 and fix build with ccache

 .../valgrind-3.6.1-configure-support-linux-3.patch |   30 --------
 .../valgrind/valgrind-3.7.0-compiler-check.patch   |   76 ++++++++++++++++++++
 .../valgrind-3.7.0-fix-ccache-support.patch        |   51 +++++++++++++
 ...gefile.patch => valgrind-3.7.0-largefile.patch} |   22 +++---
 ...ctls.patch => valgrind-3.7.0-more-ioctls.patch} |   34 +++++-----
 ...valgrind-3.7.0-workaround-SIGSEGV-on-PPC.patch} |   15 ++---
 package/valgrind/valgrind.mk                       |    3 +-
 7 files changed, 162 insertions(+), 69 deletions(-)
 delete mode 100644 package/valgrind/valgrind-3.6.1-configure-support-linux-3.patch
 create mode 100644 package/valgrind/valgrind-3.7.0-compiler-check.patch
 create mode 100644 package/valgrind/valgrind-3.7.0-fix-ccache-support.patch
 rename package/valgrind/{valgrind-3.6.1-largefile.patch => valgrind-3.7.0-largefile.patch} (71%)
 rename package/valgrind/{valgrind-3.6.1-more-ioctls.patch => valgrind-3.7.0-more-ioctls.patch} (90%)
 rename package/valgrind/{valgrind-3.6.1-workaround-SIGSEGV-on-PPC.patch => valgrind-3.7.0-workaround-SIGSEGV-on-PPC.patch} (60%)

Thanks,
-- 
Thomas Petazzoni
