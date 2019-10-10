From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Oct 2019 22:00:52 +0200
Subject: [Buildroot] [git commit] package/sdl_mixer: disable parallel build
Message-ID: <20191010195508.8080C8C621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fcc22749e80cff1a021fad8defaac044a208d137
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build sometimes fails on:
Fatal error: can't create build/load_aiff.o: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/c800ef60d8af0cd76f2f1de9aff573120ebd8ada

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sdl_mixer/sdl_mixer.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/sdl_mixer/sdl_mixer.mk b/package/sdl_mixer/sdl_mixer.mk
index 1c6912accf..9183a4aa8c 100644
--- a/package/sdl_mixer/sdl_mixer.mk
+++ b/package/sdl_mixer/sdl_mixer.mk
@@ -10,6 +10,9 @@ SDL_MIXER_SITE = http://www.libsdl.org/projects/SDL_mixer/release
 SDL_MIXER_LICENSE = Zlib
 SDL_MIXER_LICENSE_FILES = COPYING
 
+# Package does not build in parallel due to improper make rules
+SDL_MIXER_MAKE = $(MAKE1)
+
 SDL_MIXER_INSTALL_STAGING = YES
 SDL_MIXER_DEPENDENCIES = sdl
 
