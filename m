From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 10 Feb 2012 11:41:52 +0100
Subject: [Buildroot] [git commit] freetype: add optional bzip2 dependency
Message-ID: <20120210104213.4DE5490A51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2e727571cc41a2a20cdea42998ae2739e4cce11b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/freetype/freetype.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 6eb6b29..32099da 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -9,7 +9,9 @@ FREETYPE_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_INSTALL_STAGING = YES
 FREETYPE_MAKE_OPT = CCexe="$(HOSTCC)"
-FREETYPE_DEPENDENCIES = host-pkg-config $(if $(BR2_PACKAGE_ZLIB),zlib)
+FREETYPE_DEPENDENCIES = host-pkg-config \
+	$(if $(BR2_PACKAGE_ZLIB),zlib) \
+	$(if $(BR2_PACKAGE_BZIP2),bzip2)
 
 HOST_FREETYPE_DEPENDENCIES = host-pkg-config
 
