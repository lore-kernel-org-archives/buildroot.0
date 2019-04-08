From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:30:38 +0200
Subject: [Buildroot] [git commit] package/openjdk: fix alsa-lib dependencies
Message-ID: <20190408202650.942228D41B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e02703c32a42b7c2d287ee1963c3457be0fbb76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

OpenJDK requires the following alsa-lib modules to be build:
  - mixer
  - pcm
  - rawmidi
  - seq

Fixes:

  http://autobuild.buildroot.net/results/c35d64e659960663c935a31f4cb8ed4180728eb1
  http://autobuild.buildroot.net/results/845fe32967c9879b6c1adbf0630f358be215e174

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openjdk/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 9cd7bffea3..1363587ed5 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -26,6 +26,10 @@ config BR2_PACKAGE_OPENJDK
 	depends on BR2_USE_MMU # cups
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_MIXER
+	select BR2_PACKAGE_ALSA_LIB_PCM
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 	select BR2_PACKAGE_CUPS
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_GIFLIB
