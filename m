From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 23:40:51 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] sdl2_image: security bump
 to version 2.0.3
Message-ID: <20180501073419.643F88271A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a98c1d86ec16d5b57f93babab6e531ac8a3e1c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes the following security issues:

CVE-2017-12122: An exploitable code execution vulnerability exists in the
ILBM image rendering functionality of SDL2_image-2.0.2.  A specially crafted
ILBM image can cause a heap overflow resulting in code execution.  An
attacker can display a specially crafted image to trigger this
vulnerability.

CVE-2017-14440: An exploitable code execution vulnerability exists in the
ILBM image rendering functionality of SDL2_image-2.0.2.  A specially crafted
ILBM image can cause a stack overflow resulting in code execution.  An
attacker can display a specially crafted image to trigger this
vulnerability.

CVE-2017-14441: An exploitable code execution vulnerability exists in the
ICO image rendering functionality of SDL2_image-2.0.2.  A specially crafted
ICO image can cause an integer overflow, cascading to a heap overflow
resulting in code execution.  An attacker can display a specially crafted
image to trigger this vulnerability.

CVE-2017-14442: An exploitable code execution vulnerability exists in the
BMP image rendering functionality of SDL2_image-2.0.2.  A specially crafted
BMP image can cause a stack overflow resulting in code execution.  An
attacker can display a specially crafted image to trigger this
vulnerability.

CVE-2017-14448: An exploitable code execution vulnerability exists in the
XCF image rendering functionality of SDL2_image-2.0.2.  A specially crafted
XCF image can cause a heap overflow resulting in code execution.  An
attacker can display a specially crafted image to trigger this
vulnerability.

CVE-2017-14449: A double-Free vulnerability exists in the XCF image
rendering functionality of SDL2_image-2.0.2.  A specially crafted XCF image
can cause a Double-Free situation to occur.  An attacker can display a
specially crafted image to trigger this vulnerability.

CVE-2017-14450: A buffer overflow vulnerability exists in the GIF image
parsing functionality of SDL2_image-2.0.2.  A specially crafted GIF image
can lead to a buffer overflow on a global section.  An attacker can display
an image to trigger this vulnerability.

For details, see the announcement:

https://discourse.libsdl.org/t/sdl-image-2-0-3-released/23958

Also add a hash for the license file while we're at it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5fb8fbbb3e776a186731ae929244a82ea2db1878)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sdl2_image/sdl2_image.hash | 3 ++-
 package/sdl2_image/sdl2_image.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/sdl2_image/sdl2_image.hash b/package/sdl2_image/sdl2_image.hash
index 26d0a88cb5..cf3253526c 100644
--- a/package/sdl2_image/sdl2_image.hash
+++ b/package/sdl2_image/sdl2_image.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 3a3eafbceea5125c04be585373bfd8b3a18f259bd7eae3efc4e6d8e60e0d7f64  SDL2_image-2.0.1.tar.gz
+sha256 3510c25da735ffcd8ce3b65073150ff4f7f9493b866e85b83738083b556d2368  SDL2_image-2.0.3.tar.gz
+sha256 13240ed78c8726c510b9634976430d3d3a9ea2d1ced3214119766e9e71568a35  COPYING.txt
diff --git a/package/sdl2_image/sdl2_image.mk b/package/sdl2_image/sdl2_image.mk
index 71a9634023..8c1c5f6e1a 100644
--- a/package/sdl2_image/sdl2_image.mk
+++ b/package/sdl2_image/sdl2_image.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SDL2_IMAGE_VERSION = 2.0.1
+SDL2_IMAGE_VERSION = 2.0.3
 SDL2_IMAGE_SOURCE = SDL2_image-$(SDL2_IMAGE_VERSION).tar.gz
 SDL2_IMAGE_SITE = http://www.libsdl.org/projects/SDL_image/release
 SDL2_IMAGE_INSTALL_STAGING = YES
