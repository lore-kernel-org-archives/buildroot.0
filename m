From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  2 Jun 2015 14:34:35 -0300
Subject: [Buildroot] [PATCH 2/2] linux-headers: mark EOL versions deprecated
In-Reply-To: <1433266475-8782-1-git-send-email-gustavo@zacarias.com.ar>
References: <1433266475-8782-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1433266475-8782-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Follow the upstream EOL cycle and mark 3.19 as deprecated for 2015.08.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-headers/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d81cd36..653209e 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -79,6 +79,7 @@ choice
 
 	config BR2_KERNEL_HEADERS_3_19
 		bool "Linux 3.19.x kernel headers"
+		depends on BR2_DEPRECATED_SINCE_2015_08
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_19
 
 	config BR2_KERNEL_HEADERS_4_0
-- 
2.3.6
