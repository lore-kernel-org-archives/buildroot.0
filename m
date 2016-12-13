From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Tue, 13 Dec 2016 11:50:45 -0300
Subject: [Buildroot] [PATCH 2/2] zlib: use $(HOST_MAKE_ENV) when calling
	$(MAKE1)
In-Reply-To: <20161213145045.22768-1-gustavo.zacarias@free-electrons.com>
References: <20161213145045.22768-1-gustavo.zacarias@free-electrons.com>
Message-ID: <20161213145045.22768-2-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
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
-- 
2.10.2
