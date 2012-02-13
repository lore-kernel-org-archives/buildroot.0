From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 13 Feb 2012 11:26:42 +0100
Subject: [Buildroot] [git commit] libvncserver: ensure target
	libgcrypt-config is used
Message-ID: <20120213102818.E2EF890A88@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08bd8712efa26ea78c4674524abaa078cbc5b929
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libvncserver/libvncserver.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index c98fba3..90c021d 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -24,6 +24,7 @@ LIBVNCSERVER_CONF_OPT += --without-crypto
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+LIBVNCSERVER_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 LIBVNCSERVER_DEPENDENCIES += libgcrypt
 else
 LIBVNCSERVER_CONF_OPT += --without-gcrypt
