From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:28:31 +0100
Subject: [Buildroot] [git commit] package/ffmpeg: fix typo "--enable-bsfs"
 -> "--enable-bsf"
Message-ID: <20200314141553.8DA7582B84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f783486d07b24708a5bf45ad713353a2f90b926b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix ffmpeg configuration when BR2_PACKAGE_FFMPEG_BSFS is not default ("all"):

	Unknown option "--enable-bsfs=h264_metadata".
	See ./configure --help for available options.
	package/pkg-generic.mk:254: recipe for target '/root/buildroot/output/build/ffmpeg-4.2.2/.stamp_configured' failed

The option is named according to the scheme "--enable-SINGULAR=..." /
"--disable-PLURAL".

The typo is present since the release 2014.02:

https://git.buildroot.net/buildroot/commit/package/ffmpeg/ffmpeg.mk?id=62ab07ef769bd6504fe1db144aaac3fd45db9dad

Signed-off-by: Anatoly Borodin <anatoly.borodin@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ffmpeg/ffmpeg.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f0047c4e3b..b7148bbba2 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -135,7 +135,7 @@ endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS)),all)
 FFMPEG_CONF_OPTS += --disable-bsfs \
-	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS)),--enable-bsfs=$(x))
+	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_BSFS)),--enable-bsf=$(x))
 endif
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_PROTOCOLS)),all)
