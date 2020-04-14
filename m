From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Apr 2020 14:07:15 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkcs11-helper: needs dynamic library
Message-ID: <20200414120715.1449106-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pkcs11-helper unconditionally use dlfcn.h in lib/pkcs11h-core.c

Fixes:
 - http://autobuild.buildroot.org/results/3411074765312e67dab0f71876a254721911714f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/pkcs11-helper/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkcs11-helper/Config.in b/package/pkcs11-helper/Config.in
index da000b7010..36204d7d33 100644
--- a/package/pkcs11-helper/Config.in
+++ b/package/pkcs11-helper/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PKCS11_HELPER
 	bool "pkcs11-helper"
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	help
 	  pkcs11-helper is a library that simplifies the interaction
 	  with PKCS#11 providers for end-user applications.
@@ -17,3 +18,6 @@ config BR2_PACKAGE_PKCS11_HELPER
 	  perform signature and decryption.
 
 	  https://github.com/OpenSC/pkcs11-helper
+
+comment "pkcs11-helper needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.25.1
