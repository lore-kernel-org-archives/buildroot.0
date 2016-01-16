From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 17:57:07 +0100
Subject: [Buildroot] [git commit] alsa-utils: put 'select' after 'bool'
Message-ID: <20160116171448.5973B81ED7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adb2d79c3ef102c9349b56cc4a83ffacfd02d1aa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the definitions of the alsa-utils sub-options, the 'select' were
before the 'bool', which is unusual and does not follow how we do
things in general in Buildroot. This commit fixes that for all
alsa-utils suboptions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsa-utils/Config.in | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index af3d466..8681131 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -39,52 +39,52 @@ comment "alsamixer needs a toolchain w/ wchar"
 	depends on !BR2_USE_WCHAR
 
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
+	bool "amidi"
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 	select BR2_PACKAGE_ALSA_LIB_SEQ
-	bool "amidi"
 
 config BR2_PACKAGE_ALSA_UTILS_AMIXER
-	select BR2_PACKAGE_ALSA_LIB_MIXER
 	bool "amixer"
+	select BR2_PACKAGE_ALSA_LIB_MIXER
 
 config BR2_PACKAGE_ALSA_UTILS_APLAY
-	select BR2_PACKAGE_ALSA_LIB_PCM
 	bool "aplay/arecord"
+	select BR2_PACKAGE_ALSA_LIB_PCM
 
 config BR2_PACKAGE_ALSA_UTILS_BAT
-	select BR2_PACKAGE_FFTW
 	bool "bat"
+	select BR2_PACKAGE_FFTW
 
 config BR2_PACKAGE_ALSA_UTILS_IECSET
-	select BR2_PACKAGE_ALSA_LIB_PCM
 	bool "iecset"
+	select BR2_PACKAGE_ALSA_LIB_PCM
 
 config BR2_PACKAGE_ALSA_UTILS_ACONNECT
-	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "aconnect"
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 
 config BR2_PACKAGE_ALSA_UTILS_ALSAUCM
 	bool "alsaucm"
 
 config BR2_PACKAGE_ALSA_UTILS_APLAYMIDI
-	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "aplaymidi"
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 
 config BR2_PACKAGE_ALSA_UTILS_ARECORDMIDI
-	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "arecordmidi"
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 
 config BR2_PACKAGE_ALSA_UTILS_ASEQDUMP
-	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "aseqdump"
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 
 config BR2_PACKAGE_ALSA_UTILS_ASEQNET
-	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "aseqnet"
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 
 config BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST
-	select BR2_PACKAGE_ALSA_LIB_PCM
 	bool "speaker-test"
+	select BR2_PACKAGE_ALSA_LIB_PCM
 
 endmenu
 
