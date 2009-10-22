From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 22 Oct 2009 23:14:33 +0200
Subject: [Buildroot] [PATCH] libarchive: add conditional dependency on zlib
Message-ID: <1256246073-31069-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If zlib is selected, then it should be built before libarchive so that
libarchive picks up the headers and includes support for zlib
compression.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/libarchive/libarchive.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 32f68f7..6a2706f 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -10,6 +10,9 @@ LIBARCHIVE_LIBTOOL_PATCH = NO
 LIBARCHIVE_INSTALL_STAGING = YES
 LIBARCHIVE_INSTALL_TARGET = YES
 
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+LIBARCHIVE_DEPENDENCIES = zlib
+
 LIBARCHIVE_CONF_OPT = \
 	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDTAR),--enable-bsdtar,--disable-bsdtar) \
 	$(if $(BR2_PACKAGE_LIBARCHIVE_BSDCPIO),--enable-bsdcpio,--disable-bsdcpio)
-- 
1.6.5
