From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Apr 2021 11:10:22 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libupnp: disable
 samples
Message-ID: <20210404085301.E9BD487A17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a927eff9d85f28b0968d2290b3ef6e4dd765fb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Disable samples which are built (but not installed) by default since at
least version 1.6.0 and
https://github.com/pupnp/pupnp/commit/89e7a40fcc5c51afacdc9d5f3d18f5338b2bc5e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 1f639e7d109df5b68912e319915a5459c8a2d62d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libupnp/libupnp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libupnp/libupnp.mk b/package/libupnp/libupnp.mk
index d44abe2794..891bb11803 100644
--- a/package/libupnp/libupnp.mk
+++ b/package/libupnp/libupnp.mk
@@ -15,7 +15,9 @@ LIBUPNP_LICENSE_FILES = COPYING
 LIBUPNP_DEPENDENCIES = host-pkgconf
 
 # Bind the internal miniserver socket with reuseaddr to allow clean restarts.
-LIBUPNP_CONF_OPTS += --enable-reuseaddr
+LIBUPNP_CONF_OPTS += \
+	--disable-samples \
+	--enable-reuseaddr
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUPNP_CONF_OPTS += --enable-open-ssl
