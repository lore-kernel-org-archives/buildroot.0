From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 23:09:39 +0100
Subject: [Buildroot] [git commit] package/pulseaudio: replace host-intltool
 by $(TARGET_NLS_DEPENDENCIES)
Message-ID: <20200101220022.85C648EB28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c7130471583d200ecd10606b10f116b1c00dfa42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

intltool has been replaced by gettext since version 12.99.1 and
https://gitlab.freedesktop.org/pulseaudio/pulseaudio/commit/57e3ccaf51f714eec8ca29005c3cc4fde456e84e
so replace host-intltool by $(TARGET_NLS_DEPENDENCIES)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pulseaudio/pulseaudio.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 0e78724634..e64aa6f97b 100644
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
