From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 9 Apr 2018 17:51:04 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/kmod: fix host
 install
Message-ID: <20180409155223.0C5D488195@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34b8a1c5bcb7523f7f125f3b558d8cb1872cdf66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The host directory no longer uses /usr.

This currently works because we still have the  legacy /usr
symlink, but for correctness it is better that we just fix it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dac25351e6453b35ded611ff367b95bb4b10a9cf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
