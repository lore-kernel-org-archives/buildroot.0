From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 May 2015 00:07:03 +0200
Subject: [Buildroot] [git commit] alsa-utils: amidi option needs seq support
	in alsa-lib
Message-ID: <20150514230013.553C181E01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c69088b8c35177cecdd0f1f385c13f5b2c509f1d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/5347b57d23b44e1b011a499875ce638ed654418a/

Otherwise the rawmidi_virt.c file doesn't get built, breaking static
linking.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-utils/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/alsa-utils/Config.in b/package/alsa-utils/Config.in
index cbc56eb..3a99279 100644
--- a/package/alsa-utils/Config.in
+++ b/package/alsa-utils/Config.in
@@ -39,6 +39,7 @@ comment "alsamixer needs a toolchain w/ wchar"
 
 config BR2_PACKAGE_ALSA_UTILS_AMIDI
 	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "amidi"
 
 config BR2_PACKAGE_ALSA_UTILS_AMIXER
