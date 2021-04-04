From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  4 Apr 2021 19:28:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: AD DC support needs ADS
Message-ID: <20210404172858.1514191-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed due to upstream commit:
https://gitlab.com/samba-team/samba/-/commit/607c9ab307db36aee0604d209a13b45d28c63d9b

Fixes:
http://autobuild.buildroot.net/results/b3f/b3fe797408b9041de37433602b3a47211818e44b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index e890313b71..db7783949a 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -31,14 +31,15 @@ if BR2_PACKAGE_SAMBA4
 config BR2_PACKAGE_SAMBA4_AD_DC
 	bool "AD DC"
 	depends on BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_SAMBA4_ADS
 	select BR2_PACKAGE_JANSSON
 	select BR2_PACKAGE_PYTHON_DNSPYTHON
 	select BR2_PACKAGE_PYTHON_MARKDOWN
 	help
 	  Enable Active Directory Domain Controller functionality.
 
-comment "AD DC depends on python3"
-	depends on !BR2_PACKAGE_PYTHON3
+comment "AD DC depends on python3 and Samba ADS support"
+	depends on !BR2_PACKAGE_PYTHON3 || !BR2_PACKAGE_SAMBA4_ADS
 
 config BR2_PACKAGE_SAMBA4_ADS
 	bool "ADS"
-- 
2.29.2
