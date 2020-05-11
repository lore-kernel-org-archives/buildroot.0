From: Erwan GAUTRON <erwan.gautron@bertin.fr>
Date: Mon, 11 May 2020 13:28:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: add option to disable
 unwanted features
Message-ID: <20200511112840.634268-1-erwan.gautron@bertin.fr>
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
This patch allows to select algorithms and mecanims to disable
such as md5

Signed-off-by: Erwan GAUTRON <erwan.gautron@bertin.fr>
---
 package/libopenssl/Config.in     | 151 +++++++++++++++++++++++++++++++
 package/libopenssl/libopenssl.mk |  25 +++++
 2 files changed, 176 insertions(+)

diff --git a/package/libopenssl/Config.in b/package/libopenssl/Config.in
index 881518d1cb..7c84be3bb4 100644
--- a/package/libopenssl/Config.in
+++ b/package/libopenssl/Config.in
@@ -44,4 +44,155 @@ config BR2_PACKAGE_LIBOPENSSL_ENGINES
 	help
 	  Install additional encryption engine libraries.
 
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_CHACHA
+	bool "enable openssl CHACHA "
+	default y
+	help
+	  Enable CHACHA cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC5
+	bool "enable openssl RC5"
+	default y
+	help
+	  Enable RC5 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC2
+	bool "enable openssl RC2"
+	default y
+	help
+	  Enable RC2 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RC4
+	bool "enable openssl RC4"
+	default y
+	help
+	  Enable RC4 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD2
+	bool "enable openssl MD2"
+	default y
+	help
+	  Enable MD2 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD4
+	bool "enable openssl MD4"
+	default y
+	help
+	  Enable MD4 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MD5
+	bool "enable openssl MD5"
+	default y
+	help
+	  Enable MD5 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_MDC2
+	bool "enable openssl MDC2"
+	default y
+	help
+	  Enable MDC2 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_BLAKE2
+	bool "enable openssl BLAKE2"
+	default y
+	help
+	  Enable BLAKE2 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_IDEA
+	bool "enable openssl IDEA"
+	default y
+	help
+	  Enable IDEA cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SEED
+	bool "enable openssl SEED"
+	default y
+	help
+	  Enable SEED cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
+	bool "enable openssl DES"
+	default y
+	help
+	  Enable DES cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_RMD160
+	bool "enable openssl RMD160"
+	default y
+	help
+	  Enable RMD160 cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_WHIRLPOOL
+	bool "enable openssl WHIRLPOOL"
+	default y
+	help
+	  Enable WHIRLPOOL cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH
+	bool "enable openssl BLOWFISH"
+	default y
+	help
+	  Enable BLOWFISH cipher in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL
+	bool "enable openssl SSL"
+	default y
+	help
+	  Enable SSL mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL2
+	bool "enable openssl SSL2"
+	default y
+	help
+	  Enable SSL2 mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_SSL3
+	bool "enable openssl SSL3"
+	default y
+	help
+	  Enable SSL3 mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_WEAK_SSL
+	bool "enable openssl WEAK_SSL"
+	default y
+	help
+	  Enable WEAK_SSL mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK
+	bool "enable openssl mode PSK"
+	default y
+	help
+	  Enable PSK mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_CAST
+	bool "enable openssl mode CAST"
+	default y
+	help
+	  Enable CAST mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_UNSECURE
+	bool "enable unit test, debug, backtrace"
+	default y
+	help
+	  Enable unit-test crypto-mdebug-backtrace crypto-mdebug autoerrinit mode in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_DYNAMIC_ENGINE
+	bool "enable openssl dynamic engine"
+	default y
+	help
+	  Enable dynamic engine in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_IPV6
+	bool "enable openssl IPV6"
+	default y
+	help
+	  Enable IPV6 in libopenssl.
+
+config BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP
+	bool "enable openssl compression"
+	default y
+	help
+	  Enable compression in libopenssl.
+
+
 endif # BR2_PACKAGE_LIBOPENSSL
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index a300458f85..ba87cce7b7 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -86,6 +86,31 @@ define LIBOPENSSL_CONFIGURE_CMDS
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
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_IPV6),,-DOPENSSL_USE_IPV6=0) \
+			$(if $(BR2_PACKAGE_LIBOPENSSL_ENABLE_COMP),,no-comp) \
 			$(if $(BR2_STATIC_LIBS),zlib,zlib-dynamic) \
 	)
 	$(SED) "s#-march=[-a-z0-9] ##" -e "s#-mcpu=[-a-z0-9] ##g" $(@D)/Makefile
-- 
2.25.1
