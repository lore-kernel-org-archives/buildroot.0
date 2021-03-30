From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 30 Mar 2021 23:42:13 +0200
Subject: [Buildroot] [PATCH 1/1] package/libupnp: disable samples
Message-ID: <20210330214213.759777-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable samples which are built (but not installed) by default since at
least version 1.6.0 and
https://github.com/pupnp/pupnp/commit/89e7a40fcc5c51afacdc9d5f3d18f5338b2bc5e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libupnp/libupnp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index 0b36881e16..8250d30ca0 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -16,7 +16,9 @@ LIBUPNP_CPE_ID_VENDOR = libupnp_project
 LIBUPNP_DEPENDENCIES = host-pkgconf
 
 # Bind the internal miniserver socket with reuseaddr to allow clean restarts.
-LIBUPNP_CONF_OPTS += --enable-reuseaddr
+LIBUPNP_CONF_OPTS += \
+	--disable-samples \
+	--enable-reuseaddr
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUPNP_CONF_OPTS += --enable-open-ssl
-- 
2.30.2
