From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 3 May 2011 22:43:55 +0200
Subject: [Buildroot] [git commit] alsa-utils: make /var/lib/alsa directory
	in target
Message-ID: <20110503204511.D25B382BDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b05f23b933018c2ccce890620a6bdbb6619001ce
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

alsactl needs /var/lib/alsa to store asound.state when saving mixer
settings so make it in the target.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/alsa-utils/alsa-utils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/alsa-utils/alsa-utils.mk b/package/multimedia/alsa-utils/alsa-utils.mk
index d5c34d3..f395420 100644
--- a/package/multimedia/alsa-utils/alsa-utils.mk
+++ b/package/multimedia/alsa-utils/alsa-utils.mk
@@ -36,6 +36,7 @@ ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ASEQNET) += usr/bin/aseqnet
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST) += usr/bin/speaker-test
 
 define ALSA_UTILS_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/var/lib/alsa
 	for i in $(ALSA_UTILS_TARGETS_y); do \
 		install -D -m 755 $(STAGING_DIR)/$$i $(TARGET_DIR)/$$i; \
 	done
-- 
1.7.3.4
