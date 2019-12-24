From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 24 Dec 2019 11:06:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: alsa support needs
 rawmidi and seq
Message-ID: <20191224100637.915534-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/8c8149a7cf87f24271fa6af8a6c81d2dfe241bbe
 - http://autobuild.buildroot.org/results/d7b05205b0bb45d927b5bb462e06fd8c345ebc42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fluidsynth/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/fluidsynth/Config.in b/package/fluidsynth/Config.in
index c4818c3790..c1cb923489 100644
--- a/package/fluidsynth/Config.in
+++ b/package/fluidsynth/Config.in
@@ -23,6 +23,8 @@ config BR2_PACKAGE_FLUIDSYNTH_ALSA_LIB
 	default y
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
+	select BR2_PACKAGE_ALSA_LIB_SEQ
 	help
 	  Enable alsa support.
 
-- 
2.24.0
