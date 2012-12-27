From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 27 Dec 2012 18:56:19 +0100
Subject: [Buildroot] [git commit] freetype: security bump to version 2.4.11
Message-ID: <20121227175705.95E559A4B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fc0d1be16b6ee1a24eeb3498b98034aa37cf4cca
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a security vulnerability in the BDF implementation.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/freetype/freetype.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index a34c9ad..be87a48 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,11 +4,13 @@
 #
 #############################################################
 
-FREETYPE_VERSION = 2.4.10
+FREETYPE_VERSION = 2.4.11
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://downloads.sourceforge.net/project/freetype/freetype2/$(FREETYPE_VERSION)
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
+FREETYPE_LICENSE = Dual FTL/GPLv2+
+FREETYPE_LICENSE_FILES = docs/FTL.txt docs/GPLv2.txt
 FREETYPE_DEPENDENCIES = host-pkgconf \
 	$(if $(BR2_PACKAGE_ZLIB),zlib) \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2)
