From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 17 Feb 2015 13:26:56 -0300
Subject: [Buildroot] [PATCH 4/6] glibc: nios2: Prevent selecting unsupported
	versions
In-Reply-To: <1424190418-883-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1424190418-883-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1424190418-883-5-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Versions previous to glibc v2.21 do not support the Nios-II architecture
so disable them.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/glibc/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 3038b27..8001491 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -33,6 +33,7 @@ choice
 	default BR2_GLIBC_VERSION_2_20
 
 config BR2_GLIBC_VERSION_2_20
+	depends on !BR2_nios2
 	bool "2.20"
 
 config BR2_GLIBC_VERSION_2_21
-- 
2.3.0
