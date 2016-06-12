From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 23:10:38 +0200
Subject: [Buildroot] [git commit] libarchive: add host variant
Message-ID: <20160612212023.AB01481D5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02b93c2136e6cfecdff19785036bcf68aa99f51e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be needed for the host variant of the fwup package. We enable
zlib support since host-fwup needs it. All other features are explicitly
disabled.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libarchive/libarchive.mk | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 726142b..e20a737 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -99,4 +99,21 @@ else
 LIBARCHIVE_CONF_OPTS += --without-lzma
 endif
 
+# The only user of host-libarchive needs zlib support
+HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
+HOST_LIBARCHIVE_CONF_OPTS = \
+	--disable-bsdtar \
+	--disable-bsdcpio \
+	--disable-acl \
+	--disable-xattr \
+	--without-bz2lib \
+	--without-expat \
+	--without-libiconv-prefix \
+	--without-xml2 \
+	--without-lzo2 \
+	--without-nettle \
+	--without-openssl \
+	--without-lzma
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
