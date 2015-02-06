From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Feb 2015 22:46:21 +0100
Subject: [Buildroot] [git commit] lame: unconditionally disable debug
	handling
Message-ID: <20150206214705.7E8C47F921@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f745590297f8a221db3cda0d2eeeabef2657f460
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As it is also broken on arc, bfin and microblaze and brings very limited
added value.

Fixes:
http://autobuild.buildroot.net/results/643/643d174836457237615b6504e28d7b3c12a37f93/
http://autobuild.buildroot.net/results/831/831f3a03321cea1b753f3e7dd8d3c6354d51d3e7/
http://autobuild.buildroot.net/results/71d/71dc37f9cc56f3f53676f54bf28f2ca101bc4505/
http://autobuild.buildroot.net/results/61f/61f1e956bb433aa80f859b3cf37d374feee1cb0c/

And many more.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lame/lame.mk |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/lame/lame.mk b/package/lame/lame.mk
index 7eb9e2f..e47e0af 100644
--- a/package/lame/lame.mk
+++ b/package/lame/lame.mk
@@ -17,11 +17,9 @@ LAME_LICENSE_FILES = COPYING
 # Building lame with debug symbols needs the following macros to be
 # defined: _FPU_MASK_IM, _FPU_MASK_ZM, _FPU_MASK_OM.
 # So, if BR2_ENABLE_DEBUG is selected, then we have force lame to be
-# built without debug symbols because these architectures don't have
-# those macros defined.
-ifeq ($(BR2_ENABLE_DEBUG)$(BR2_aarch64)$(BR2_arm)$(BR2_armeb)$(BR2_mips)$(BR2_mipsel)$(BR2_mips64)$(BR2_mips64el)$(BR2_xtensa),yy)
+# built without debug symbols because a number of architectures don't
+# have those macros defined.
 LAME_CONF_OPTS += --disable-debug
-endif
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
