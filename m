From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jun 2016 18:20:26 +0200
Subject: [Buildroot] [PATCH 4/7] package/libdvdread: add optional support
	for libdvdcss
In-Reply-To: <1466353229-12798-1-git-send-email-bernd.kuhls@t-online.de>
References: <1466353229-12798-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1466353229-12798-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
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
-- 
2.8.1
