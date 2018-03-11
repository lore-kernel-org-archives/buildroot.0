From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 22:14:46 +0100
Subject: [Buildroot] [git commit] libmpdclient: fix static linking
Message-ID: <20180311211645.249AE82DE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be40c05dc5865feeb36436b5d4be5a1dc51598f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/45208e51814b777a5a133b0e345e800ee51d8a53

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmpdclient/libmpdclient.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 3ab8e9884c..a399516fe3 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -16,6 +16,7 @@ LIBMPDCLIENT_DEPENDENCIES = host-meson
 LIBMPDCLIENT_CONF_OPTS += \
 	--prefix=/usr \
 	--libdir=/usr/lib \
+	--default-library $(if $(BR2_STATIC_LIBS),static,shared) \
 	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
 	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
 
