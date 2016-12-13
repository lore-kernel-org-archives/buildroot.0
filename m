From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Dec 2016 16:27:34 +0100
Subject: [Buildroot] [git commit] zlib: use $(HOST_MAKE_ENV) when calling
	$(MAKE1)
Message-ID: <20161213152759.6D93380D9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa9a838364c7d60fd32eb265a88dea17a2be8324
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zlib/zlib.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib/zlib.mk b/package/zlib/zlib.mk
index d00ca75..53eb84e 100644
--- a/package/zlib/zlib.mk
+++ b/package/zlib/zlib.mk
@@ -48,7 +48,7 @@ define ZLIB_BUILD_CMDS
 endef
 
 define HOST_ZLIB_BUILD_CMDS
-	$(MAKE1) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D)
 endef
 
 define ZLIB_INSTALL_STAGING_CMDS
@@ -70,7 +70,7 @@ ZLIB_POST_INSTALL_STAGING_HOOKS += ZLIB_RM_STATIC_STAGING
 endif
 
 define HOST_ZLIB_INSTALL_CMDS
-	$(MAKE1) -C $(@D) LDCONFIG=true install
+	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) LDCONFIG=true install
 endef
 
 $(eval $(generic-package))
