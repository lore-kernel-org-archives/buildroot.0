From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Jan 2019 10:49:47 +0100
Subject: [Buildroot] [git commit] package/clamav: add optional dependency to
 pcre2
Message-ID: <20190127095108.9A8E683BE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e1cfe35066b2dca6fc5d38b4546cf462ebdf3040
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream recommends pcre2 over pcre:
https://github.com/Cisco-Talos/clamav-devel/commit/1f71c2b21ccaef412280471444f4d01ec9b8099d

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
