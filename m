From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:16:22 +0200
Subject: [Buildroot] [git commit] lsof: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161015121834.C5FBE81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=152e98ccab075ac373406fa676d0c1b6bfd95da1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lsof/lsof.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 312d834..e5cd4bc 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -47,7 +47,7 @@ define LSOF_CONFIGURE_CMDS
 endef
 
 define LSOF_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS)" -C $(@D)
 endef
 
 define LSOF_INSTALL_TARGET_CMDS
