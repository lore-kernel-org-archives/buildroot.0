From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  1 Nov 2020 13:05:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/wireshark: add zstd optional
 dependency
Message-ID: <20201101120558.1083803-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zstd is available since version 3.1.1 and is enabled by default:
https://github.com/wireshark/wireshark/commit/ad94c4d459d243c0cbbb9b222d5f7cdf8189ab86

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 0bcb97606a..0d4fedb3f0 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -155,6 +155,13 @@ else
 WIRESHARK_CONF_OPTS += -DBUILD_sdjournal=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+WIRESHARK_CONF_OPTS += -DENABLE_ZSTD=ON
+WIRESHARK_DEPENDENCIES += zstd
+else
+WIRESHARK_CONF_OPTS += -DENABLE_ZSTD=OFF
+endif
+
 # Disable plugins as some of them (like l16mono) can't be built
 # statically. ENABLE_STATIC=ON actually means "disable shared library"
 # and ENABLE_STATIC=OFF means "enable shared library". So for the
-- 
2.28.0
