From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jun 2014 14:38:49 +0200
Subject: [Buildroot] [git commit] package/minidlna: Always depend on
	host-gettext
Message-ID: <20140613124035.850199CFB2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9243374346fb58c22bc34de8643dc39b213a275a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/7d1/7d10e2c13a1caf61b8bd18b85e5e5af50e5e7c48/

checking for msgfmt... no

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/minidlna/minidlna.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
