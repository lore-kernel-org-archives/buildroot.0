From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 Nov 2017 22:26:40 +0100
Subject: [Buildroot] [PATCH 1/1] linphone: add libupnp dependency
Message-ID: <20171126212640.23519-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linphone is compatible with libupnp but not with libupnp18 so disable
upnp if libupnp is not enabled

Fixes:
 - http://autobuild.buildroot.net/results/473c686f9bc5335d25b720cf1b0c45389138a7b4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/linphone/linphone.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/linphone/linphone.mk b/package/linphone/linphone.mk
index fb5e18db6..a10d6bb20 100644
--- a/package/linphone/linphone.mk
+++ b/package/linphone/linphone.mk
@@ -50,4 +50,11 @@ else
 LINPHONE_CONF_OPTS += --disable-libv4l1 --disable-libv4l2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUPNP),y)
+LINPHONE_DEPENDENCIES += libupnp
+LINPHONE_CONF_OPTS += --enable-upnp
+else
+LINPHONE_CONF_OPTS += --disable-upnp
+endif
+
 $(eval $(autotools-package))
-- 
2.14.1
