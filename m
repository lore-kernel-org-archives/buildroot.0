From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:24 -0300
Subject: [Buildroot] [PATCH 37/93] 4th: use $(HOST_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-38-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/4th/4th.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/4th/4th.mk b/package/4th/4th.mk
index 7828592..0d82614 100644
--- a/package/4th/4th.mk
+++ b/package/4th/4th.mk
@@ -54,14 +54,14 @@ define 4TH_INSTALL_TARGET_CMDS
 endef
 
 define HOST_4TH_BUILD_CMDS
-	$(MAKE) -C $(@D)/sources all \
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/sources all \
 		CFLAGS="$(HOST_CFLAGS) -DUNIX -fsigned-char"
 endef
 
 define HOST_4TH_INSTALL_CMDS
 	mkdir -p $(HOST_DIR)/usr/bin
 	mkdir -p $(HOST_DIR)/usr/lib
-	$(MAKE) -C $(@D)/sources mostlyinstall \
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/sources mostlyinstall \
 		BINARIES=$(HOST_DIR)/usr/bin \
 		LIBRARIES=$(HOST_DIR)/usr/lib
 endef
-- 
2.7.3
