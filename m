From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Dec 2010 10:25:36 +0100
Subject: [Buildroot] [PATCH 09/15] toolchain: check that the thread option
	selection is correct
In-Reply-To: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
References: <cover.1291541115.git.thomas.petazzoni@free-electrons.com>
Message-ID: <6166eab6a471e1111c9b54cc4390143ebfb0acb2.1291541115.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When an external toolchain is used, the user is responsible for
telling Buildroot what the configuration of the toolchain is. In order
to make sure that the selection is correct, we already perform checks
against the configuration of the uClibc in the selected external
toolchain. This commit adds the check for thread support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/helpers.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 24f379d..ee902fa 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -192,7 +192,8 @@ check_uclibc = \
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_INET_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_WCHAR__,BR2_USE_WCHAR,$${UCLIBC_CONFIG_FILE},Wide char support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support)
+	$(call check_uclibc_feature,__UCLIBC_HAS_PROGRAM_INVOCATION_NAME__,BR2_PROGRAM_INVOCATION,$${UCLIBC_CONFIG_FILE},Program invocation support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_THREADS__,BR2_TOOLCHAIN_HAS_THREADS,$${UCLIBC_CONFIG_FILE},Thread support)
 
 #
 # Check that the Buildroot configuration of the ABI matches the
-- 
1.7.0.4
