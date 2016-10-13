From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:55 -0300
Subject: [Buildroot] [PATCH 48/51] duma: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-49-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/duma/duma.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/duma/duma.mk b/package/duma/duma.mk
index 5e862ab..a8348b9 100644
--- a/package/duma/duma.mk
+++ b/package/duma/duma.mk
@@ -18,18 +18,18 @@ DUMA_OPTIONS = \
 # The dependency of some source files in duma_config.h, which is generated at
 # build time, is not specified in the Makefile. Force non-parallel build.
 define DUMA_BUILD_CMDS
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS)       \
+	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS)       \
 		OS=linux \
 		DUMA_OPTIONS="$(DUMA_OPTIONS)"   \
 		$(DUMA_CPP) -C $(@D)
 endef
 
 define DUMA_INSTALL_STAGING_CMDS
-	$(MAKE) OS=linux prefix=$(STAGING_DIR)/usr install -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) OS=linux prefix=$(STAGING_DIR)/usr install -C $(@D)
 endef
 
 define DUMA_INSTALL_TARGET_CMDS
-	$(MAKE) OS=linux prefix=$(TARGET_DIR)/usr install -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) OS=linux prefix=$(TARGET_DIR)/usr install -C $(@D)
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
