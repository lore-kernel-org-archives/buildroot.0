From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Sep 2013 09:12:06 -0300
Subject: [Buildroot] [PATCH 3/3] toolchain/gcc: add elf2flt to dependencies
In-Reply-To: <1378901526-29167-1-git-send-email-gustavo@zacarias.com.ar>
References: <1378901526-29167-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1378901526-29167-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add host-elf2flt to the gcc common dependencies so we get it built after
binutils but before gcc/uclibc since it's required for all packages and
in some uClibc configuration scenarios.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gcc/gcc.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 6654b51..157357c 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -86,7 +86,8 @@ endef
 HOST_GCC_COMMON_DEPENDENCIES = \
 	host-binutils \
 	host-gmp \
-	host-mpfr
+	host-mpfr \
+	$(if $(BR2_BINFMT_FLAT),host-elf2flt)
 
 HOST_GCC_COMMON_CONF_OPT = \
 	--target=$(GNU_TARGET_NAME) \
-- 
1.8.1.5
