From: Erwan GAUTRON <erwan.gautron@bertin.fr>
Date: Mon, 11 May 2020 15:21:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: add option to enable
 some features
Message-ID: <20200511132133.738039-1-erwan.gautron@bertin.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>

Openssl implements lot of algorithms that are not required in
some emdedded devices and cyphers known as weak.
Secure embedded systems shall disable unused algorithms (and weak algo)
in order to be certified.
This patch allows to select weak algorithms and mecanims to enable
such as md5
To ensure backward compatibility, all items are selected by default

Signed-off-by: Erwan GAUTRON <erwan.gautron@bertin.fr>
---
 package/libopenssl/Config.in     | 147 +++++++++++++++++++++++++++++++
 package/libopenssl/libopenssl.mk |  24 +++++
 2 files changed, 171 insertions(+)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 881518d1cb..184a365a46 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -44,4 +44,151 @@ config BR2_PACKAGE_LIBOPENSSL_ENGINES
 	help
 	  Install additional encryption engine libraries.
 
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA
+	bool "enable CHACHA "
+	default y
+	help
+	  Enable CHACHA cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
+	bool "enable RC5"
+	default y
+	help
+	  Enable RC5 cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2
+	bool "enable RC2"
+	default y
+	help
+	  Enable RC2 cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4
+	bool "enable RC4"
+	default y
+	help
+	  Enable RC4 cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2
+	bool "enable MD2"
+	default y
+	help
+	  Enable MD2 cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
+	bool "enable MD4"
+	default y
+	help
+	  Enable MD4 cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD5
+	bool "enable MD5"
+	default y
+	help
+	  Enable MD5 cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2
+	bool "enable MDC2"
+	default y
+	help
+	  Enable MDC2 cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2
+	bool "enable BLAKE2"
+	default y
+	help
+	  Enable BLAKE2 cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_IDEA
+	bool "enable IDEA"
+	default y
+	help
+	  Enable IDEA cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SEED
+	bool "enable SEED"
+	default y
+	help
+	  Enable SEED cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
+	bool "enable DES"
+	default y
+	help
+	  Enable DES cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
+	bool "enable RMD160"
+	default y
+	help
+	  Enable RMD160 cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL
+	bool "enable WHIRLPOOL"
+	default y
+	help
+	  Enable WHIRLPOOL cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH
+	bool "enable BLOWFISH"
+	default y
+	help
+	  Enable BLOWFISH cipher.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL
+	bool "enable SSL"
+	default y
+	help
+	  Enable SSL mode.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2
+	bool "enable SSL2"
+	default y
+	help
+	  Enable SSL2 mode.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3
+	bool "enable SSL3"
+	default y
+	help
+	  Enable SSL3 mode.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL
+	bool "enable WEAK_SSL"
+	default y
+	help
+	  Enable WEAK_SSL mode.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK
+	bool "enable mode PSK"
+	default y
+	help
+	  Enable PSK mode.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST
+	bool "enable mode CAST"
+	default y
+	help
+	  Enable CAST mode.
+
+config BR2_PACKAGE_LIBOPENSSL_UNSECURE
+	bool "enable unit test, debug, backtrace"
+	default y
+	help
+	  Enable unit-test crypto-mdebug-backtrace
+	  crypto-mdebug autoerrinit mode.
+
+config BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
+	bool "enable dynamic engine"
+	default y
+	help
+	  Enable dynamic engine.
+
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP
+	bool "enable compression"
+	default y
+	help
+	  Enable compression.
+
+
 endif # BR2_PACKAGE_LIBOPENSSL
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index a300458f85..ff9ae08d74 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -86,6 +86,30 @@ define LIBOPENSSL_CONFIGURE_CMDS
 			no-tests \
 			no-fuzz-libfuzzer \
 			no-fuzz-afl \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA),,no-chacha) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5),,no-rc5) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2),,no-rc2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4),,no-rc4) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2),,no-md2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4),,no-md4) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MD5),,no-md5) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2),,no-mdc2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2),,no-blake2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_IDEA),,no-idea) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SEED),,no-seed) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_DES),,no-des) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160),,no-rmd160) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL),,no-whirlpool) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH),,no-bf) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL),,no-ssl) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2),,no-ssl2) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3),,no-ssl3) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL),,no-weak-ssl-ciphers) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK),,no-psk) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST),,no-cast) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_UNSECURE),,no-unit-test no-crypto-mdebug-backtrace no-crypto-mdebug no-autoerrinit) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE),,no-dynamic-engine ) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
 	)
 	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
-- 
2.25.1
