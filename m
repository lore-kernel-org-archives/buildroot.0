From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:27 -0300
Subject: [Buildroot] [PATCH 20/51] rtmpdump: use $(TARGET_MAKE_ENV) when
	calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-21-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/rtmpdump/rtmpdump.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/rtmpdump/rtmpdump.mk b/package/rtmpdump/rtmpdump.mk
index ad4308c..2e3428f 100644
--- a/package/rtmpdump/rtmpdump.mk
+++ b/package/rtmpdump/rtmpdump.mk
@@ -38,7 +38,7 @@ RTMPDUMP_MAKE_FLAGS = \
 	$(RTMPDUMP_SHARED)
 
 define RTMPDUMP_BUILD_CMDS
-	$(MAKE) $(RTMPDUMP_MAKE_FLAGS) \
+	$(TARGET_MAKE_ENV) $(MAKE) $(RTMPDUMP_MAKE_FLAGS) \
 		XCFLAGS="$(RTMPDUMP_CFLAGS)" \
 		XLDFLAGS="$(TARGET_LDFLAGS)" \
 		CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -46,11 +46,11 @@ define RTMPDUMP_BUILD_CMDS
 endef
 
 define RTMPDUMP_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR) $(RTMPDUMP_MAKE_FLAGS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/librtmp install DESTDIR=$(STAGING_DIR) $(RTMPDUMP_MAKE_FLAGS)
 endef
 
 define RTMPDUMP_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR) $(RTMPDUMP_MAKE_FLAGS)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/librtmp install DESTDIR=$(TARGET_DIR) $(RTMPDUMP_MAKE_FLAGS)
 endef
 
 $(eval $(generic-package))
-- 
2.7.3
