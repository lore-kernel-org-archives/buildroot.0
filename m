From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Nov 2018 21:43:18 +0100
Subject: [Buildroot] [git commit] package/wireshark: add libssh optional
 dependency
Message-ID: <20181102204126.E6E8488315@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69c38e27a837f7a1e8b4d999c7f050dbc82e5900
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Optional dependency to libssh has been added with version 2.2.1 and
  https://github.com/wireshark/wireshark/commit/d6da95231ee790fd884ca2a41fe59aa9b05ccde9
- Specify the path to found libssh as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index fb90f2b940..4569a86cb1 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -92,6 +92,13 @@ else
 WIRESHARK_CONF_OPTS += --without-libnl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSSH),y)
+WIRESHARK_CONF_OPTS += --with-libssh=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += libssh
+else
+WIRESHARK_CONF_OPTS += --without-libssh
+endif
+
 ifeq ($(BR2_PACKAGE_SBC),y)
 WIRESHARK_CONF_OPTS += --with-sbc=yes
 WIRESHARK_DEPENDENCIES += sbc
