From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 13:08:10 +0100
Subject: [Buildroot] [git commit] lame: also disable debug handling on xtensa
Message-ID: <20141201121110.E95E67FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b2375e3e0fa68d2f04a723179ccb0a8765daaa4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Similar to the other architectures we have disabled it for. At the same time
also adjust the comment as we now do this for several other architectures.

Fixes http://autobuild.buildroot.net/results/b7e/b7e466580561e32fb584399e5914cd61a37bf7e9/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lame/lame.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index e9d5d73..7eb9e2f 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -17,9 +17,9 @@ LAME_LICENSE_FILES = COPYING
 # Building lame with debug symbols needs the following macros to be
 # defined: _FPU_MASK_IM, _FPU_MASK_ZM, _FPU_MASK_OM.
 # So, if BR2_ENABLE_DEBUG is selected, then we have force lame to be
-# built without debug symbols for Aarch64 and MIPS because these
-# architectures don't have those macros defined.
-ifeq ($(BR2_ENABLE_DEBUG)$(BR2_aarch64)$(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el),yy)
+# built without debug symbols because these architectures don't have
+# those macros defined.
+ifeq ($(BR2_ENABLE_DEBUG)$(BR2_aarch64)$(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_xtensa),yy)
 LAME_CONF_OPTS += --disable-debug
 endif
 
