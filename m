From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 12 Jun 2021 23:38:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/libkrb5: requires DES support in
 openssl
Message-ID: <20210612213827.654832-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/d73b477bd2064aee076f9debfd8d3346c63ba657

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkrb5/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
index 2e24c87229..39b5733b47 100644
--- a/package/libkrb5/Config.in
+++ b/package/libkrb5/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBKRB5
 	# needs fork()
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Kerberos is a system for authenticating users and services
 	  on a network. Kerberos is a trusted third-party service.
-- 
2.30.2
