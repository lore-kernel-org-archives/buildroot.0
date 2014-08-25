From: =?UTF-8?q?J=C3=B6rg=20Krause?= <jkrause@posteo.de>
Date: Mon, 25 Aug 2014 22:36:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: disable for Blackfin GNU
	Toolchain
Message-ID: <1408999005-15853-1-git-send-email-jkrause@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those toolchains use gcc <= 4.3, which do not support required C++11 features.

Signed-off-by: J?rg Krause <jkrause@posteo.de>
---
 package/upmpdcli/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 3fa638b..e99fddb 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -8,6 +8,9 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
 	help
 	  upmpdcli is a UPnP Media Renderer front-end for MPD, the Music
 	  Player Daemon. It supports UPnP gapless track transitions and
-- 
2.1.0
