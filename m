From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:11 -0300
Subject: [Buildroot] [PATCH 04/51] lz4: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-5-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/lz4/lz4.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index a5a41d3..f96e279 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -27,16 +27,16 @@ define HOST_LZ4_INSTALL_CMDS
 endef
 
 define LZ4_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lib
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/lib
 endef
 
 define LZ4_INSTALL_STAGING_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
 		PREFIX=/usr install -C $(@D)
 endef
 
 define LZ4_INSTALL_TARGET_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
 		PREFIX=/usr install -C $(@D)/lib
 endef
 
-- 
2.7.3
