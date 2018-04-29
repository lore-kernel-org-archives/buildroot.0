From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 29 Apr 2018 16:17:22 +0200
Subject: [Buildroot] [git commit] speex: remove useless BUILD_CMDS
Message-ID: <20180429142028.8952F8821B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a74f0609b77698f7a9c7537df3c146135ee5fccf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

SPEEX_BUILD_CMDS is useless, because it's exactly defined to the
default value of <pkg>_BUILDS_CMDS for autotools packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/speex/speex.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 1b278ea23d..3c188b631e 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -31,8 +31,4 @@ endef
 
 SPEEX_POST_CONFIGURE_HOOKS += SPEEX_LIBTOOL_FIXUP
 
-define SPEEX_BUILD_CMDS
-	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_MAKE_OPTS) -C $(@D)/$($(PKG)_SUBDIR)
-endef
-
 $(eval $(autotools-package))
