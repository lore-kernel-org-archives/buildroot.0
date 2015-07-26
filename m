From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 15:22:03 +0200
Subject: [Buildroot] [git commit branch/next] package/ffmpeg: Fix mips
	compile
Message-ID: <20150808105641.7D2127FFCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1ca32adee49b7eb3194e469eb7d59e0a392f1320
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

buildroot has no support for msa, CONFIG_CPU_HAS_MSA is not enabled in
kernel config.

Fixes
http://autobuild.buildroot.net/results/030/03055aa696e9e885baabb43fff613d751974a4b7//
http://autobuild.buildroot.net/results/6b5/6b5c13c949e8ae23f1b58c6da4002371130e9bb3//
http://autobuild.buildroot.net/results/1af/1af3c68bc21503438fb0066f5e51e82e35a5442b//
and many others

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 0162db2..28c6012 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -41,6 +41,7 @@ FFMPEG_CONF_OPTS = \
 	--enable-runtime-cpudetect \
 	--disable-hardcoded-tables \
 	--disable-memalign-hack \
+	--disable-msa \
 	--enable-hwaccels \
 	--disable-avisynth \
 	--disable-frei0r \
