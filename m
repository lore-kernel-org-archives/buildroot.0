From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Sep 2017 14:29:55 +0200
Subject: [Buildroot] [PATCH 2/5] package/ngircd: add optional dependency to
	openssl
In-Reply-To: <20170913122958.11805-1-bernd.kuhls@t-online.de>
References: <20170913122958.11805-1-bernd.kuhls@t-online.de>
Message-ID: <20170913122958.11805-2-bernd.kuhls@t-online.de>
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
index 5f03b66001..2ab9187c8e 100644
--- a/package/ngircd/ngircd.mk
+++ b/package/ngircd/ngircd.mk
@@ -11,4 +11,11 @@ NGIRCD_DEPENDENCIES = zlib
 NGIRCD_LICENSE = GPL-2.0+
 NGIRCD_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+NGIRCD_CONF_OPTS += --with-openssl=$(STAGING_DIR)/usr
+NGIRCD_DEPENDENCIES += openssl
+else
+NGIRCD_CONF_OPTS += --without-openssl
+endif
+
 $(eval $(autotools-package))
-- 
2.11.0
