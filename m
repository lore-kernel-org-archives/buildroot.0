From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2021 18:59:24 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/dhcpcd: create
 /var/db/dhcpcd
Message-ID: <20210202173941.BE3B98690A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3f28f98e0da2ab7a6d52d487169ad43e0988643
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13506

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 8c0069775f..63da9a879f 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -40,6 +40,7 @@ endef
 
 define DHCPCD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+	mkdir -p $(TARGET_DIR)/var/db/dhcpcd
 endef
 
 # When network-manager is enabled together with dhcpcd, it will use
