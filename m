From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 17:59:08 +0100
Subject: [Buildroot] [git commit] alsa-utils: re-order sub-options to use
	alphabetic ordering
Message-ID: <20160116171448.D4F487F9E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=62fff78d628edde402cfe5e641c2fbaad19847a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-utils/Config.in | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index 8681131..2486d0f 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -21,6 +21,10 @@ menu "ALSA utils selection"
 config BR2_PACKAGE_ALSA_UTILS_ALSACONF
 	bool "alsaconf"
 
+config BR2_PACKAGE_ALSA_UTILS_ACONNECT
+	bool "aconnect"
+	select BR2_PACKAGE_ALSA_LIB_SEQ
+
 config BR2_PACKAGE_ALSA_UTILS_ALSACTL
 	bool "alsactl"
 	default y
@@ -38,6 +42,9 @@ config BR2_PACKAGE_ALSA_UTILS_ALSAMIXER
 comment "alsamixer needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
+config BR2_PACKAGE_ALSA_UTILS_ALSAUCM
+	bool "alsaucm"
+
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
 	bool "amidi"
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
@@ -51,21 +58,6 @@ config BR2_PACKAGE_ALSA_UTILS_APLAY
 	bool "aplay/arecord"
 	select BR2_PACKAGE_ALSA_LIB_PCM
 
-config BR2_PACKAGE_ALSA_UTILS_BAT
-	bool "bat"
-	select BR2_PACKAGE_FFTW
-
-config BR2_PACKAGE_ALSA_UTILS_IECSET
-	bool "iecset"
-	select BR2_PACKAGE_ALSA_LIB_PCM
-
-config BR2_PACKAGE_ALSA_UTILS_ACONNECT
-	bool "aconnect"
-	select BR2_PACKAGE_ALSA_LIB_SEQ
-
-config BR2_PACKAGE_ALSA_UTILS_ALSAUCM
-	bool "alsaucm"
-
 config BR2_PACKAGE_ALSA_UTILS_APLAYMIDI
 	bool "aplaymidi"
 	select BR2_PACKAGE_ALSA_LIB_SEQ
@@ -82,6 +74,14 @@ config BR2_PACKAGE_ALSA_UTILS_ASEQNET
 	bool "aseqnet"
 	select BR2_PACKAGE_ALSA_LIB_SEQ
 
+config BR2_PACKAGE_ALSA_UTILS_BAT
+	bool "bat"
+	select BR2_PACKAGE_FFTW
+
+config BR2_PACKAGE_ALSA_UTILS_IECSET
+	bool "iecset"
+	select BR2_PACKAGE_ALSA_LIB_PCM
+
 config BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST
 	bool "speaker-test"
 	select BR2_PACKAGE_ALSA_LIB_PCM
