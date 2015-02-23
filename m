From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 12:34:55 +0100
Subject: [Buildroot] [git commit] luacrypto: remove duplicate dependency on
	luainterpreter
Message-ID: <20150302222723.09A6E8177D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e9beb4aea56a605490a7fb01d1c38867d20f4ac9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The luarocks package infrastructure already adds a dependency on
luainterpreter, so it is not necessary to add it in luacrypto.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luacrypto/luacrypto.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
