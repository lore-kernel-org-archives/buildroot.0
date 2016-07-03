From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jul 2016 13:00:25 +0200
Subject: [Buildroot] [git commit] toolchain-external: remove SOURCE/SITE for
	locally available toolchain
Message-ID: <20160703111601.333758015F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a0aa7e0e1750f6ace2879ea8adb1425a41431b79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When the custom external toolchain is locally available, we currently
define SITE/SOURCE to empty variables. Now that the package
infrastructure doesn't define a value for SOURCE when VERSION is empty,
it doesn't attempt to download a file anymore, so we can get rid of
those empty SOURCE/SITE variables in the toolchain-external package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-external/toolchain-external.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 7f46234..342bc84 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -453,14 +453,6 @@ TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= \
 	$(subst -i686-pc-linux-gnu.tar.bz2,.src.tar.bz2,$(subst -i686-pc-linux-gnu-i386-linux.tar.bz2,-i686-pc-linux-gnu.src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE)))
 endif
 
-# In fact, we don't need to download the toolchain, since it is already
-# available on the system, so force the site and source to be empty so
-# that nothing will be downloaded/extracted.
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED),y)
-TOOLCHAIN_EXTERNAL_SITE =
-TOOLCHAIN_EXTERNAL_SOURCE =
-endif
-
 TOOLCHAIN_EXTERNAL_ADD_TOOLCHAIN_DEPENDENCY = NO
 
 TOOLCHAIN_EXTERNAL_INSTALL_STAGING = YES
