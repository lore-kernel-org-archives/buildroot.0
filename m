From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:15:30 +0200
Subject: [Buildroot] [git commit] wine: add optional dependency on libkrb5
Message-ID: <20180409091534.0AD4284C70@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93481c4f287b6578bc2685803937628785dafa9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wine/wine.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 02c4c0f155..b6b3aae504 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -23,7 +23,6 @@ WINE_CONF_OPTS = \
 	--without-gphoto \
 	--without-gsm \
 	--without-hal \
-	--without-krb5 \
 	--without-opencl \
 	--without-oss
 
@@ -121,6 +120,13 @@ else
 WINE_CONF_OPTS += --without-glu
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+WINE_CONF_OPTS += --with-krb5
+WINE_DEPENDENCIES += libkrb5
+else
+WINE_CONF_OPTS += --without-krb5
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 WINE_CONF_OPTS += --with-pcap
 WINE_DEPENDENCIES += libpcap
