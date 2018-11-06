From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Nov 2018 00:13:18 +0100
Subject: [Buildroot] [git commit] wireshark: add libxml2 optional dependency
Message-ID: <20181106235706.C4A4581514@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d7d57560c5fec9f8932a7084ac48e5d9e95d64d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Optional dependency to libxml2 has been added with version 2.4.0 and
https://github.com/wireshark/wireshark/commit/cfab5ef035db7be8502623af203ab3494a9200e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wireshark/wireshark.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index d2b3ec4e4e..a141ca3e2a 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -17,7 +17,6 @@ WIRESHARK_CONF_ENV = \
 WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
 	--without-bcg729 \
-	--without-libxml2 \
 	--without-lz4 \
 	--without-nghttp2 \
 	--without-snappy \
@@ -96,6 +95,13 @@ else
 WIRESHARK_CONF_OPTS += --without-libssh
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+WIRESHARK_CONF_OPTS += --with-libxml2
+WIRESHARK_DEPENDENCIES += libxml2
+else
+WIRESHARK_CONF_OPTS += --without-libxml2
+endif
+
 # no support for lua53 yet
 ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUA_5_2),y)
 WIRESHARK_CONF_OPTS += --with-lua
