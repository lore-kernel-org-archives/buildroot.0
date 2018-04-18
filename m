From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 10:58:06 +0200
Subject: [Buildroot] [git commit] nmap: fix check-package warning
Message-ID: <20180418090250.212A988739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27043c7a2536b9d1c8770b8c1c36b53a98efac0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/nmap/nmap.mk:88: expected indent with tabs
93 lines processed
1 warnings generated

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nmap/nmap.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nmap/nmap.mk b/package/nmap/nmap.mk
index 391215dbf4..1c89b5424e 100644
--- a/package/nmap/nmap.mk
+++ b/package/nmap/nmap.mk
@@ -85,7 +85,7 @@ endif
 # Add a symlink to "nc" if none of the competing netcats is selected
 ifeq ($(BR2_PACKAGE_NMAP_NCAT):$(BR2_PACKAGE_NETCAT)$(BR2_PACKAGE_NETCAT_OPENBSD),y:)
 define NMAP_INSTALL_NCAT_SYMLINK
-        ln -fs ncat $(TARGET_DIR)/usr/bin/nc
+	ln -fs ncat $(TARGET_DIR)/usr/bin/nc
 endef
 NMAP_POST_INSTALL_TARGET_HOOKS += NMAP_INSTALL_NCAT_SYMLINK
 endif
