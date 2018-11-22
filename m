From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 22 Nov 2018 18:49:14 +0100
Subject: [Buildroot] [PATCH/next 2/2] dante: add linux-pam optional
 dependency
In-Reply-To: <20181122174914.20300-1-fontaine.fabrice@gmail.com>
References: <20181122174914.20300-1-fontaine.fabrice@gmail.com>
Message-ID: <20181122174914.20300-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.14.1
