From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:19 -0300
Subject: [Buildroot] [PATCH 32/93] tidsp-binaries: use $(TARGET_MAKE_ENV)
	when calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-33-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/tidsp-binaries/tidsp-binaries.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tidsp-binaries/tidsp-binaries.mk b/package/tidsp-binaries/tidsp-binaries.mk
index bc542cd..9736bc7 100644
--- a/package/tidsp-binaries/tidsp-binaries.mk
+++ b/package/tidsp-binaries/tidsp-binaries.mk
@@ -10,7 +10,7 @@ TIDSP_BINARIES_LICENSE = TI Proprietary License
 TIDSP_BINARIES_LICENSE_FILES = LICENSE
 
 define TIDSP_BINARIES_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
