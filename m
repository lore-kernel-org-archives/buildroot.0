From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Apr 2021 21:55:26 +0200
Subject: [Buildroot] [PATCH v1 2/3] package/libtomcrypt: compile with -fPIC
 to enable linking to dynamic libraries/exectuables
In-Reply-To: <20210412195527.9282-1-ps.report@gmx.net>
References: <20210412195527.9282-1-ps.report@gmx.net>
Message-ID: <20210412195527.9282-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  .../x86_64-buildroot-linux-gnu/bin/ld: .../host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/libtomcrypt.a(md5.o): relocation R_X86_64_32 against `.rodata.str1.1' can not be used when making a shared object; recompile with -fPIC

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libtomcrypt/libtomcrypt.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libtomcrypt/libtomcrypt.mk b/package/libtomcrypt/libtomcrypt.mk
index fa6dde64cd..b6ad77daec 100644
--- a/package/libtomcrypt/libtomcrypt.mk
+++ b/package/libtomcrypt/libtomcrypt.mk
@@ -17,7 +17,7 @@ LIBTOMCRYPT_DEPENDENCIES = libtommath
 # 0001-fix-CVE-2019-17362.patch
 LIBTOMCRYPT_IGNORE_CVES += CVE-2019-17362
 
-LIBTOMCRYPT_CFLAGS = -I./src/headers $(TARGET_CFLAGS) -DLTC_SOURCE -DLTM_DESC
+LIBTOMCRYPT_CFLAGS = -I./src/headers $(TARGET_CFLAGS) -fPIC -DLTC_SOURCE -DLTM_DESC
 
 define LIBTOMCRYPT_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(LIBTOMCRYPT_CFLAGS)"
-- 
2.31.1
