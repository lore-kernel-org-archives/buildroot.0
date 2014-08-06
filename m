From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  6 Aug 2014 17:17:47 -0300
Subject: [Buildroot] [PATCH] toolchain: fix 3.16 selection for custom version
Message-ID: <1407356267-3005-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix d'oh typo from 911516f1b6dec4b2985a1f454949f8d9d10f6ef5 that
prevents custom version string 3.16 headers from working properly.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 0af5974..4d9378e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -82,7 +82,7 @@ choice
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_16
 	bool "3.16.x"
-	select BR2_PACKAGE_HEADERS_AT_LEAST_3_16
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 
 config BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_15
 	bool "3.15.x"
-- 
1.8.5.5
