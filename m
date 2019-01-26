From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 26 Jan 2019 11:10:37 +0100
Subject: [Buildroot] [PATCH 2/2] package/clamav: add optional dependency to
 pcre2
In-Reply-To: <20190126101037.22267-1-bernd.kuhls@t-online.de>
References: <20190126101037.22267-1-bernd.kuhls@t-online.de>
Message-ID: <20190126101037.22267-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream recommends pcre2 over pcre:
https://github.com/Cisco-Talos/clamav-devel/commit/1f71c2b21ccaef412280471444f4d01ec9b8099d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 7e1b162f79..b5a184a67c 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -76,7 +76,10 @@ else
 CLAMAV_CONF_OPTS += --without-iconv
 endif
 
-ifeq ($(BR2_PACKAGE_PCRE),y)
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+CLAMAV_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr
+CLAMAV_DEPENDENCIES += pcre2
+else ifeq ($(BR2_PACKAGE_PCRE),y)
 CLAMAV_CONF_OPTS += --with-pcre=$(STAGING_DIR)/usr
 CLAMAV_DEPENDENCIES += pcre
 else
-- 
2.20.1
