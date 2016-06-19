From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 19 Jun 2016 23:07:41 +0200
Subject: [Buildroot] [git commit] package/libdvdread: add optional support
	for libdvdcss
Message-ID: <20160619213724.3876480489@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0306b5926493e3b153ed32f20f131f0407552bdb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdvdread/libdvdread.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index 78ea292..b8541fa 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -11,4 +11,11 @@ LIBDVDREAD_INSTALL_STAGING = YES
 LIBDVDREAD_LICENSE = GPLv2+
 LIBDVDREAD_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_LIBDVDCSS),y)
+LIBDVDREAD_CONF_OPTS += --with-libdvdcss
+LIBDVDREAD_DEPENDENCIES += libdvdcss
+else
+LIBDVDREAD_CONF_OPTS += --without-libdvdcss
+endif
+
 $(eval $(autotools-package))
