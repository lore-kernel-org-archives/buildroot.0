From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Nov 2019 17:35:37 +0100
Subject: [Buildroot] [git commit] package/collectd: rename --with-yajl
Message-ID: <20191128162823.585B9818ED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39707c956d341b5ee0232d70fdfe295c93964dc8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--with-yajl is not recognized so replace it by the correct
--with-libyajl option

The option is named --with-libyajl since a very long time (since at
least version 4.8.0 and
https://github.com/collectd/collectd/commit/f154fb21fbb1fee2f2262d421eca32e7e340f420)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 820547b511..9ff29fcbea 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -202,7 +202,7 @@ COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
 COLLECTD_CONF_ENV += LIBS="-lpthread -lm"
 endif
 ifeq ($(BR2_PACKAGE_YAJL),y)
-COLLECTD_CONF_OPTS += --with-yajl=$(STAGING_DIR)/usr
+COLLECTD_CONF_OPTS += --with-libyajl=$(STAGING_DIR)/usr
 endif
 
 # network can use libgcrypt
