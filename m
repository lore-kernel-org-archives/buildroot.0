From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:54:42 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/openrc: fix
 post-install-target addition
Message-ID: <20200314174231.765BC839DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=804d40e72dd33968fa6d805e500a72bf6ad8bee0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

OPENRC_POST_TARGET_INSTALL_HOOKS -> OPENRC_POST_INSTALL_TARGET_HOOKS

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 4e3e53483c8b54064a408acb231734f9aef07c2c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openrc/openrc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 3f6453cef5..289bde4d03 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -47,7 +47,7 @@ define OPENRC_NO_NET
 	$(RM) $(TARGET_DIR)/etc/init.d/{network,staticroute,loopback}
 	$(RM) $(TARGET_DIR)/etc/conf.d/{network,staticroute,loopback}
 endef
-OPENRC_POST_TARGET_INSTALL_HOOKS += OPENRC_NO_NET
+OPENRC_POST_INSTALL_TARGET_HOOKS += OPENRC_NO_NET
 endif
 
 define OPENRC_REMOVE_UNNEEDED
