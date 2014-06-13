From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Fri, 13 Jun 2014 17:35:57 +0200
Subject: [Buildroot] [PATCH] systemd: needs kernel headers >= 3.10
Message-ID: <1402673757-14223-1-git-send-email-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Systemd needs a toolchain with kernel headers >= 3.10, as it needs
IFLA_VLAN_PROTOCOL from linux/if_link.h.

Fixes: http://autobuild.buildroot.net/results/33e/33e1447949d13bccc4076b69f902432e2131cc1c

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 system/Config.in |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 53bca53..1be7e5d 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -96,12 +96,12 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd needs an (e)glibc toolchain, headers >= 3.8'
+comment 'systemd needs an (e)glibc toolchain, headers >= 3.10'
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
-		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8)
+		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10)
 
 config BR2_INIT_NONE
 	bool "None"
-- 
1.7.10.4
