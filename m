From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Jan 2017 21:07:30 +0100
Subject: [Buildroot] [git commit] collectd: fix libgcrypt support
Message-ID: <20170110200748.941A8802B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=01cd62a31c2e04ea9acaca9cfca527a938e40e85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For the newer versions the collectd configure script expects
libgcrypt-config as parameter rather than the location for the
libgcrypt-config script. Adjust the package to account for this.
Fixes:
http://autobuild.buildroot.net/results/a49/a494bc905e4509528c4932f76a094b9ea8e70bd3/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 7ab7dd4..fa6ebae 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -175,8 +175,7 @@ endif
 # network can use libgcrypt
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 COLLECTD_DEPENDENCIES += libgcrypt
-COLLECTD_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr
-COLLECTD_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
+COLLECTD_CONF_OPTS += --with-libgcrypt=$(STAGING_DIR)/usr/bin/libgcrypt-config
 else
 COLLECTD_CONF_OPTS += --with-libgcrypt=no
 endif
