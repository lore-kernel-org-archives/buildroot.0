From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri,  1 Mar 2019 17:47:11 +0100
Subject: [Buildroot] [PATCH/next 7/9] package/optee-examples: drop
 constraint on !BR2_STATIC_LIBS
In-Reply-To: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
References: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
Message-ID: <ec733ccac1ab03c22d8d2a1848f54f9240105e79.1551458062.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Optee-client recently supports BR2_STATIC_LIBS and
BR2_SHARED_LIBS directives. This change removes the constraint
on package optee-examples that now supports static linking of
embedded binaries.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-examples/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index 479f920..3f730ca 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_OPTEE_EXAMPLES
 	bool "optee-examples"
 	depends on BR2_TARGET_OPTEE_OS
-	depends on !BR2_STATIC_LIBS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
@@ -17,7 +16,3 @@ config BR2_PACKAGE_OPTEE_EXAMPLES
 	  execution.
 
 	  https://github.com/linaro-swg/optee_examples
-
-comment "optee-examples needs a toolchain w/ dynamic library"
-	depends on BR2_TARGET_OPTEE_OS
-	depends on BR2_STATIC_LIBS
-- 
1.9.1
