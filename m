From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:08 -0300
Subject: [Buildroot] [PATCH 01/51] lsof: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-2-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/lsof/lsof.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 312d834..e5cd4bc 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -47,7 +47,7 @@ define LSOF_CONFIGURE_CMDS
 endef
 
 define LSOF_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" -C $(@D)
 endef
 
 define LSOF_INSTALL_TARGET_CMDS
-- 
2.7.3
