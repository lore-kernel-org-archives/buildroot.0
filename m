From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:31 -0300
Subject: [Buildroot] [PATCH 24/51] poco: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-25-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/poco/poco.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 79452c0..535c9a3 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -58,19 +58,19 @@ define POCO_CONFIGURE_CMDS
 endef
 
 define POCO_BUILD_CMDS
-	$(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
+	$(TARGET_MAKE_ENV) $(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
 		MYSQL_LIBDIR=$(STAGING_DIR)/usr/lib/mysql \
 		MYSQL_INCDIR=$(STAGING_DIR)/usr/include/mysql \
 		DEFAULT_TARGET=$(POCO_MAKE_TARGET) -C $(@D)
 endef
 
 define POCO_INSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(STAGING_DIR) POCO_TARGET_OSARCH=$(ARCH) \
 		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
 endef
 
 define POCO_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
+	$(TARGET_MAKE_ENV) $(MAKE) DESTDIR=$(TARGET_DIR) POCO_TARGET_OSARCH=$(ARCH) \
 		DEFAULT_TARGET=$(POCO_MAKE_TARGET) install -C $(@D)
 endef
 
-- 
2.7.3
