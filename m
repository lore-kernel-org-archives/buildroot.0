From: Noam Camus <noamc@ezchip.com>
Date: Sun, 23 Feb 2014 08:29:15 +0000
Subject: [Buildroot] FW: [PATCH] linux-headers: cross compile fix
Message-ID: <884EA965490E3C4D8E66AEF41E98025006BF4D@ezex10.ezchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise compiler not found errors occured.

Signed-off-by: Noam Camus <noamc@ezchip.com>
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
