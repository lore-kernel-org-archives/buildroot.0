From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:06:11 +0100
Subject: [Buildroot] [git commit] package/openvpn: add systemd support
Message-ID: <20191029231257.A55A87FF9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=62264233b2705baa075797922256fc7940af502a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the systemd package is selected, add the package to the
dependency list and explicitly set --enable-systemd.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openvpn/openvpn.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 4c6956fe12..75dde04493 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -38,6 +38,13 @@ else
 OPENVPN_CONF_OPTS += --disable-lzo
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+OPENVPN_DEPENDENCIES += systemd
+OPENVPN_CONF_OPTS += --enable-systemd
+else
+OPENVPN_CONF_OPTS += --disable-systemd
+endif
+
 define OPENVPN_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 $(@D)/src/openvpn/openvpn \
 		$(TARGET_DIR)/usr/sbin/openvpn
