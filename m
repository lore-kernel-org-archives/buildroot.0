From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 29 Oct 2019 17:56:04 -0700
Subject: [Buildroot] [PATCH v2] package/openvpn: add pkcs11 support
In-Reply-To: <20191030005604.81615-1-aduskett@gmail.com>
References: <20191030005604.81615-1-aduskett@gmail.com>
Message-ID: <20191030005604.81615-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

If the pkcs11-helper package is selected, add the package to the
dependency list and explicitly set --enable-pkcs11.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/openvpn/openvpn.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 8ee9c1a4b4..e966a3b628 100644
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
-- 
2.23.0
