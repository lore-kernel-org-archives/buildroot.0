From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 21:51:38 +0200
Subject: [Buildroot] [git commit] package/pkcs11-helper: needs dynamic
 library
Message-ID: <20200415193728.808A48ECED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dc97e968c22292e7ae41bb1596c517d6aec9425e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkcs11-helper unconditionally use dlfcn.h in lib/pkcs11h-core.c

Fixes:
 - http://autobuild.buildroot.org/results/3411074765312e67dab0f71876a254721911714f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
