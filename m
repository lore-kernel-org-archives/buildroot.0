From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  9 Dec 2019 23:27:45 +0100
Subject: [Buildroot] [PATCH 2/3] package/dante: add optional libminiupnpc
 dependency
In-Reply-To: <20191209222746.3440986-1-fontaine.fabrice@gmail.com>
References: <20191209222746.3440986-1-fontaine.fabrice@gmail.com>
Message-ID: <20191209222746.3440986-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dante/dante.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index 0668042bd8..35b785dc70 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -14,6 +14,13 @@ DANTE_AUTORECONF = YES
 
 DANTE_CONF_OPTS += --disable-client --disable-preload
 
+ifeq ($(BR2_PACKAGE_LIBMINIUPNPC),y)
+DANTE_DEPENDENCIES += libminiupnpc
+DANTE_CONF_OPTS += --with-upnp
+else
+DANTE_CONF_OPTS += --without-upnp
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 DANTE_DEPENDENCIES += linux-pam
 DANTE_CONF_OPTS += --with-pam
-- 
2.24.0
