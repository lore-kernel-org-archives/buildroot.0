From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 13 Jun 2021 11:10:44 +0200
Subject: [Buildroot] [PATCH v2, 2/2] package/libkrb5: requires DES,
 MD4 and RC4 support in openssl
In-Reply-To: <20210613091044.877789-1-fontaine.fabrice@gmail.com>
References: <20210613091044.877789-1-fontaine.fabrice@gmail.com>
Message-ID: <20210613091044.877789-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable DES, MD4 and RC4 in openssl to fix build failure raised since
commit a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/d73b477bd2064aee076f9debfd8d3346c63ba657

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkrb5/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libkrb5/Config.in b/package/libkrb5/Config.in
index 2e24c87229..3357d4ad04 100644
--- a/package/libkrb5/Config.in
+++ b/package/libkrb5/Config.in
@@ -3,6 +3,9 @@ config BR2_PACKAGE_LIBKRB5
 	# needs fork()
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4 if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4 if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Kerberos is a system for authenticating users and services
 	  on a network. Kerberos is a trusted third-party service.
-- 
2.30.2
