From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 22:05:33 +0200
Subject: [Buildroot] [git commit] package/lcdproc: add libpng optional
	dependency
Message-ID: <20170608200537.C60D080444@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e77a558826f12b22d1bfd49c2ec6c84ba0c97f61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/b68/b68f54404a7d412d639ebb6d052412eea6ee3bf1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lcdproc/lcdproc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lcdproc/lcdproc.mk b/package/lcdproc/lcdproc.mk
index d86eb33..c6476eb 100644
--- a/package/lcdproc/lcdproc.mk
+++ b/package/lcdproc/lcdproc.mk
@@ -18,4 +18,11 @@ endif
 
 LCDPROC_DEPENDENCIES = freetype ncurses zlib
 
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+LCDPROC_DEPENDENCIES += libpng
+LCDPROC_CONF_OPTS += --enable-libpng
+else
+LCDPROC_CONF_OPTS += --disable-libpng
+endif
+
 $(eval $(autotools-package))
