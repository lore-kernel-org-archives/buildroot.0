From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Fri,  1 Mar 2019 17:47:10 +0100
Subject: [Buildroot] [PATCH/next 6/9] package/optee-test: drop constraint on
 !BR2_STATIC_LIBS
In-Reply-To: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
References: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
Message-ID: <e65e8bc8e1d6c0a0a6745daaabbad2718ba0e1c7.1551458062.git.etienne.carriere@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Optee-client recently supports BR2_STATIC_LIBS and
BR2_SHARED_LIBS directives. This change removes the constraint
on package optee-test that now supports static linking of
embedded binaries.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-test/Config.in | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index 575790b..2bccc76 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_OPTEE_TEST
 	bool "optee-test"
 	depends on BR2_TARGET_OPTEE_OS
-	depends on !BR2_STATIC_LIBS # optee-client
 	select BR2_PACKAGE_OPTEE_CLIENT
 	select BR2_TARGET_OPTEE_OS_SDK
 	help
@@ -21,7 +20,3 @@ config BR2_PACKAGE_OPTEE_TEST
 	  execution.
 
 	  http://github.com/OP-TEE/optee_test
-
-comment "optee-test needs a toolchain w/ dynamic library"
-	depends on BR2_TARGET_OPTEE_OS
-	depends on BR2_STATIC_LIBS
-- 
1.9.1
