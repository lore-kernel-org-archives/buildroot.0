From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon,  2 Feb 2015 16:35:36 +0100
Subject: [Buildroot] [PATCH v2 2/2] luacrypto: remove duplicate dependency
	on luainterpreter
In-Reply-To: <1422891336-14461-1-git-send-email-patrickdepinguin@gmail.com>
References: <1422891336-14461-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1422891336-14461-2-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The luarocks package infrastructure already adds a dependency on
luainterpreter, so it is not necessary to add it in luacrypto.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/luacrypto/luacrypto.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/luacrypto/luacrypto.mk b/package/luacrypto/luacrypto.mk
index 42e20af..b0e972c 100644
--- a/package/luacrypto/luacrypto.mk
+++ b/package/luacrypto/luacrypto.mk
@@ -9,6 +9,6 @@ LUACRYPTO_VERSION = $(LUACRYPTO_VERSION_UPSTREAM)-1
 LUACRYPTO_SUBDIR = luacrypto-$(LUACRYPTO_VERSION_UPSTREAM)
 LUACRYPTO_LICENSE = MIT
 LUACRYPTO_LICENSE_FILES = $(LUACRYPTO_SUBDIR)/COPYING
-LUACRYPTO_DEPENDENCIES = luainterpreter openssl
+LUACRYPTO_DEPENDENCIES = openssl
 
 $(eval $(luarocks-package))
-- 
1.8.5.1
