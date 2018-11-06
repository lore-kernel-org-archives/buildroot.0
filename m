From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Nov 2018 00:14:04 +0100
Subject: [Buildroot] [git commit] wireshark: add bcg729 optional dependency
Message-ID: <20181106235706.D1FBD81543@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55ae4bc4d3deb051a65785d6bac15c250912a34a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Optional dependency to bcg729 has been added with version 2.5.0 and
  https://github.com/wireshark/wireshark/commit/3e54cabf8193e6a8cd607b1671defb8b6800b53d
- Specify the path to found bcg729 as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wireshark/wireshark.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 39a3060149..96cc15d185 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -16,7 +16,6 @@ WIRESHARK_CONF_ENV = \
 
 WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
-	--without-bcg729 \
 	--without-lz4 \
 	--without-snappy \
 	--with-libsmi=no \
@@ -52,6 +51,13 @@ ifeq ($(BR2_PACKAGE_WIRESHARK_GUI),)
 WIRESHARK_CONF_OPTS += --disable-wireshark
 endif
 
+ifeq ($(BR2_PACKAGE_BCG729),y)
+WIRESHARK_CONF_OPTS += --with-bcg729=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += bcg729
+else
+WIRESHARK_CONF_OPTS += --without-bcg729
+endif
+
 ifeq ($(BR2_PACKAGE_C_ARES),y)
 WIRESHARK_CONF_OPTS += --with-c-ares=$(STAGING_DIR)/usr
 WIRESHARK_DEPENDENCIES += c-ares
