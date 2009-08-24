From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Aug 2009 22:28:47 +0200
Subject: [Buildroot] [git commit master] libxslt: tell ./configure where
	libxml is
Message-ID: <20090824202958.03FC87774C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5cecbb7fba1c97351543efad399ef8801e6e63ee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libxslt is currently configured with --with-libxml-include-prefix,
which allows libxslt ./configure to find libxml headers. However, the
build of libxslt fails because it doesn't find the library itself.

Therefore, instead of using --with-libxml-include-prefix, we switch to
the more generic --with-libxml-prefix.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxslt/libxslt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 8d8785f..35659d3 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -21,7 +21,7 @@ LIBXSLT_CONF_OPT = --with-gnu-ld --enable-shared \
 		$(DISABLE_NLS) $(DISABLE_IPV6) \
 		--without-debugging --without-python \
 		--without-threads \
-		--with-libxml-include-prefix=$(STAGING_DIR)/usr/include/libxml2
+		--with-libxml-prefix=$(STAGING_DIR)/usr/
 
 LIBXSLT_DEPENDENCIES = uclibc $(LIBXSLT_DEPENDENCIES_EXTRA)
 
-- 
1.6.3.3
