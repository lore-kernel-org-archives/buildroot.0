From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Jul 2010 14:25:45 +0200
Subject: [Buildroot] [git commit master 1/1] netsnmp: depend on openssl when
	the package is on to ensure build order
Message-ID: <20100729122626.695EA8367F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7bfc9e464cf448f83b06953f1b26a150539b3960
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The netsnmp package should depend on openssl when using it.
Otherwise netsnmp might get built before openssl and poison the
configure cache since it's not a mandatory dependency.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/netsnmp/netsnmp.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 8f8bc76..7c9367a 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -28,6 +28,7 @@ endif
 
 # OpenSSL
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	NETSNMP_DEPENDENCIES += openssl
 	NETSNMP_CONF_OPT += \
 		--with-openssl=$(STAGING_DIR)/usr/include/openssl
 else
-- 
1.7.1
