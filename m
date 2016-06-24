From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Jun 2016 13:41:20 +0200
Subject: [Buildroot] [git commit] pulseaudio: fix udev configure option
Message-ID: <20160624114152.17FF282136@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d5087b0d7cf37437964eaa47bfa95d8a76a7cf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

enable-libudev doesn't exist as a configure option. The right one is
enable-udev.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseaudio/pulseaudio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 024b168..f50ea67 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -79,10 +79,10 @@ PULSEAUDIO_CONF_OPTS += --without-soxr
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-PULSEAUDIO_CONF_OPTS += --enable-libudev
+PULSEAUDIO_CONF_OPTS += --enable-udev
 PULSEAUDIO_DEPENDENCIES += udev
 else
-PULSEAUDIO_CONF_OPTS += --disable-libudev
+PULSEAUDIO_CONF_OPTS += --disable-udev
 endif
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
