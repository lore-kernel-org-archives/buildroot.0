From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Feb 2013 22:48:48 +0100
Subject: [Buildroot] [git commit] libvorbis: fix LIBVORBIS_SITE
Message-ID: <20130217221225.5CDAF9AA09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=933e0ffe2ca1613e7b98deac61d8f3a94485b712
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The LIBVORBIS_SITE included a reference to $(LIBVORBIS-SOURCE), which
doesn't exist. And anyway was useless because the <pkg>_SITE variable
should not contain the name of the tarball.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libvorbis/libvorbis.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index ace8147..5b9048e 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -6,7 +6,7 @@
 
 LIBVORBIS_VERSION = 1.3.3
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.gz
-LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/$(LIBVORBIS-SOURCE)
+LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/
 LIBVORBIS_INSTALL_STAGING = YES
 LIBVORBIS_CONF_OPT = --disable-oggtest
 LIBVORBIS_DEPENDENCIES = host-pkgconf libogg
