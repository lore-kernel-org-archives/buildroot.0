From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Wed, 14 Sep 2016 13:41:46 +0200
Subject: [Buildroot] [PATCH 7/7] package/upmpdcli: use pkg-config for
	libupnpp
In-Reply-To: <20160914114146.3796-1-joerg.krause@embedded.rocks>
References: <20160914114146.3796-1-joerg.krause@embedded.rocks>
Message-ID: <20160914114146.3796-8-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the provided pkg-config file of libupnpp to get the correct LIBS.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/upmpdcli.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 3f521cf..208aa8f 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -17,12 +17,10 @@ UPMPDCLI_AUTORECONF = YES
 ifeq ($(BR2_STATIC_LIBS),y)
 # Upmpdcli forgets to take the dependencies of libupnpp into
 # consideration, breaking static linking, so help it.
-# Libupnpp unfortunately doesn't provide a .pc file, so manually
-# handle the dependencies here.
 # The build system doesn't expand LIBS from the configure step, so
 # manually pass it to make.
 UPMPDCLI_MAKE_OPTS = \
-	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs expat libcurl libupnp`"
+	LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libupnpp`"
 endif
 
 # Upmpdcli only runs if user upmpdcli exists
-- 
2.9.3
