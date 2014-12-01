From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:06:01 +0100
Subject: [Buildroot] [git commit] openvpn: use <pkg>_INSTALL_INIT_SYSV
	mechanism
Message-ID: <20141201221141.0DA068002F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b7b3f50a7273a4e5e819d3bdb123e16e1cea710
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/openvpn.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index e0dba35..68f7d97 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -50,6 +50,9 @@ endif
 define OPENVPN_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/src/openvpn/openvpn \
 		$(TARGET_DIR)/usr/sbin/openvpn
+endef
+
+define OPENVPN_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/openvpn/S60openvpn \
 		$(TARGET_DIR)/etc/init.d/S60openvpn
 endef
