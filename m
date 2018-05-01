From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  1 May 2018 22:05:08 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "glibc: install the obsolete libnsl"
In-Reply-To: <20180501200508.13974-1-romain.naour@gmail.com>
References: <20180501200508.13974-1-romain.naour@gmail.com>
Message-ID: <20180501200508.13974-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libnsl from Glibc is deprecated and should not be used anymore.
libnsl is now an separate library that can be packaged later if
necessary [1].

Note: libnsl from Glibc doesn't build with gcc 8 due new warning [2].

[1] https://github.com/thkukuk/libnsl.git
[2] http://patchwork.sourceware.org/patch/26437

This reverts commit 398747f5fafca8c07e696612d8eded53d4f935c7.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
---
 package/glibc/glibc.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 3ab673c0cc..0d406c195e 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -100,7 +100,6 @@ define GLIBC_CONFIGURE_CMDS
 		--disable-profile \
 		--without-gd \
 		--enable-obsolete-rpc \
-		--enable-obsolete-nsl \
 		--enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST)) \
 		--with-headers=$(STAGING_DIR)/usr/include)
 	$(GLIBC_ADD_MISSING_STUB_H)
-- 
2.14.3
