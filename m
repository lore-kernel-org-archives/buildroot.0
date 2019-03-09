From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 Mar 2019 21:45:36 +0100
Subject: [Buildroot] [git commit] package/cryptopp: don't build cryptest.exe
Message-ID: <20190309204346.96E698E218@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd1ba229bea3cbb55025a69b7a1348a1a5af6ad6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace install target by install-lib target to avoid building and
installing cryptest.exe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptopp/cryptopp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index dd41b0ec47..59ced7654c 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -24,7 +24,7 @@ define HOST_CRYPTOPP_BUILD_CMDS
 endef
 
 define HOST_CRYPTOPP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-lib
 endef
 
 $(eval $(host-generic-package))
