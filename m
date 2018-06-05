From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Jun 2018 18:30:59 +0200
Subject: [Buildroot] [git commit] mono: remove eglib/COPYING from license
 files
Message-ID: <20180605163105.80F0C837E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=444d13ca52a112a5a433aedd8619d0eef9541165
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When bumping Mono to 5.12.0.226 in commit
80821d3ed8e5607d259386abe5e3f98625614d11, the license files variable
was not updated to take into account that "eglib" is no longer part of
Mono, and therefore eglib/COPYING doesn't exist anymore. This commit
therefore fixes the license files variable following this change.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mono/mono.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mono/mono.mk b/package/mono/mono.mk
index 2d60fc68fd..d1fe9bb0b1 100644
--- a/package/mono/mono.mk
+++ b/package/mono/mono.mk
@@ -8,7 +8,7 @@ MONO_VERSION = 5.12.0.226
 MONO_SITE = http://download.mono-project.com/sources/mono
 MONO_SOURCE = mono-$(MONO_VERSION).tar.bz2
 MONO_LICENSE = GPL-2.0 or MIT (compiler, tools), MIT (libs) or commercial
-MONO_LICENSE_FILES = LICENSE mcs/COPYING eglib/COPYING \
+MONO_LICENSE_FILES = LICENSE mcs/COPYING \
 	external/Newtonsoft.Json/Tools/7-zip/copying.txt
 MONO_INSTALL_STAGING = YES
 
