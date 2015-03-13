From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Mar 2015 15:22:01 -0300
Subject: [Buildroot] [PATCH 02/15] toolchain/helpers: make LFS mandatory for
	uclibc
In-Reply-To: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426270934-15499-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed on the mailing list drop the non-largefile option for
toolchains.
The size delta is minimal and it just complicates package dependencies.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/helpers.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index ef657ee..c11e1d7 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -278,7 +278,7 @@ check_uclibc = \
 	fi; \
 	UCLIBC_CONFIG_FILE=$${SYSROOT_DIR}/usr/include/bits/uClibc_config.h ; \
 	$(call check_uclibc_feature,__ARCH_USE_MMU__,BR2_USE_MMU,$${UCLIBC_CONFIG_FILE},MMU support) ;\
-	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,BR2_LARGEFILE,$${UCLIBC_CONFIG_FILE},Large file support) ;\
+	$(call check_uclibc_feature,__UCLIBC_HAS_LFS__,m,$${UCLIBC_CONFIG_FILE},Large file support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_IPV6__,BR2_INET_IPV6,$${UCLIBC_CONFIG_FILE},IPv6 support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_RPC__,BR2_TOOLCHAIN_HAS_NATIVE_RPC,$${UCLIBC_CONFIG_FILE},RPC support) ;\
 	$(call check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\
-- 
2.0.5
