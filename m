From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:25:14 +0200
Subject: [Buildroot] [git commit] xl2tp: use $(TARGET_CONFIGURE_OPTS) when
	calling $(MAKE)
Message-ID: <20161022132857.DCB7081941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2aa98b1de6a60c3482c43ab494ba13bcf83420e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
[Thomas: fix commit title.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xl2tp/xl2tp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xl2tp/xl2tp.mk b/package/xl2tp/xl2tp.mk
index a823716..29e2f28 100644
--- a/package/xl2tp/xl2tp.mk
+++ b/package/xl2tp/xl2tp.mk
@@ -20,7 +20,7 @@ define XL2TP_BUILD_CMDS
 endef
 
 define XL2TP_INSTALL_TARGET_CMDS
-	$(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) DESTDIR=$(TARGET_DIR) PREFIX=/usr -C $(@D) install
 endef
 
 $(eval $(generic-package))
