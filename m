From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jan 2011 10:40:17 +0100
Subject: [Buildroot] [git commit master 1/1] dnsmasq: remove dbus cflags
	mangling
Message-ID: <20110130094614.6518B80738@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=be89b851762244c8d3f1c14f1fae6afa1b695b5c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Get rid of cflags workaround now that we always use sysroot, and
pkg-config --cflags dbus-1 thus returns the correct value.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dnsmasq/dnsmasq.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index ea47e96..976e1d6 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -42,8 +42,6 @@ define DNSMASQ_ENABLE_DBUS
 		$(DNSMASQ_DIR)/src/config.h
 	$(SED) 's^PKG_CONFIG = pkg-config^PKG_CONFIG = $(PKG_CONFIG_HOST_BINARY)^' \
 		$(DNSMASQ_DIR)/Makefile
-	$(SED) 's^--cflags dbus-1^--cflags dbus-1 \| sed s\\\#-I/\\\#-I$(STAGING_DIR)/\\\#g^' \
-		$(DNSMASQ_DIR)/Makefile
 endef
 else
 define DNSMASQ_ENABLE_DBUS
-- 
1.7.3.4
