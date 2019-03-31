From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:02:07 +0200
Subject: [Buildroot] [git commit] package/rpm: add optional libcap dependency
Message-ID: <20190331130146.1DB5F804FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=951831b46f57c820fe4f7440f3870a9446e4bc82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rpm/rpm.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 78f429f8b6..0eb6e7f3c7 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -25,7 +25,6 @@ RPM_CONF_OPTS = \
 	--disable-rpath \
 	--with-external-db \
 	--with-gnu-ld \
-	--without-cap \
 	--without-hackingdocs \
 	--without-lua
 
@@ -36,6 +35,13 @@ else
 RPM_CONF_OPTS += --without-acl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+RPM_DEPENDENCIES += libcap
+RPM_CONF_OPTS += --with-cap
+else
+RPM_CONF_OPTS += --without-cap
+endif
+
 ifeq ($(BR2_PACKAGE_LIBNSS),y)
 RPM_DEPENDENCIES += libnss
 RPM_CONF_OPTS += --with-crypto=nss
