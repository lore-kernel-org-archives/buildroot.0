From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed,  8 Dec 2010 10:53:55 +0100
Subject: [Buildroot] [PATCH 03/17] hostapd: ensure hostapd binaries are
	installed in the right place
In-Reply-To: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1291802049-18764-4-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Ensure hostapd and hostapd_cli are installed in /usr/bin/ even if the
directory does not exist.

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/hostapd/hostapd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 27689b8..148db63 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -85,8 +85,10 @@ define HOSTAPD_CONFIGURE_CMDS
 endef
 
 define HOSTAPD_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/sbin
 	$(INSTALL) -m 0755 $(@D)/$(HOSTAPD_SUBDIR)/hostapd \
 		$(TARGET_DIR)/usr/sbin
+	mkdir -p $(TARGET_DIR)/usr/bin
 	$(INSTALL) -m 0755 $(@D)/$(HOSTAPD_SUBDIR)/hostapd_cli \
 		$(TARGET_DIR)/usr/bin
 endef
-- 
1.7.2.3
