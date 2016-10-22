From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Oct 2016 15:19:24 +0200
Subject: [Buildroot] [git commit] directfb: use $(HOST_MAKE_ENV) when
	calling $(MAKE)
Message-ID: <20161022132038.9C6B87F9EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c4daa55fe21857ca09842c23a6050b3310a85e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/directfb.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index d51094f..595d590 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -161,7 +161,7 @@ HOST_DIRECTFB_CONF_OPTS = \
 	--with-inputdrivers=none
 
 HOST_DIRECTFB_BUILD_CMDS = \
-	$(MAKE) -C $(@D)/tools directfb-csource
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/tools directfb-csource
 
 HOST_DIRECTFB_INSTALL_CMDS = \
 	$(INSTALL) -m 0755 $(@D)/tools/directfb-csource $(HOST_DIR)/usr/bin
