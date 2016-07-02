From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 13:26:49 +0200
Subject: [Buildroot] [git commit] package/libuio: disable Werror
Message-ID: <20160702113243.C8A3D81D88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=52b7e35a95e2284017291f8e8731bef68523e187
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable -Werror to avoid build issues caused by warnings.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Reported-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuio/libuio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuio/libuio.mk b/package/libuio/libuio.mk
index ed842a9..6d07f1f 100644
--- a/package/libuio/libuio.mk
+++ b/package/libuio/libuio.mk
@@ -9,7 +9,7 @@ LIBUIO_VERSION = 940861de278cb794bf9d775b76a4d1d4f9108607
 LIBUIO_SITE = $(call github,Linutronix,libuio,$(LIBUIO_VERSION))
 LIBUIO_LICENSE = LGPLv2.1 (library), GPLv2 (programs)
 LIBUIO_LICENSE_FILES = COPYING
-LIBUIO_CONF_OPTS = --with-glib=no
+LIBUIO_CONF_OPTS = --with-glib=no --without-werror
 LIBUIO_INSTALL_STAGING = YES
 
 # Fetched from github, no pre-generated configure script provided
