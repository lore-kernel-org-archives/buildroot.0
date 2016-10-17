From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:06:44 -0300
Subject: [Buildroot] [PATCH 57/93] directfb: use $(HOST_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-58-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/directfb/directfb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index d51094f..595d590 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -161,7 +161,7 @@ HOST_DIRECTFB_CONF_OPTS = \
 	--with-inputdrivers=none
 
 HOST_DIRECTFB_BUILD_CMDS = \
-	$(MAKE) -C $(@D)/tools directfb-csource
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools directfb-csource
 
 HOST_DIRECTFB_INSTALL_CMDS = \
 	$(INSTALL) -m 0755 $(@D)/tools/directfb-csource $(HOST_DIR)/usr/bin
-- 
2.7.3
