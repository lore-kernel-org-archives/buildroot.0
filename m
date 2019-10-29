From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:06:32 +0100
Subject: [Buildroot] [git commit] package/openvpn: add libselinux support
Message-ID: <20191029231257.B0176836B4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e87cb52b5573e030bf4aa0ce58510c765aa935dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the libselinux package is selected, add the package to the
dependency list and explicitly set --enable-selinux.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openvpn/openvpn.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 75dde04493..277b072deb 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -38,6 +38,13 @@ else
 OPENVPN_CONF_OPTS += --disable-lzo
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+OPENVPN_DEPENDENCIES += libselinux
+OPENVPN_CONF_OPTS += --enable-selinux
+else
+OPENVPN_CONF_OPTS += --disable-selinux
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 OPENVPN_DEPENDENCIES += systemd
 OPENVPN_CONF_OPTS += --enable-systemd
