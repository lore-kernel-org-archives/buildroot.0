From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Sep 2014 09:41:41 +0200
Subject: [Buildroot] [git commit] alsa-lib: use correct Kconfig symbol for
	mmu
Message-ID: <20140913074255.CAD609D68A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0d99dd8c80a5a141eca3daaa469340795a562913
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is BR2_USE_MMU, not BR2_MMU

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/alsa-lib/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index adee5cd..a732c08 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -38,7 +38,7 @@ config BR2_PACKAGE_ALSA_LIB_DEVDIR
 config BR2_PACKAGE_ALSA_LIB_PCM_PLUGINS
 	string "built PCM plugins"
 	default "all" if BR2_USE_MMU
-	default "copy linear route mulaw alaw adpcm rate plug multi file null empty share meter hooks lfloat ladspa dmix dshare dsnoop asym iec958 softvol extplug ioplug mmap_emul" if !BR2_MMU
+	default "copy linear route mulaw alaw adpcm rate plug multi file null empty share meter hooks lfloat ladspa dmix dshare dsnoop asym iec958 softvol extplug ioplug mmap_emul" if !BR2_USE_MMU
 
 config BR2_PACKAGE_ALSA_LIB_CTL_PLUGINS
 	string "built control plugins"
