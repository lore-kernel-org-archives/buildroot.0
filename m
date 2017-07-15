From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 11:46:52 +0200
Subject: [Buildroot] [git commit] pulseaudio: add optional dependency on
	bluez5_utils
Message-ID: <20170715094305.CD55981D81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e03dd1cefffd553def74e0f3955839dd2450208
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The pulseaudio configure script autodetects the presence of
bluez 4.x and 5.x packages on the system and will exclude the
bluetooth-related modules in their absence.

This commit ensures that bluez5_utils, if selected, are installed
before pulseaudio. The same already happens for bluez_utils (4.x).

Signed-off-by: Calin Crisan <ccrisan@gmail dot com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pulseaudio/pulseaudio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index ddd503a..2f2cfbb 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -32,6 +32,7 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
 	$(if $(BR2_PACKAGE_BLUEZ_UTILS),bluez_utils) \
+	$(if $(BR2_PACKAGE_BLUEZ5_UTILS),bluez5_utils) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
 	$(if $(BR2_PACKAGE_FFTW),fftw) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
