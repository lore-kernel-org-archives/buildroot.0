From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 9 Jan 2020 17:40:00 +0100
Subject: [Buildroot] [git commit] package/libupnp18: add config option
 --enable-reuseaddr
Message-ID: <20200109164022.3DD2780057@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=09c5f205744dd5501f3ebc821a123133538e5540
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable the option to use SO_REUSEADDR on the built-in miniserver
socket to allow clean restarts [1].

This fixes a runtime issue with Gerbera and possible other programs
which does not allow a graceful restart otherwise.

[1] https://github.com/pupnp/pupnp/commit/629dec75610260a669c7c3ed40c9332b7917b562

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libupnp18/libupnp18.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libupnp18/libupnp18.mk b/package/libupnp18/libupnp18.mk
index ca82a54413..f73c656831 100644
--- a/package/libupnp18/libupnp18.mk
+++ b/package/libupnp18/libupnp18.mk
@@ -13,6 +13,9 @@ LIBUPNP18_LICENSE = BSD-3-Clause
 LIBUPNP18_LICENSE_FILES = COPYING
 LIBUPNP18_DEPENDENCIES = host-pkgconf
 
+# Bind the internal miniserver socket with reuseaddr to allow clean restarts.
+LIBUPNP18_CONF_OPTS += --enable-reuseaddr
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBUPNP18_CONF_OPTS += --enable-open-ssl
 LIBUPNP18_DEPENDENCIES += openssl
