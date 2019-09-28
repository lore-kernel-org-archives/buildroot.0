From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 28 Sep 2019 08:57:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/easy-rsa: bump to version 3.0.6
Message-ID: <20190928065758.26007-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add hash for license files
- COPYING renamed in COPYING.md by
  https://github.com/OpenVPN/easy-rsa/commit/b75faa475f22af55202d4b2be429cd30f16f15ac
- openssl-1.0.cnf renamed in openssl-easyrsa.cnf

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/easy-rsa/easy-rsa.hash |  6 +++++-
 package/easy-rsa/easy-rsa.mk   | 10 +++++-----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/easy-rsa/easy-rsa.hash b/package/easy-rsa/easy-rsa.hash
index e2d658ac81..5f5a490cbc 100644
--- a/package/easy-rsa/easy-rsa.hash
+++ b/package/easy-rsa/easy-rsa.hash
@@ -1,2 +1,6 @@
 # Locally computed: (after verifying gpg sig)
-sha512 d20f646e33ec803444dfcd446553f1d6001227fedec93280c212b34cccee11b184599f1b2ae6a3ce9cf6c9ac52f2b840ebb645536df6ddf55382fa25c22df81f EasyRSA-3.0.1.tgz
+sha512 1e0eb08fb343345c2bc079d622474f1b34dda3a0517b119efc7cb09113ab467f1346a6678e67d65e535bd404c2abb350d47a00c8f24e4541d54dbeb5600fab72 EasyRSA-unix-v3.0.6.tgz
+
+# Hash for license files
+sha256 7c4a4fc71745d93a87278801f1bca555562ca23f21e18293add64b9e6f6b7bf1 COPYING.md
+sha256 640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7 gpl-2.0.txt
diff --git a/package/easy-rsa/easy-rsa.mk b/package/easy-rsa/easy-rsa.mk
index 8ed5741c88..b3c57439a7 100644
--- a/package/easy-rsa/easy-rsa.mk
+++ b/package/easy-rsa/easy-rsa.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-EASY_RSA_VERSION = 3.0.1
-EASY_RSA_SOURCE = EasyRSA-$(EASY_RSA_VERSION).tgz
-EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/$(EASY_RSA_VERSION)
+EASY_RSA_VERSION = 3.0.6
+EASY_RSA_SOURCE = EasyRSA-unix-v$(EASY_RSA_VERSION).tgz
+EASY_RSA_SITE = https://github.com/OpenVPN/easy-rsa/releases/download/v$(EASY_RSA_VERSION)
 EASY_RSA_LICENSE = GPL-2.0
-EASY_RSA_LICENSE_FILES = COPYING gpl-2.0.txt
+EASY_RSA_LICENSE_FILES = COPYING.md gpl-2.0.txt
 
 # shell script, so no build step
 
@@ -16,7 +16,7 @@ define EASY_RSA_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/easyrsa $(TARGET_DIR)/usr/bin/easyrsa
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/easy-rsa/x509-types
 	$(INSTALL) -m 0644 -t $(TARGET_DIR)/etc/easy-rsa/x509-types $(@D)/x509-types/*
-	$(INSTALL) -D -m 0644 $(@D)/openssl-1.0.cnf $(TARGET_DIR)/etc/easy-rsa/openssl-1.0.cnf
+	$(INSTALL) -D -m 0644 $(@D)/openssl-easyrsa.cnf $(TARGET_DIR)/etc/easy-rsa/openssl-easyrsa.cnf
 	$(INSTALL) -D -m 0644 $(@D)/vars.example $(TARGET_DIR)/etc/easy-rsa/vars
 endef
 
-- 
2.23.0
