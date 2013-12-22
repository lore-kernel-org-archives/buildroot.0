From: Noam Camus <noamc@ezchip.com>
Date: Sun, 22 Dec 2013 17:32:46 +0200
Subject: [Buildroot] [PATCH 28/29] Added linux-headers cross compile fix
Message-ID: <264C179F799EF24AB26D5319053335E80E59B737C1@ezexch.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Tal Zilcer <talz@ezchip.com>

---
 package/linux-headers/linux-headers.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 30d3076..632b94f 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -25,6 +25,7 @@ define LINUX_HEADERS_INSTALL_STAGING_CMDS
 			HOSTCFLAGS="$(HOSTCFLAGS)" \
 			HOSTCXX="$(HOSTCXX)" \
 			INSTALL_HDR_PATH=$(STAGING_DIR)/usr \
+			CROSS_COMPILE="$(TARGET_CROSS)" \
 			headers_install)
 endef
 
-- 
1.7.1
