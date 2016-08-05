From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Aug 2016 09:13:18 +0200
Subject: [Buildroot] [git commit] package/libdvdread: needs host-pkgconf
Message-ID: <20160805071803.624A581831@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ee6bcb8e58af374bb3d718d57361beb10f20b5e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add host-pkgconf to the dependencies since pkg-config is used to find
libdvdcss.

Fixes:
http://autobuild.buildroot.net/results/e5f/e5fffdd51bdd6962149a836af1e7a6bbc6bae20c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
