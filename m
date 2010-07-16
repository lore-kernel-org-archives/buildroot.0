From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Jul 2010 23:45:42 +0200
Subject: [Buildroot] [PATCH 1/2] linux-fusion: use install target instead of
	headers_install
In-Reply-To: <cover.1279316732.git.thomas.petazzoni@free-electrons.com>
References: <cover.1279316732.git.thomas.petazzoni@free-electrons.com>
Message-ID: <0d42aba5426138379399331070d0b9a6ea784569.1279316732.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
1.7.0.4
