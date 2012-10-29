From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 29 Oct 2012 22:04:44 +0100
Subject: [Buildroot] [git commit] iw: pkg-config cleanup
Message-ID: <20121029211342.A596D9998B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da48213e26e61f563e40ba5c02b5a935d5c39abe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We no longer need to specify PKG_CONFIG_PATH since it's handled by the
host-pkgconf wrapper.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iw/iw.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 7633124..651a2ca 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -9,8 +9,7 @@ IW_SOURCE = iw-$(IW_VERSION).tar.bz2
 IW_SITE = http://wireless.kernel.org/download/iw
 IW_DEPENDENCIES = host-pkgconf libnl
 IW_CONFIG = $(IW_DIR)/.config
-IW_MAKE_ENV = PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig" \
-	PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
+IW_MAKE_ENV = PKG_CONFIG="$(HOST_DIR)/usr/bin/pkg-config" \
 	GIT_DIR=$(IW_DIR)
 
 ifeq ($(BR2_PREFER_STATIC_LIB),y)
