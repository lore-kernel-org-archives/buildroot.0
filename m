From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Dec 2019 23:10:21 +0100
Subject: [Buildroot] [git commit] package/pipewire: add libva optional
 dependency
Message-ID: <20191221220507.89AE68D3CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a5e8050124579c17e3f8614283827b4b4e214714
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libva is an optional dependency of spa, see:
https://github.com/PipeWire/pipewire/blob/0.2.7/spa/meson.build

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/pipewire.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index ed98ff7f3b..aa3fdc489d 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -15,6 +15,10 @@ ifeq ($(BR2_PACKAGE_FFMPEG),y)
 PIPEWIRE_DEPENDENCIES += ffmpeg
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+PIPEWIRE_DEPENDENCIES += libva
+endif
+
 ifeq ($(BR2_PACKAGE_SBC),y)
 PIPEWIRE_DEPENDENCIES += sbc
 endif
