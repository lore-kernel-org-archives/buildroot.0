From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 25 Oct 2019 17:12:56 +0200
Subject: [Buildroot] [git commit] package/lld: bump to version 9.0.0
Message-ID: <20191025160946.3A47D870D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a22e56870fb84a7d21b69f6c7f3f18bb34f6c5d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since v9.0.0, it was relicensed to the Apache License 2.0 with
LLVM Exceptions. Update the license file hash.

lld package must use the same version as llvm package.

llvm 9.0.0 renamed some define that break the build for lld <= 8.0.0.
https://github.com/llvm-mirror/lld/commit/66fca3a6b8cc0112a4c72237ffaea5eb4b659e3f

Fixes:
http://autobuild.buildroot.org/results/9a0/9a0534c4206b40963d32494ff9675543e78125d1

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lld/lld.hash | 4 ++--
 package/lld/lld.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lld/lld.hash b/package/lld/lld.hash
index dfbb290cf4..3d5a3feb9a 100644
--- a/package/lld/lld.hash
+++ b/package/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 9caec8ec922e32ffa130f0fb08e4c5a242d7e68ce757631e425e9eba2e1a6e37  lld-8.0.0.src.tar.xz
-sha256 f0502d2d0e19748c534ee95ea486c092273303dbef76404c8b17dc8bf6ca441b  LICENSE.TXT
+sha256 31c6748b235d09723fb73fea0c816ed5a3fab0f96b66f8fbc546a0fcc8688f91  lld-9.0.0.src.tar.xz
+sha256 f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/lld/lld.mk b/package/lld/lld.mk
index a023159e17..c30e5f0aac 100644
--- a/package/lld/lld.mk
+++ b/package/lld/lld.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LLD_VERSION = 8.0.0
+LLD_VERSION = 9.0.0
 LLD_SITE = https://llvm.org/releases/$(LLD_VERSION)
 LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
-LLD_LICENSE = NCSA
+LLD_LICENSE = Apache-2.0 with exceptions
 LLD_LICENSE_FILES = LICENSE.TXT
 LLD_SUPPORTS_IN_SOURCE_BUILD = NO
 HOST_LLD_DEPENDENCIES = host-llvm
