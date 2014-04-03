From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:20:23 +0200
Subject: [Buildroot] [git commit] systemd: needs kernel headers >= 3.8
Message-ID: <20140403182128.4A9569B1EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6dc3b6dd09638d1966daef31e1a1ec5b09b69432
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Systemd needs Linux headers >= 3.8 because it uses IFLA_GRE_FLOWINFO,
IFLA_IPTUN_FLAGS from linux/if_tunnel.h.

Fixes http://autobuild.buildroot.org/results/ad3/ad3b4003dc50582a493f1156234d83652104a6bf/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 system/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 8ff8d49..ba225ce 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -96,12 +96,12 @@ config BR2_INIT_SYSTEMD
 	depends on BR2_TOOLCHAIN_HAS_SSP
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
 	select BR2_PACKAGE_SYSTEMD
 
-comment 'systemd needs an (e)glibc toolchain, headers >= 3.0'
+comment 'systemd needs an (e)glibc toolchain, headers >= 3.8'
 	depends on !(BR2_TOOLCHAIN_USES_GLIBC \
-		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0)
+		&& BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8)
 
 config BR2_INIT_NONE
 	bool "None"
