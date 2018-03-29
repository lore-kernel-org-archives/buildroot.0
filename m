From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Mar 2018 21:20:55 +0200
Subject: [Buildroot] [git commit] e2fsprogs: bump to version 1.44.1
Message-ID: <20180329192148.050A983DE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28dd2f2896bff7b861a4272fa343e3f7fa80725c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes (https://lwn.net/Articles/750103/):

E2fsprogs 1.44.0 introduced a regression introduced which caused e2fsck
to fail to support HTree directories on big-endian systems.  Fix how we
read block numbers for internal htree nodes.

Removed a potential memory leak from fsck.

E2image now correctly creates e2image files for bigalloc file systems.

Dumpe2fs and debugfs now correctly support e2image files for file
systems that have the meta_bg option enabled.

E2fsck and debugfs now correctly handle delete inodes (including
processing the orphaned inode list in the case of e2fsck) for bigalloc
file systems.  (Addresses Google Bug: #73795618)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/e2fsprogs/e2fsprogs.hash | 4 ++--
 package/e2fsprogs/e2fsprogs.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/e2fsprogs/e2fsprogs.hash b/package/e2fsprogs/e2fsprogs.hash
index 812dfbe320..60498db8e4 100644
--- a/package/e2fsprogs/e2fsprogs.hash
+++ b/package/e2fsprogs/e2fsprogs.hash
@@ -1,5 +1,5 @@
-# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.44.0/sha256sums.asc
-sha256 a3567042f03fcee0e01db8f923b24cec92e2ba5b11f8e39e245672ad5392723d  e2fsprogs-1.44.0.tar.xz
+# From https://www.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.44.1/sha256sums.asc
+sha256 0ca164c1c87724df904c918b2d7051ef989b51de725db66c67514dbe6dd2b9ef  e2fsprogs-1.44.1.tar.xz
 # Locally calculated
 sha256 680f852df303874fe9c722283a7da571ae9a0477768df8af1e363298e2adc51e  NOTICE
 sha256 032989b508f1a72ebee5b3417e55d06d473f9ee203e45ab11864a7e49cdec63d  lib/ss/mit-sipb-copyright.h
diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
index e9dff32abc..ce7736c1cd 100644
--- a/package/e2fsprogs/e2fsprogs.mk
+++ b/package/e2fsprogs/e2fsprogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-E2FSPROGS_VERSION = 1.44.0
+E2FSPROGS_VERSION = 1.44.1
 E2FSPROGS_SOURCE = e2fsprogs-$(E2FSPROGS_VERSION).tar.xz
 E2FSPROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/tytso/e2fsprogs/v$(E2FSPROGS_VERSION)
 E2FSPROGS_LICENSE = GPL-2.0, MIT-like with advertising clause (libss and libet)
