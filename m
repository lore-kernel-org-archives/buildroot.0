From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:37 +0200
Subject: [Buildroot] [PATCH 08/69] dtc: add explicit dependencies for host
	variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-9-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/dtc/dtc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index f3b6f3b543fc..8fdcdbed7766 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -11,6 +11,7 @@ DTC_LICENSE = GPLv2+/BSD-2c
 DTC_LICENSE_FILES = README.license GPL
 DTC_INSTALL_STAGING = YES
 DTC_DEPENDENCIES = host-bison host-flex
+HOST_DTC_DEPENDENCIES = host-bison host-flex
 
 define DTC_POST_INSTALL_TARGET_RM_DTDIFF
 	rm -f $(TARGET_DIR)/usr/bin/dtdiff
-- 
2.1.0
