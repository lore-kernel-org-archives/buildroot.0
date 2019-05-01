From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 1 May 2019 15:18:24 +0200
Subject: [Buildroot] [git commit] package/network-manager: don't use
 --disable-crashtrace
Message-ID: <20190501133150.F34D080F9B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6665cfeb08f6ee5ba848a2053e239789984c07a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It was removed long ago and does nothing.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/network-manager/network-manager.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 721533038c..96f842f120 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -82,11 +82,6 @@ else
 NETWORK_MANAGER_CONF_OPTS += --disable-ovs
 endif
 
-# uClibc by default doesn't have backtrace support, so don't use it
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
-NETWORK_MANAGER_CONF_OPTS += --disable-crashtrace
-endif
-
 define NETWORK_MANAGER_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/network-manager/S45network-manager $(TARGET_DIR)/etc/init.d/S45network-manager
 endef
