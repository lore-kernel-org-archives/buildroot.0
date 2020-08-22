From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 22 Aug 2020 17:52:37 +0200
Subject: [Buildroot] [git commit] package/collectd: fix build with luajit
Message-ID: <20200822154549.8F29D82875@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=094351c72301c30645407ecf93dcd539976f2a56
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build with luajit has been enabled with commit
911a9bf5739d94545cc482c765f876a9ff73e304 however the build fails because
collectd does not find liblua

Fixes:
 - http://autobuild.buildroot.org/results/31302b47fb70eb442cd000f4b9f27a9e12432cc3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/collectd/collectd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 21da8fddc8..25ffaa7468 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -198,6 +198,9 @@ endif
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 COLLECTD_CONF_OPTS += --with-libcurl=$(STAGING_DIR)/usr
 endif
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+COLLECTD_CONF_ENV += LIBLUA_PKG_CONFIG_NAME=luajit
+endif
 ifeq ($(BR2_PACKAGE_MYSQL),y)
 COLLECTD_CONF_OPTS += --with-libmysql=$(STAGING_DIR)/usr
 endif
