From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Mar 2016 21:20:27 +0100
Subject: [Buildroot] [git commit branch/next] avahi: move libdns_sd compat
	hook definition inside conditional block
Message-ID: <20160302202031.6BC7581926@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2dfabd10d1e484d84c0e6b5a58ab43d131ca3230
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As directed in the buildroot manual, "Optional hooks: keep hook
definition and assignment together in one if block".  And also
to be consistent with the rest of avahi.mk.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/avahi/avahi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index cad7acd..8cf5f23 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -216,13 +216,13 @@ define AVAHI_INSTALL_INIT_SYSV
 	$(AVAHI_INSTALL_DAEMON_INIT_SYSV)
 endef
 
+ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
 # applications expects to be able to #include <dns_sd.h>
 define AVAHI_STAGING_INSTALL_LIBDNSSD_LINK
 	ln -sf avahi-compat-libdns_sd/dns_sd.h \
 		$(STAGING_DIR)/usr/include/dns_sd.h
 endef
 
-ifeq ($(BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY),y)
 AVAHI_POST_INSTALL_STAGING_HOOKS += AVAHI_STAGING_INSTALL_LIBDNSSD_LINK
 endif
 
