From: Guo Ren <ren_guo@c-sky.com>
Date: Thu,  2 Nov 2017 20:14:33 +0800
Subject: [Buildroot] [PATCH 1/1] package/dtc: qemu system build need libfdt.
Message-ID: <1509624873-16240-1-git-send-email-ren_guo@c-sky.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "install-bin" just install dtc's programs to host/bin without
libfdt, but qemu system compile need libfdt.

see: https://gitlab.com/c-sky/buildroot/-/jobs/38654503

So we need install libfdt to satisfy qemu system compile.

Change-Id: I85748479ac11e1c6452d3f79d04f02666218774a
Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 package/dtc/dtc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index dd0f30d..1bcee29 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -51,7 +51,7 @@ define HOST_DTC_BUILD_CMDS
 endef
 
 define HOST_DTC_INSTALL_CMDS
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-bin
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
 
 $(eval $(generic-package))
-- 
2.7.4
