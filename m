From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 20:03:53 +0200
Subject: [Buildroot] [git commit] nasm: bump version to 2.10.01,
	remove dummy target package
Message-ID: <20120717181426.046FB7FBA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d09967e0716894b91d27348877467ecba5eccad0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The target package was only present because at the time 'nasm' was
packaged, there was a bug in the package infrastructure that prevented
a package from having a host only variant. This has been fixed since
then, so we can get rid of the useless dummy target package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nasm/nasm.mk |   13 +++----------
 1 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/nasm/nasm.mk b/package/nasm/nasm.mk
index b819df0..9d99209 100644
--- a/package/nasm/nasm.mk
+++ b/package/nasm/nasm.mk
@@ -2,17 +2,10 @@
 #
 # nasm
 #
-# This is special case: nasm is used to build syslinux and
-# pxelinux. As these are for the target, we should cross-compile
-# nasm. However, as nasm is x86-only, there's no point in
-# cross-compiling it. So we just build it for the host. The target
-# variant is only provided because of a bug in the package
-# infrastructure that prevents having only a host variant.
 ############################################################
 
-NASM_VERSION=2.08.01
-NASM_SOURCE=nasm-$(NASM_VERSION).tar.bz2
-NASM_SITE=http://www.nasm.us/pub/nasm/releasebuilds/2.08.01/
+NASM_VERSION = 2.10.01
+NASM_SOURCE  = nasm-$(NASM_VERSION).tar.bz2
+NASM_SITE    = http://www.nasm.us/pub/nasm/releasebuilds/$(NASM_VERSION)
 
-$(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
