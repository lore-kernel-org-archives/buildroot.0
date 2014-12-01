From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  1 Dec 2014 11:16:57 -0300
Subject: [Buildroot] [PATCH 2/5] linux-headers: mark EOL versions deprecated
In-Reply-To: <1417443420-31985-1-git-send-email-gustavo@zacarias.com.ar>
References: <1417443420-31985-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1417443420-31985-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Follow the upstream EOL cycle and mark 3.16 as deprecated for 2015.02.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d765e3a..7e48309 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -56,6 +56,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_16
 		bool "Linux 3.16.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2015_02
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16
 
 	config BR2_KERNEL_HEADERS_3_17
-- 
2.0.4
