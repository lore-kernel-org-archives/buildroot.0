From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 21:49:06 +0200
Subject: [Buildroot] [git commit] rpcbind: use pkg-config for libtirpc flags
Message-ID: <20150726195346.BDBBC81D7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c64d6bb8ba5382b14aebdb6ea40a84932de1b11b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of hardcoding the flags needed for libtirpc, use pkg-config.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpcbind/rpcbind.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
index d879de1..1e28af9 100644
--- a/package/rpcbind/rpcbind.mk
+++ b/package/rpcbind/rpcbind.mk
@@ -11,7 +11,7 @@ RPCBIND_LICENSE = BSD-3c
 RPCBIND_LICENSE_FILES = COPYING
 
 RPCBIND_CONF_ENV += \
-	CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/tirpc/"
+	CFLAGS="$(TARGET_CFLAGS) `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`"
 RPCBIND_DEPENDENCIES += libtirpc host-pkgconf
 RPCBIND_CONF_OPTS += --with-rpcuser=root
 RPCBIND_CONF_OPTS += --with-systemdsystemunitdir=no
