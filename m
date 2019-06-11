From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 11 Jun 2019 19:05:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/git: fix build with curl
Message-ID: <20190611170521.11183-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

curl-config path can be set through ac_cv_prog_CURL_CONFIG and not
ac_cv_prog_curl_config

Fixes:
 - http://autobuild.buildroot.org/results/4b22f761795d8760dac6ddfd40934259f0135a4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/git/git.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 8d1fcd2399..1b4a1a51e9 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -35,7 +35,7 @@ ifeq ($(BR2_PACKAGE_LIBCURL),y)
 GIT_DEPENDENCIES += libcurl
 GIT_CONF_OPTS += --with-curl
 GIT_CONF_ENV += \
-	ac_cv_prog_curl_config=$(STAGING_DIR)/usr/bin/$(LIBCURL_CONFIG_SCRIPTS)
+	ac_cv_prog_CURL_CONFIG=$(STAGING_DIR)/usr/bin/$(LIBCURL_CONFIG_SCRIPTS)
 else
 GIT_CONF_OPTS += --without-curl
 endif
-- 
2.20.1
