From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 14:29:58 +0200
Subject: [Buildroot] [PATCH 5/5] package/ngircd: add optional support for
	linux-pam
In-Reply-To: <20170913122958.11805-1-bernd.kuhls@t-online.de>
References: <20170913122958.11805-1-bernd.kuhls@t-online.de>
Message-ID: <20170913122958.11805-5-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ngircd/ngircd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ngircd/ngircd.mk b/package/ngircd/ngircd.mk
index 9fa30da24c..37c4f87d43 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -10,6 +10,13 @@ NGIRCD_SITE = https://arthur.barton.de/pub/ngircd
 NGIRCD_LICENSE = GPL-2.0+
 NGIRCD_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+NGIRCD_CONF_OPTS += --with-pam=$(STAGING_DIR)/usr
+NGIRCD_DEPENDENCIES += linux-pam
+else
+NGIRCD_CONF_OPTS += --with-pam
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 NGIRCD_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
 NGIRCD_DEPENDENCIES += openssl
-- 
2.11.0
