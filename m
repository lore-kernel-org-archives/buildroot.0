From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Feb 2019 22:55:46 +0100
Subject: [Buildroot] [git commit] libpcap: add support for bluez5_utils
Message-ID: <20190202215542.2C981807BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4c8760bdc501f44dcf77a8ee40349a4387e517ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bluez5_utils support has been added since version 1.8.0 and
https://github.com/the-tcpdump-group/libpcap/commit/b3776f3d50df9de9fcf702bd21a3ecb2539ffef4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
