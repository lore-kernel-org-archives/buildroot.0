From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 20 Sep 2019 19:25:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/pulseaudio: enable reproducible
 builds
In-Reply-To: <20190920172538.1635-1-bernd.kuhls@t-online.de>
References: <20190920172538.1635-1-bernd.kuhls@t-online.de>
Message-ID: <20190920172538.1635-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream added support to create reproducible builds:
https://cgit.freedesktop.org/pulseaudio/pulseaudio/commit/?id=3d9deb1e5679e15c3277e144a822be9b0a036514

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.20.1
