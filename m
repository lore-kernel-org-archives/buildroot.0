From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Feb 2014 00:40:56 +0100
Subject: [Buildroot] [PATCH 09/13] package/dvb-apps: requires kernel headers
	>= 3.3
In-Reply-To: <cover.1393198603.git.yann.morin.1998@free.fr>
References: <cover.1393198603.git.yann.morin.1998@free.fr>
Message-ID: <a602d76cde75fe22ef2767e6715300bfcf5f9864.1393198603.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

dvb-apps requires linux kernel headers >= 3.3, for:
    SYS_TURBO, SYS_DVBC_ANNEX_A      : introduced in 3.2
    SYS_DVBC_ANNEX_C, DTV_ENUM_DELSYS: introduced in 3.3

Fixes:
    http://autobuild.buildroot.net/results/a77/a7786dffa28e5472fbc9c8fe4ab302c84d7a3cb9

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/dvb-apps/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/dvb-apps/Config.in b/package/dvb-apps/Config.in
index ba3ce45..ea0a12f 100644
--- a/package/dvb-apps/Config.in
+++ b/package/dvb-apps/Config.in
@@ -8,13 +8,14 @@ config BR2_PACKAGE_DVB_APPS
 
 if BR2_PACKAGE_DVB_APPS
 
-comment "dvb-apps utils needs a toolchain w/ largefile, threads"
-	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+comment "dvb-apps utils needs a toolchain w/ largefile, threads, headers >= 3.3"
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 
 config BR2_PACKAGE_DVB_APPS_UTILS
 	bool "dvb-apps utilities"
 	depends on BR2_LARGEFILE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  A small number of DVB test and utility programs,
-- 
1.8.3.2
