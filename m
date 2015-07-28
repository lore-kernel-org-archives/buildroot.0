From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 28 Jul 2015 10:48:01 -0300
Subject: [Buildroot] [PATCH] linux-headers: mark EOL versions deprecated
Message-ID: <1438091281-3836-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Follow the upstream EOL cycle and mark 4.0 as deprecated for 2015.08.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 2fcc39b..41ba27f 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -84,6 +84,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_4_0
 		bool "Linux 4.0.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2015_08
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_0
 
 	config BR2_KERNEL_HEADERS_4_1
-- 
2.3.6
