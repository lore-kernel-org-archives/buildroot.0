From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:34 -0300
Subject: [Buildroot] [PATCH 47/93] dmalloc: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-48-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/dmalloc/dmalloc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dmalloc/dmalloc.mk b/package/dmalloc/dmalloc.mk
index ffa9a39..6ebb44c 100644
--- a/package/dmalloc/dmalloc.mk
+++ b/package/dmalloc/dmalloc.mk
@@ -48,7 +48,7 @@ DMALLOC_POST_PATCH_HOOKS += DMALLOC_POST_PATCH
 
 # both DESTDIR and PREFIX are ignored..
 define DMALLOC_INSTALL_STAGING_CMDS
-	$(MAKE) includedir="$(STAGING_DIR)/usr/include" \
+	$(TARGET_MAKE_ENV) $(MAKE) includedir="$(STAGING_DIR)/usr/include" \
 		bindir="$(STAGING_DIR)/usr/bin" \
 		libdir="$(STAGING_DIR)/usr/lib" \
 		shlibdir="$(STAGING_DIR)/usr/lib" \
-- 
2.7.3
