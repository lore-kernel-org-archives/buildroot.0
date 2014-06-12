From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 12 Jun 2014 08:06:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/minidlna: Always depend on
	host-gettext
Message-ID: <1402553197-6411-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/7d1/7d10e2c13a1caf61b8bd18b85e5e5af50e5e7c48/

checking for msgfmt... no

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/minidlna/minidlna.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
index e1e2f3d..78652c3 100644
--- a/package/minidlna/minidlna.mk
+++ b/package/minidlna/minidlna.mk
@@ -10,7 +10,7 @@ MINIDLNA_LICENSE = GPLv2 BSD-3c
 MINIDLNA_LICENSE_FILES = COPYING LICENCE.miniupnpd
 
 MINIDLNA_DEPENDENCIES = \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext host-gettext) \
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-gettext \
 	ffmpeg flac libvorbis libogg libid3tag libexif libjpeg sqlite \
 	host-xutil_makedepend
 
-- 
1.7.10.4
