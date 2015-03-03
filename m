From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 10:53:38 -0300
Subject: [Buildroot] [PATCH 3/3] linux-headers: mark EOL versions deprecated
In-Reply-To: <1425390818-22958-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425390818-22958-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425390818-22958-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Follow the upstream EOL cycle and mark 3.17 as deprecated for 2015.05.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9ebf48a..e2bc05a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -68,6 +68,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_17
 		bool "Linux 3.17.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2015_05
 		depends on !BR2_nios2
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 
-- 
2.0.5
