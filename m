From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Feb 2016 14:54:58 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: mark EOL versions deprecated
In-Reply-To: <1456163698-7860-1-git-send-email-gustavo@zacarias.com.ar>
References: <1456163698-7860-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1456163698-7860-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Follow the upstream EOL cycle and mark 4.3 as deprecated for 2016.05.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index a101935..30d7e4c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -73,6 +73,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_4_3
 		bool "Linux 4.3.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2016_05
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 
 	config BR2_KERNEL_HEADERS_4_4
-- 
2.4.10
