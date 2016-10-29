From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Oct 2016 15:52:32 +0200
Subject: [Buildroot] [git commit] cryptopp: use $(HOST_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161029135923.42AA7800FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb50481b36425ae428991595bac391a1f571ded3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cryptopp/cryptopp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 86a2da1..456876c 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -20,11 +20,11 @@ HOST_CRYPTOPP_MAKE_OPTS = \
 	CXXFLAGS="$(HOST_CXXFLAGS) -fPIC"
 
 define HOST_CRYPTOPP_BUILD_CMDS
-	$(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) shared
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) shared
 endef
 
 define HOST_CRYPTOPP_INSTALL_CMDS
-	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install
 endef
 
 $(eval $(host-generic-package))
