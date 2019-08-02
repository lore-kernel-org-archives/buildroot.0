From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Aug 2019 22:37:23 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/cryptopp: don't
 build cryptest.exe
Message-ID: <20190802203843.5038F8CA75@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f1cdd80c4d878f19cbf5131c02cd3a98f05c0c20
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Replace install target by install-lib target to avoid building and
installing cryptest.exe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit bd1ba229bea3cbb55025a69b7a1348a1a5af6ad6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptopp/cryptopp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 8e3277a941..ae5feee433 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -24,7 +24,7 @@ define HOST_CRYPTOPP_BUILD_CMDS
 endef
 
 define HOST_CRYPTOPP_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-lib
 endef
 
 $(eval $(host-generic-package))
