From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 18:10:24 +0100
Subject: [Buildroot] [git commit] alsa-utils: allow installing the new
	alsatplg tool
Message-ID: <20160116171448.E92227F9E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9d6ba356109508108bf896a57521af30886685c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we now depend on !BR2_STATIC_LIBS to be able to build the
alsatplg tool, it makes sense to provide an option to install it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-utils/Config.in     | 3 +++
 package/alsa-utils/alsa-utils.mk | 1 +
 2 files changed, 4 insertions(+)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 2486d0f..82f3ad6 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -45,6 +45,9 @@ comment "alsamixer needs a toolchain w/ wchar"
 config BR2_PACKAGE_ALSA_UTILS_ALSAUCM
 	bool "alsaucm"
 
+config BR2_PACKAGE_ALSA_UTILS_ALSATPLG
+	bool "alsatplg"
+
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
 	bool "amidi"
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
diff --git a/package/alsa-utils/alsa-utils.mk b/package/alsa-utils/alsa-utils.mk
index 11b46c4..32822bb 100644
--- a/package/alsa-utils/alsa-utils.mk
+++ b/package/alsa-utils/alsa-utils.mk
@@ -43,6 +43,7 @@ endif
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACONF) += usr/sbin/alsaconf
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSACTL) += usr/sbin/alsactl
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSAMIXER) += usr/bin/alsamixer
+ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_ALSATPLG) += usr/bin/alsatplg
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIDI) += usr/bin/amidi
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_AMIXER) += usr/bin/amixer
 ALSA_UTILS_TARGETS_$(BR2_PACKAGE_ALSA_UTILS_APLAY) += usr/bin/aplay usr/bin/arecord
