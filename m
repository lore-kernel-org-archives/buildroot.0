From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 31 Oct 2018 23:56:46 +0100
Subject: [Buildroot] [PATCH 1/2] wireshark: add libssh optional dependency
Message-ID: <20181031225647.23660-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Optional dependency to libssh has been added with version 2.2.1 and
  https://github.com/wireshark/wireshark/commit/d6da95231ee790fd884ca2a41fe59aa9b05ccde9
- Specify the path to found libssh as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.17.1
