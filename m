From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:09 -0300
Subject: [Buildroot] [PATCH 02/51] wf111: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-3-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/wf111/wf111.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
index e17e846..ad9d891 100644
--- a/package/wf111/wf111.mk
+++ b/package/wf111/wf111.mk
@@ -25,7 +25,7 @@ endif
 # separately the build step and the install step and get a correct
 # behavior. So we do everything in the install step.
 define WF111_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PWD=$(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PWD=$(@D) \
 		$(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) \
 		OUTPUT=$(TARGET_DIR) install_static
 endef
-- 
2.7.3
