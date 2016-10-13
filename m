From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:34 -0300
Subject: [Buildroot] [PATCH 27/51] ti-utils: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-28-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/ti-utils/ti-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-utils/ti-utils.mk b/package/ti-utils/ti-utils.mk
index 06aca6d..cfb0cb8 100644
--- a/package/ti-utils/ti-utils.mk
+++ b/package/ti-utils/ti-utils.mk
@@ -14,7 +14,7 @@ TI_UTILS_CFLAGS = `$(PKG_CONFIG_HOST_BINARY) --cflags libnl-genl-3.0`
 TI_UTILS_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs libnl-genl-3.0`
 
 define TI_UTILS_BUILD_CMDS
-	$(MAKE1) NFSROOT="$(STAGING_DIR)" \
+	$(TARGET_MAKE_ENV) $(MAKE1) NFSROOT="$(STAGING_DIR)" \
 		CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(TI_UTILS_CFLAGS)" \
 		LIBS="$(TI_UTILS_LIBS)" -C $(@D) all
 endef
-- 
2.7.3
