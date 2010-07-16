From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Jul 2010 00:02:13 +0200
Subject: [Buildroot] [git commit master 1/1] linux-fusion: use install
	target instead of headers_install
Message-ID: <20100716220328.328B882B55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0d42aba5426138379399331070d0b9a6ea784569
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The headers_install target no longer exists in the Makefile, the
installation of headers is done by the install target.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 package/linux-fusion/linux-fusion.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
index c9ebed7..54f53a3 100644
--- a/package/linux-fusion/linux-fusion.mk
+++ b/package/linux-fusion/linux-fusion.mk
@@ -37,7 +37,7 @@ define LINUX_FUSION_INSTALL_STAGING_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
 		$(LINUX_FUSION_MAKE_OPTS) \
 		INSTALL_MOD_PATH=$(STAGING_DIR) \
-		-C $(@D) headers_install
+		-C $(@D) install
 endef
 
 define LINUX_FUSION_INSTALL_TARGET_CMDS
-- 
1.7.1
