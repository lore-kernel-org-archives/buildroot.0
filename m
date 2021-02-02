From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2021 18:59:09 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/dhcpcd: create
 /var/db/dhcpcd
Message-ID: <20210202173951.58D208151D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41cbb88372601346aedc2e9f7ab379ff481d1a2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13506

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 4900e0581f..4b01172e51 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -41,6 +41,7 @@ endef
 
 define DHCPCD_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
+	mkdir -p $(TARGET_DIR)/var/db/dhcpcd
 endef
 
 # When network-manager is enabled together with dhcpcd, it will use
