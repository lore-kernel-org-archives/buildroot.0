From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 28 Mar 2014 17:31:05 +0100
Subject: [Buildroot] [PATCH] systemd: needs kernel headers >= 3.7.
Message-ID: <1396024266-6662-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd needs Linux headers >= 3.7 because it uses IFLA_GRE_FLOWINFO
from linux/if_tunnel.h.

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 system/Config.in |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index e8f1ed6..54aac11 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -96,12 +96,12 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd needs an (e)glibc toolchain, headers >= 3.0'
+comment 'systemd needs an (e)glibc toolchain, headers >= 3.7'
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
-		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0)
+		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7)
 
 config BR2_INIT_NONE
 	bool "None"
-- 
1.7.9.5
