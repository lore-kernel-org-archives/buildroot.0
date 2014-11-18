From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Nov 2014 23:58:42 +0100
Subject: [Buildroot] [git commit branch/next] package: linux-fusion: use
	install instead of cp
Message-ID: <20141118225911.0A133B496B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36c84781293bda65d0374962463c1663735b8907
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

in order to not depend on the previous permissions of the file

Signed-off-by: Guido Mart??nez <guido@vanguardiasur.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-fusion/linux-fusion.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index c5e7976..001388c 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -36,8 +36,8 @@ define LINUX_FUSION_INSTALL_TARGET_CMDS
 		$(LINUX_FUSION_MAKE_OPTS) \
 		INSTALL_MOD_PATH=$(TARGET_DIR) \
 		-C $(@D) install
-	mkdir -p $(LINUX_FUSION_ETC_DIR)
-	cp -dpf package/linux-fusion/40-fusion.rules $(LINUX_FUSION_ETC_DIR)
+	$(INSTALL) -D -m 644 package/linux-fusion/40-fusion.rules \
+		$(LINUX_FUSION_ETC_DIR)/40-fusion.rules
 endef
 
 $(eval $(generic-package))
