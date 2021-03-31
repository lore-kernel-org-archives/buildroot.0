From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Mar 2021 09:24:14 +0200
Subject: [Buildroot] [git commit] package/libupnp: disable samples
Message-ID: <20210331065920.2AE5687764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f639e7d109df5b68912e319915a5459c8a2d62d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable samples which are built (but not installed) by default since at
least version 1.6.0 and
https://github.com/pupnp/pupnp/commit/89e7a40fcc5c51afacdc9d5f3d18f5338b2bc5e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
