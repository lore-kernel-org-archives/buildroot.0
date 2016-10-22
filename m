From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] tidsp-binaries: use $(TARGET_MAKE_ENV)
	when calling $(MAKE)
Message-ID: <20161022132037.973467F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=beb1c8cb5e7b5c2fcb7263d108d30f6eeaf30eb7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tidsp-binaries/tidsp-binaries.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tidsp-binaries/tidsp-binaries.mk b/package/tidsp-binaries/tidsp-binaries.mk
index bc542cd..9736bc7 100644
--- a/package/tidsp-binaries/tidsp-binaries.mk
+++ b/package/tidsp-binaries/tidsp-binaries.mk
@@ -10,7 +10,7 @@ TIDSP_BINARIES_LICENSE = TI Proprietary License
 TIDSP_BINARIES_LICENSE_FILES = LICENSE
 
 define TIDSP_BINARIES_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) -e DESTDIR=$(TARGET_DIR) install
 endef
 
 $(eval $(generic-package))
