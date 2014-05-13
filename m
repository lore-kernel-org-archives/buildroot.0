From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 May 2014 09:26:45 +0200
Subject: [Buildroot] [git commit] wpa_supplicant: detect readline support in
	wpa_cli
Message-ID: <20140513084927.22E1E9CBC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8505a2613f32365c5c8b7b5645690707a2bc53f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Oscar Hellstr??m <oscar.hellstrom@vinnter.se>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpa_supplicant/wpa_supplicant.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 9fcda2e..9321f08 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -105,6 +105,11 @@ define WPA_SUPPLICANT_DEBUG_CONFIG
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_READLINE),y)
+	WPA_SUPPLICANT_DEPENDENCIES += readline
+	WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
+endif
+
 define WPA_SUPPLICANT_CONFIGURE_CMDS
 	cp $(@D)/wpa_supplicant/defconfig $(WPA_SUPPLICANT_CONFIG)
 	sed -i $(patsubst %,-e 's/^#\(%\)/\1/',$(WPA_SUPPLICANT_CONFIG_ENABLE)) \
