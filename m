From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 12:39:15 +0100
Subject: [Buildroot] [git commit] tftpd: fix build without ipv6
Message-ID: <20111114114011.700E28F4D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e796a1fd7cda4d93a372a2d89d0fc0e5deb6c7f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tftpd's configure script uses a nonstandard --without-ipv6 option to
disable ipv6 support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tftpd/tftpd.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 98c3c2a..728319b 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -8,6 +8,10 @@ TFTPD_SOURCE   = tftp-hpa-$(TFTPD_VERSION).tar.bz2
 TFTPD_SITE     = $(BR2_KERNEL_MIRROR)/software/network/tftp/
 TFTPD_CONF_OPT = --without-tcpwrappers
 
+ifneq ($(BR2_INET_IPV6),y)
+TFTPD_CONF_OPT += --without-ipv6
+endif
+
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftpd/tftpd $(TARGET_DIR)/usr/sbin/tftpd
 	$(INSTALL) -D package/tftpd/S80tftpd-hpa $(TARGET_DIR)/etc/init.d/
