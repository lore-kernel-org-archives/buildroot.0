From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Nov 2018 00:21:21 +0100
Subject: [Buildroot] [git commit] wireshark: add lz4 optional dependency
Message-ID: <20181106235706.DA22781543@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ac495038261cef5d110e0ffd96bdb87ea02fefe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Optional dependency to lz4 has been added with version 2.4.0 and
  https://github.com/wireshark/wireshark/commit/47649d1c7fb6ba48b805e19268a711404eb6908b
- Specify the path to found lz4 as this is done for other options

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/wireshark/wireshark.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 96cc15d185..f42dca1c86 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -16,7 +16,6 @@ WIRESHARK_CONF_ENV = \
 
 WIRESHARK_CONF_OPTS = \
 	--enable-static=no \
-	--without-lz4 \
 	--without-snappy \
 	--with-libsmi=no \
 	--with-pcap=$(STAGING_DIR)/usr
@@ -115,6 +114,13 @@ else
 WIRESHARK_CONF_OPTS += --without-lua
 endif
 
+ifeq ($(BR2_PACKAGE_LZ4),y)
+WIRESHARK_CONF_OPTS += --with-lz4=$(STAGING_DIR)/usr
+WIRESHARK_DEPENDENCIES += lz4
+else
+WIRESHARK_CONF_OPTS += --without-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_NGHTTP2),y)
 WIRESHARK_CONF_OPTS += --with-nghttp2=$(STAGING_DIR)/usr
 WIRESHARK_DEPENDENCIES += nghttp2
