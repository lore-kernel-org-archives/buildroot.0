From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jun 2018 22:55:29 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/transmission: fix
 inotify configure option
Message-ID: <20180611211536.F22E08832D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e7c5ad5d1a8399e58e2d131e834efb1064e42cae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

The configure option is really called --with-inotify:
https://github.com/transmission/transmission/blob/2.9x/configure.ac#L211

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit acadbe6393e360d4b77195ec61bbe8b48d668c85)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/transmission/transmission.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index 32e8e70789..f10fa190c8 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -16,7 +16,7 @@ TRANSMISSION_DEPENDENCIES = \
 	zlib
 TRANSMISSION_AUTORECONF = YES
 TRANSMISSION_CONF_OPTS = \
-	--disable-libnotify \
+	--without-inotify \
 	--enable-lightweight
 TRANSMISSION_LICENSE = GPL-2.0 or GPL-3.0 with OpenSSL exception
 TRANSMISSION_LICENSE_FILES = COPYING
