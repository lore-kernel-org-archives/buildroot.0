From: Calin Crisan <ccrisan@gmail.com>
Date: Fri, 14 Jul 2017 19:21:35 +0300
Subject: [Buildroot] [PATCH 1/1] pulseaudio: add bluez5_utils as dependency
Message-ID: <20170714162137.9402-1-ccrisan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pulseaudio configure script autodetects the presence of
bluez 4.x and 5.x packages on the system and will exclude the
bluetooth-related modules in their absence.

This commit ensures that bluez5_utils, if selected, are installed
before pulseaudio. The same already happens for bluez_utils (4.x).

Signed-off-by: Calin Crisan <ccrisan@gmail dot com>
---
 package/pulseaudio/pulseaudio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index ddd503a9f..2f2cfbbed 100644
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
-- 
2.13.2
