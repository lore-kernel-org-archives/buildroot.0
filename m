From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:17 -0300
Subject: [Buildroot] [PATCH 10/51] pifmrds: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-11-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/pifmrds/pifmrds.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pifmrds/pifmrds.mk b/package/pifmrds/pifmrds.mk
index 5179715..a30c013 100644
--- a/package/pifmrds/pifmrds.mk
+++ b/package/pifmrds/pifmrds.mk
@@ -11,7 +11,7 @@ PIFMRDS_LICENSE = GPLv3+
 PIFMRDS_LICENSE_FILES = LICENSE
 
 define PIFMRDS_BUILD_CMDS
-	$(MAKE) -C $(@D)/src CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/src CC="$(TARGET_CC)" LDFLAGS="$(TARGET_LDFLAGS)" \
 		CFLAGS="$(TARGET_CFLAGS) -std=gnu99 -ffast-math -c" \
 		app rds_wav
 endef
-- 
2.7.3
