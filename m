From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 10:14:46 +0100
Subject: [Buildroot] [git commit] package/pulseaudio: use the new
 fftw-single package
Message-ID: <20190206091325.8C86C803B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f47d4181d975d56177fae0f5544d973b04cd74c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch add an explicitly dependency to fftw-single (the only compatible
fftw's flavor) instead of default behavior where the package do assumption
about the compatible version.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseaudio/pulseaudio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index d1c35654cf..c91af22935 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -21,7 +21,7 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
-	$(if $(BR2_PACKAGE_FFTW),fftw) \
+	$(if $(BR2_PACKAGE_FFTW_SINGLE),fftw-single) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
 ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
