From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 22:13:54 +0100
Subject: [Buildroot] [git commit] package/dtc: qemu system build need libfdt
Message-ID: <20171102210708.4138781021@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b8c3e941731ddfc3728045142aa9081adeeeaee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "install-bin" target just installs dtc's programs to host/bin
without libfdt, but building qemu system requires libfdt.

see: https://gitlab.com/c-sky/buildroot/-/jobs/38654503

So we need to install libfdt to satisfy the requirements of qemu.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
