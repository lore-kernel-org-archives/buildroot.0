From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jun 2019 22:37:46 +0200
Subject: [Buildroot] [git commit] package/git: fix build with curl
Message-ID: <20190611204338.7FFD38F914@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f64c7a8be665f3fb6b14721af872cd16c91d755
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

curl-config path can be set through ac_cv_prog_CURL_CONFIG and not
ac_cv_prog_curl_config

Fixes:
 - http://autobuild.buildroot.org/results/4b22f761795d8760dac6ddfd40934259f0135a4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
