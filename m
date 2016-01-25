From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:11:23 +0100
Subject: [Buildroot] [git commit] package/gzip: fix musl build
Message-ID: <20160201224707.426897F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=925c77e403871ede56830b957307c8a1b544f0d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Inspired by http://patchwork.openembedded.org/patch/111691/
Adding "gl_cv_func_fflush_stdin=yes" was sufficient to fix the build.

Fixes
http://autobuild.buildroot.net/results/56d/56d926fcf8ca53cddb9106617e3b852d9c9a4eeb/
http://autobuild.buildroot.net/results/4b5/4b5a6196b686030cf7fa9706508fd99f81a81049/
http://autobuild.buildroot.net/results/568/568c1c05800d6bdd6457845e998a598e354afdfd/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gzip/gzip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 4ae2ae0..1b2f678 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -13,5 +13,6 @@ GZIP_CONF_OPTS = --exec-prefix=/
 GZIP_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 GZIP_LICENSE = GPLv3+
 GZIP_LICENSE_FILES = COPYING
+GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
 
 $(eval $(autotools-package))
