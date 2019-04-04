From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Apr 2019 23:24:03 +0200
Subject: [Buildroot] [git commit] package/jq: add oniguruma optional
 dependency
Message-ID: <20190404212020.D55F0811DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=802bdcb25c57dd7f0a87ad7524b5f5f51d8a44ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/jq/jq.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index aebe8c86e4..bf96f0cecb 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -17,8 +17,15 @@ JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99 -D_GNU_SOURCE"
 HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99 -D_GNU_SOURCE"
 
 # jq explicitly enables maintainer mode, which we don't need/want
-JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
+JQ_CONF_OPTS += --disable-maintainer-mode
 HOST_JQ_CONF_OPTS += --disable-maintainer-mode --without-oniguruma
 
+ifeq ($(BR2_PACKAGE_ONIGURUMA),y)
+JQ_DEPENDENCIES += oniguruma
+JQ_CONF_OPTS += --with-oniguruma
+else
+JQ_CONF_OPTS += --without-oniguruma
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
