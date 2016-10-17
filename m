From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:05:58 -0300
Subject: [Buildroot] [PATCH 11/93] lz4: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-12-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/lz4/lz4.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index f96e279..9d7f56b 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -18,11 +18,11 @@ LZ4_POST_PATCH_HOOKS += LZ4_DISABLE_SHARED
 endif
 
 define HOST_LZ4_BUILD_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D)
 endef
 
 define HOST_LZ4_INSTALL_CMDS
-	$(MAKE) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR)/usr \
+	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) PREFIX=$(HOST_DIR)/usr \
 		install -C $(@D)
 endef
 
-- 
2.7.3
