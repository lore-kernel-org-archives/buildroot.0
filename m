From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Jun 2021 23:28:37 +0200
Subject: [Buildroot] [git commit] package/libsoup: fix build with NLS
Message-ID: <20210609205756.CC5A18C368@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=50fc126b8ecca747af1bb53f14fcb39b7b9965fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failure with NLS raised since bump to version 2.72.0 in commit
8e5f7f1cfc8fd7a9d5270f6a9707eb9eecfd21da

Fixes:
 - http://autobuild.buildroot.org/results/1793753629d81476a3cd6fea40029cbd7de0206c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsoup/libsoup.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/libsoup/libsoup.mk b/package/libsoup/libsoup.mk
index 6711326711..2f63e9e85c 100644
--- a/package/libsoup/libsoup.mk
+++ b/package/libsoup/libsoup.mk
@@ -19,7 +19,10 @@ LIBSOUP_DEPENDENCIES = \
 	libglib2 \
 	libpsl \
 	libxml2 \
-	sqlite
+	sqlite \
+	$(TARGET_NLS_DEPENDENCIES)
+
+LIBSOUP_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 LIBSOUP_CONF_OPTS = \
 	-Dgssapi=disabled \
