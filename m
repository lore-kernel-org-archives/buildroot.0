From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Dec 2010 22:26:52 +0100
Subject: [Buildroot] [git commit master 1/1] toolchain: remove ending
	semi-colon in helpers
Message-ID: <20101213214843.A981E8E2C2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ac38fd3dc6f046022c13f12aad0e754ec4242ffc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some helpers had their final line ending with a semi-colon, some did
not. For consistency, remove the final semi-colon from all helpers,
it's the responsability of the caller to add the final semi-colon as
needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/helpers.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 05d43e7..43c6db3 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -201,7 +201,7 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support)
 
 #
 # Check that the Buildroot configuration of the ABI matches the
@@ -221,7 +221,7 @@ check_arm_abi = \
 	if [ x$(BR2_ARM_EABI) = x"y" -a $${EXT_TOOLCHAIN_ABI} = "oabi" ] ; then \
 		echo "Incorrect ABI setting" ; \
 		exit 1 ; \
-	fi ; \
+	fi
 
 #
 # Check that the external toolchain supports C++
@@ -231,7 +231,7 @@ check_cplusplus = \
 	if test $$? -ne 0 ; then \
 		echo "BR2_INSTALL_LIBSTDCPP is selected but C++ support not available in external toolchain" ; \
 		exit 1 ; \
-	fi ; \
+	fi
 
 #
 # Check that the cross-compiler given in the configuration exists
@@ -241,4 +241,4 @@ check_cross_compiler_exists = \
 	if test $$? -ne 0 ; then \
 		echo "Cannot execute cross-compiler '$(TARGET_CC)'" ; \
 		exit 1 ; \
-	fi ; \
+	fi
-- 
1.7.2.2
