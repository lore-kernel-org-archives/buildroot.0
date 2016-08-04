From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  4 Aug 2016 22:51:49 +0200
Subject: [Buildroot] [PATCH] package/libdvdread: needs host-pkgconf
Message-ID: <1470343909-5420-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add host-pkgconf to the dependencies since pkg-config is used to find
libdvdcss.

Fixes:
http://autobuild.buildroot.net/results/e5f/e5fffdd51bdd6962149a836af1e7a6bbc6bae20c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/libdvdread/libdvdread.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index c92eca5..adf79d8 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -11,6 +11,6 @@ LIBDVDREAD_INSTALL_STAGING = YES
 LIBDVDREAD_LICENSE = GPLv2+
 LIBDVDREAD_LICENSE_FILES = COPYING
 LIBDVDREAD_CONF_OPTS = --with-libdvdcss
-LIBDVDREAD_DEPENDENCIES = libdvdcss
+LIBDVDREAD_DEPENDENCIES = libdvdcss host-pkgconf
 
 $(eval $(autotools-package))
-- 
2.5.5
