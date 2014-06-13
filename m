From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jun 2014 22:32:37 +0200
Subject: [Buildroot] [git commit] systemd: needs kernel headers >= 3.10
Message-ID: <20140613203259.293CA99EAC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c2277c2d4e268f492379e6b7f8951b76970ff4c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Systemd needs a toolchain with kernel headers >= 3.10, as it needs
IFLA_VLAN_PROTOCOL from linux/if_link.h.

Fixes: http://autobuild.buildroot.net/results/33e/33e1447949d13bccc4076b69f902432e2131cc1c

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
