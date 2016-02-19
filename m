From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 19 Feb 2016 09:01:11 +0100
Subject: [Buildroot] [PATCH 2/2] package/upmpdcli: bump to version 1.1.0
In-Reply-To: <1455868871-4339-1-git-send-email-joerg.krause@embedded.rocks>
References: <1455868871-4339-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <1455868871-4339-2-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

upmpdcli version 1.1.0 requires libupnpp version 0.14.1.

Also adjust the installation of the config file. It is renamed to upmpdcli.conf-dist
in the sources, but we install it as upmpdcli.conf as usual.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/upmpdcli.hash | 4 ++--
 package/upmpdcli/upmpdcli.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/upmpdcli/upmpdcli.hash b/package/upmpdcli/upmpdcli.hash
index 5a6c47a..07324a7 100644
--- a/package/upmpdcli/upmpdcli.hash
+++ b/package/upmpdcli/upmpdcli.hash
@@ -1,2 +1,2 @@
-# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-0.13.1.tar.gz.sha256
-sha256 86f964e49b0288a4d660aa4ad83576d83aad7c354df67d3aa8e324e8912876e0  upmpdcli-0.13.1.tar.gz
+# Hashes from: http://www.lesbonscomptes.com/upmpdcli/downloads/upmpdcli-1.1.0.tar.gz.sha256
+sha256  7193488091a204ed691d1f3ce3354e183c8245428a4a7ca8bd032e1a6c48520f  upmpdcli-1.1.0.tar.gz
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index ba5bbb2..6168595 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UPMPDCLI_VERSION = 0.13.1
+UPMPDCLI_VERSION = 1.1.0
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
@@ -40,7 +40,7 @@ define UPMPDCLI_INSTALL_INIT_SYSTEMD
 endef
 
 define UPMPDCLI_INSTALL_CONF_FILE
-	$(INSTALL) -D -m 0755 $(@D)/src/upmpdcli.conf $(TARGET_DIR)/etc/upmpdcli.conf
+	$(INSTALL) -D -m 0755 $(@D)/src/upmpdcli.conf-dist $(TARGET_DIR)/etc/upmpdcli.conf
 endef
 
 UPMPDCLI_POST_INSTALL_TARGET_HOOKS += UPMPDCLI_INSTALL_CONF_FILE
-- 
2.7.1
