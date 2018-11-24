From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Nov 2018 13:01:34 +0100
Subject: [Buildroot] [git commit] dante: add linux-pam optional dependency
Message-ID: <20181202071558.AC0BC82855@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f1bba4a2cdb9246216157773c8a03956b2cd73d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dante/dante.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index a147aa36dc..9666ec54fd 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -12,7 +12,14 @@ DANTE_LICENSE_FILES = LICENSE
 # Dante uses a *VERY* old configure.ac
 DANTE_LIBTOOL_PATCH = NO
 
-DANTE_CONF_OPTS += --disable-client --disable-preload --without-pam
+DANTE_CONF_OPTS += --disable-client --disable-preload
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+DANTE_DEPENDENCIES += linux-pam
+DANTE_CONF_OPTS += --with-pam
+else
+DANTE_CONF_OPTS += --without-pam
+endif
 
 define DANTE_INSTALL_CONFIG_FILE
 	$(INSTALL) -D -m 644 $(@D)/example/sockd.conf \
