From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 23 Oct 2009 10:15:11 +0200
Subject: [Buildroot] [git commit master] libarchive: add conditional
	dependency on zlib
Message-ID: <20091023081636.629347779A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dc5ae2c428d1012317653816f5001892574cd3ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If zlib is selected, then it should be built before libarchive so that
libarchive picks up the headers and includes support for zlib
compression.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libarchive/libarchive.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 32f68f7..efd1656 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -10,6 +10,10 @@ LIBARCHIVE_LIBTOOL_PATCH = NO
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_INSTALL_TARGET = YES
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBARCHIVE_DEPENDENCIES = zlib
+endif
+
 LIBARCHIVE_CONF_OPT = \
 	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDTAR),--enable-bsdtar,--disable-bsdtar) \
 	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),--enable-bsdcpio,--disable-bsdcpio)
-- 
1.6.3.3
