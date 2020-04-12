From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 23:35:34 +0200
Subject: [Buildroot] [git commit] package/openvpn: add pkcs11 support
Message-ID: <20200412212155.E46E58E94B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf8eca8fd3126e8727f12c1daa87be3b63b1419f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the pkcs11-helper package is selected, add the package to the
dependency list and explicitly set --enable-pkcs11.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvpn/openvpn.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 64f459eee3..6c0f70ce89 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -51,6 +51,13 @@ else
 OPENVPN_CONF_OPTS += --disable-plugin-auth-pam
 endif
 
+ifeq ($(BR2_PACKAGE_PKCS11_HELPER),y)
+OPENVPN_DEPENDENCIES += pkcs11-helper
+OPENVPN_CONF_OPTS += --enable-pkcs11
+else
+OPENVPN_CONF_OPTS += --disable-pkcs11
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 OPENVPN_DEPENDENCIES += systemd
 OPENVPN_CONF_OPTS += --enable-systemd
