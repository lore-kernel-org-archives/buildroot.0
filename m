From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 12:36:34 +0200
Subject: [Buildroot] [git commit] binutils: update to the latest ARC version
	by default
Message-ID: <20150630114920.1D0008079C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=89d4a209f5abf71194325a9b91ee561673d31e92
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Following commit 36555b4c8dce27822ecbbed58798f887ad452b18 ("ARC:
switch to RC1 of upcoming arc-2015.06 tools"), the binutils package
only contains the hash information for the 2015.06-rc1 ARC version of
binutils (which is in fact no hash). However, when an external
toolchain is used, and binutils is built for the target, it's still
the old 2014.11 binutils version that gets used in binutils.mk,
causing a build failure because there is no hash available for this
version.

This commit fixes that by using 2015.06-rc1 as the default binutils
version on ARC, which is used when no host-binutils has been built.

Fixes:

  http://autobuild.buildroot.org/results/8f7/8f772e6fccb4f918120a7bb814da2224432d1c09/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 4111583..4ce11da 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -9,7 +9,7 @@
 BINUTILS_VERSION = $(call qstrip,$(BR2_BINUTILS_VERSION))
 ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
-BINUTILS_VERSION = arc-2014.12
+BINUTILS_VERSION = arc-2015.06-rc1
 else
 BINUTILS_VERSION = 2.22
 endif
