From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Dec 2019 16:44:22 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/collectd: rename
 --with-yajl
Message-ID: <20191203154046.5B0E08642F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ea84ad6626e69c7f934dc32460b67c914978f34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

--with-yajl is not recognized so replace it by the correct
--with-libyajl option

The option is named --with-libyajl since a very long time (since at
least version 4.8.0 and
https://github.com/collectd/collectd/commit/f154fb21fbb1fee2f2262d421eca32e7e340f420)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 39707c956d341b5ee0232d70fdfe295c93964dc8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index c73008becd..34553ecaab 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -192,7 +192,7 @@ COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
 COLLECTD_CONF_ENV += LIBS="-lpthread -lm"
 endif
 ifeq ($(BR2_PACKAGE_YAJL),y)
-COLLECTD_CONF_OPTS += --with-yajl=$(STAGING_DIR)/usr
+COLLECTD_CONF_OPTS += --with-libyajl=$(STAGING_DIR)/usr
 endif
 
 # network can use libgcrypt
