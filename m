From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Jan 2019 23:33:55 +0100
Subject: [Buildroot] [PATCH 2/2] libpcap: add support for bluez5_utils
In-Reply-To: <20190129223355.30600-1-fontaine.fabrice@gmail.com>
References: <20190129223355.30600-1-fontaine.fabrice@gmail.com>
Message-ID: <20190129223355.30600-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bluez5_utils support has been added since version 1.8.0 and
https://github.com/the-tcpdump-group/libpcap/commit/b3776f3d50df9de9fcf702bd21a3ecb2539ffef4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpcap/libpcap.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libpcap/libpcap.mk b/package/libpcap/libpcap.mk
index daa369f66c..8cc444e7af 100644
--- a/package/libpcap/libpcap.mk
+++ b/package/libpcap/libpcap.mk
@@ -24,9 +24,10 @@ define LIBPCAP_CONFIG_REMOVE_RPATH
 endef
 LIBPCAP_POST_BUILD_HOOKS = LIBPCAP_CONFIG_REMOVE_RPATH
 
-# On purpose, not compatible with bluez5
 ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
 LIBPCAP_DEPENDENCIES += bluez_utils
+else ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+LIBPCAP_DEPENDENCIES += bluez5_utils
 else
 LIBPCAP_CONF_OPTS += --disable-bluetooth
 endif
-- 
2.14.1
