From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Mar 2019 15:30:19 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: don't build cryptest.exe
Message-ID: <20190309143019.11506-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Replace install target by install-lib target to avoid building and
installing cryptest.exe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
