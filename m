From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Dec 2014 23:25:08 +0100
Subject: [Buildroot] [git commit] alsa-utils: add error handling to for loop
Message-ID: <20141201223450.8097280048@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1b5f3b16f4b3280b014d171f3f5b81b6340c75df
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/alsa-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 17895c3..a599af8 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -46,7 +46,7 @@ ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST) += usr/bin/speaker-tes
 define ALSA_UTILS_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/var/lib/alsa
 	for i in $(ALSA_UTILS_TARGETS_y); do \
-		$(INSTALL) -D -m 755 $(STAGING_DIR)/$$i $(TARGET_DIR)/$$i; \
+		$(INSTALL) -D -m 755 $(STAGING_DIR)/$$i $(TARGET_DIR)/$$i || exit 1; \
 	done
 	if [ -x "$(TARGET_DIR)/usr/bin/speaker-test" ]; then \
 		mkdir -p $(TARGET_DIR)/usr/share/alsa/speaker-test; \
