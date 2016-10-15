From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:16:32 +0200
Subject: [Buildroot] [git commit] wf111: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161015121834.CF72181F71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d95db2098f12b7c5f6e7b64eab9c9f86d7214ea9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wf111/wf111.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wf111/wf111.mk b/package/wf111/wf111.mk
index e17e846..ad9d891 100644
--- a/package/wf111/wf111.mk
+++ b/package/wf111/wf111.mk
@@ -25,7 +25,7 @@ endif
 # separately the build step and the install step and get a correct
 # behavior. So we do everything in the install step.
 define WF111_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PWD=$(@D) \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PWD=$(@D) \
 		$(LINUX_MAKE_FLAGS) KDIR=$(LINUX_DIR) \
 		OUTPUT=$(TARGET_DIR) install_static
 endef
