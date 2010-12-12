From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Dec 2010 15:16:58 +0100
Subject: [Buildroot] [PATCH 02/14] toolchain: remove ending semi-colon in
	helpers
In-Reply-To: <cover.1292163398.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292163398.git.thomas.petazzoni@free-electrons.com>
Message-ID: <2dcdf99548257a5907c8f77eb7a1b65d7295f135.1292163398.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some helpers had their final line ending with a semi-colon, some did
not. For consistency, remove the final semi-colon from all helpers,
it's the responsability of the caller to add the final semi-colon as
needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.0.4
