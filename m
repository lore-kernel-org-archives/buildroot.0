From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Jan 2020 14:54:17 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/pulseaudio:
 replace host-intltool by $(TARGET_NLS_DEPENDENCIES)
Message-ID: <20200110134452.817C583B7E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df602d4d95d4b2a3f7df3b920e18d2ad5a83bd3d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

intltool has been replaced by gettext since version 12.99.1 and
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/commit/57e3ccaf51f714eec8ca29005c3cc4fde456e84e
so replace host-intltool by $(TARGET_NLS_DEPENDENCIES)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit c7130471583d200ecd10606b10f116b1c00dfa42)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pulseaudio/pulseaudio.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index b833d4ad27..b30c8a0156 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -17,7 +17,8 @@ PULSEAUDIO_CONF_OPTS = \
 	--disable-running-from-build-tree
 
 PULSEAUDIO_DEPENDENCIES = \
-	host-pkgconf libtool libsndfile speex host-intltool \
+	host-pkgconf libtool libsndfile speex \
+	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_PACKAGE_LIBGLIB2),libglib2) \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
