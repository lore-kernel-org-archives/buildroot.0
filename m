From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Apr 2018 10:11:51 +0200
Subject: [Buildroot] [PATCH] package/kmod: fix host install
Message-ID: <20180408081151.23331-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host directory no longer uses /usr.

This currently works because we still have the  legacy /usr
symlink, but for correctness it is better that we just fix it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
---
 package/kmod/kmod.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index bd676108aa..e1149b7b65 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -74,7 +74,7 @@ endif
 # host.
 define HOST_KMOD_INSTALL_TOOLS
 	mkdir -p $(HOST_DIR)/sbin/
-	ln -sf ../usr/bin/kmod $(HOST_DIR)/sbin/depmod
+	ln -sf ../bin/kmod $(HOST_DIR)/sbin/depmod
 endef
 
 HOST_KMOD_POST_INSTALL_HOOKS += HOST_KMOD_INSTALL_TOOLS
-- 
2.14.1
