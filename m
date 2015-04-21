From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Apr 2015 12:19:51 +0200
Subject: [Buildroot] [git commit] alsa-utils: add option to install alsaucm
Message-ID: <20150421104410.6F90281D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5e4b44fae3606db8c4e4b77e27380340522a71cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

alsaucm is the alsa use case manager configuration tool.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/Config.in     |    3 +++
 package/alsa-utils/alsa-utils.mk |    1 +
 2 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index c7c0e68..cbc56eb 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -57,6 +57,9 @@ config BR2_PACKAGE_ALSA_UTILS_ACONNECT
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "aconnect"
 
+config BR2_PACKAGE_ALSA_UTILS_ALSAUCM
+	bool "alsaucm"
+
 config BR2_PACKAGE_ALSA_UTILS_APLAYMIDI
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "aplaymidi"
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 65702b7..06bda9a 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -41,6 +41,7 @@ ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIXER) += usr/bin/amixer
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_APLAY) += usr/bin/aplay usr/bin/arecord
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_IECSET) += usr/bin/iecset
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ACONNECT) += usr/bin/aconnect
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSAUCM) += usr/bin/alsaucm
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_APLAYMIDI) += usr/bin/aplaymidi
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI) += usr/bin/arecordmidi
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ASEQDUMP) += usr/bin/aseqdump
