From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:46:46 +0100
Subject: [Buildroot] [git commit] package/ulogd: add --with-sqlite option
Message-ID: <20190315205531.1369A8004A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=15b7e0cfe387fdb11234faf878fddcae3d748146
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use --with-sqlite and --without-sqlite options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ulogd/ulogd.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ulogd/ulogd.mk b/package/ulogd/ulogd.mk
index a2cad40677..1b86c12773 100644
--- a/package/ulogd/ulogd.mk
+++ b/package/ulogd/ulogd.mk
@@ -29,7 +29,10 @@ else
 ULOGD_CONF_OPTS += --without-pgsql
 endif
 ifeq ($(BR2_PACKAGE_SQLITE),y)
+ULOGD_CONF_OPTS += --with-sqlite
 ULOGD_DEPENDENCIES += sqlite
+else
+ULOGD_CONF_OPTS += --without-sqlite
 endif
 else
 ULOGD_CONF_OPTS += --without-mysql --without-pgsql --without-sqlite
