From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 21:58:54 +0200
Subject: [Buildroot] [git commit] package/asterisk: use package's DL_DIR
Message-ID: <20180511195850.73DB981589@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9c5f17a928ecfcad0d253b0db601fd94046d34f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we reworked the download infra, the location for packages to look
for their files has moved to a per-package directory.

For systems where a download of the asterisk sound files was already
done in a version prior to the rework, all was working fine so far,
because the files were indeed in the main DL directory.

But for systems where the download is first attempted after the rework,
the files are not found (even though they are properly downloaded).

Fix the location where asterisk looks for its extra files.

Reported-by: ***** ***** <zyama.abel@mail.ru>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: ***** ***** <zyama.abel@mail.ru>
Cc: Carlos Santos <casantos@datacom.ind.br>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/asterisk/asterisk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 28b85da562..f2f210b524 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -102,7 +102,7 @@ ASTERISK_CONF_OPTS = \
 	--with-libxml2 \
 	--with-ncurses="$(STAGING_DIR)/usr" \
 	--with-sqlite3="$(STAGING_DIR)/usr" \
-	--with-sounds-cache=$(BR2_DL_DIR)
+	--with-sounds-cache=$(ASTERISK_DL_DIR)
 
 # avcodec are from ffmpeg. There is virtually zero chance this could
 # even work; asterisk is looking for ffmpeg/avcodec.h which has not
