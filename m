From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 May 2018 18:29:56 +0200
Subject: [Buildroot] [PATCH 1/2] package/asterisk: use package's DL_DIR
In-Reply-To: <cover.1526056187.git.yann.morin.1998@free.fr>
References: <cover.1526056187.git.yann.morin.1998@free.fr>
Message-ID: <2a78d5915aa60e734043b5be2382202c96b608d7.1526056187.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sicne we reworked the download infra, the location for packages to look
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
-- 
2.14.1
