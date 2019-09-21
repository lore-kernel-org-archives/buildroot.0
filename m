From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Sep 2019 22:54:34 +0200
Subject: [Buildroot] [git commit] package/pulseaudio: enable reproducible
 builds
Message-ID: <20190921205013.3B5548F06D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e11e50d96d0df256ea43eaa0cb0913684abd0c5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added support to create reproducible builds:
https://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=3d9deb1e5679e15c3277e144a822be9b0a036514

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseaudio/pulseaudio.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 53e10429ad..b833d4ad27 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -13,7 +13,8 @@ PULSEAUDIO_LICENSE_FILES = LICENSE GPL LGPL
 PULSEAUDIO_CONF_OPTS = \
 	--disable-default-build-tests \
 	--disable-legacy-database-entry-format \
-	--disable-manpages
+	--disable-manpages \
+	--disable-running-from-build-tree
 
 PULSEAUDIO_DEPENDENCIES = \
 	host-pkgconf libtool libsndfile speex host-intltool \
