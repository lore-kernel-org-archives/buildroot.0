From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Mon, 17 Oct 2016 13:07:17 -0300
Subject: [Buildroot] [PATCH 90/93] turbolua: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476720440-22239-91-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/turbolua/turbolua.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index bf6d491..bf9e27f 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -22,11 +22,11 @@ TURBOLUA_MAKE_OPTS += SSL=none
 endif
 
 define TURBOLUA_BUILD_CMDS
-	$(MAKE) $(TURBOLUA_MAKE_OPTS) -C $(@D) all
+	$(TARGET_MAKE_ENV) $(MAKE) $(TURBOLUA_MAKE_OPTS) -C $(@D) all
 endef
 
 define TURBOLUA_INSTALL_TARGET_CMDS
-	$(MAKE) $(TURBOLUA_MAKE_OPTS) LDCONFIG=true \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TURBOLUA_MAKE_OPTS) LDCONFIG=true \
 		PREFIX="$(TARGET_DIR)/usr" -C $(@D) install
 endef
 
-- 
2.7.3
