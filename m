From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 May 2011 21:41:47 +0200
Subject: [Buildroot] [git commit] libxslt: fixup configure options
Message-ID: <20110502195833.E5D5882BD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=28cdaaee5236d0cbe3a6afde808f5eef260e7c33
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some configure options changed so adjust.
Forcibly disabling threads isn't good and also it's detected by
configure when there are no threads.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxslt/libxslt.mk |   13 +++----------
 1 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 1efdcf8..07f6697 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -15,19 +15,12 @@ else
 LIBXSLT_XTRA_CONF_OPT = --without-crypto
 endif
 
-LIBXSLT_CONF_OPT = --with-gnu-ld --enable-shared \
-		--enable-static $(LIBXSLT_XTRA_CONF_OPT) \
-		--without-debugging --without-python \
-		--without-threads \
-		--with-libxml-prefix=$(STAGING_DIR)/usr/
+LIBXSLT_CONF_OPT = --with-gnu-ld $(LIBXSLT_XTRA_CONF_OPT) --without-debug \
+		--without-python --with-libxml-prefix=$(STAGING_DIR)/usr/
 
 LIBXSLT_DEPENDENCIES = libxml2 $(LIBXSLT_DEPENDENCIES_EXTRA)
 
-HOST_LIBXSLT_CONF_OPT = --enable-shared \
-			--without-debugging \
-			--without-python \
-			--without-threads \
-			--without-crypto
+HOST_LIBXSLT_CONF_OPT = --without-debug --without-python --without-crypto
 
 HOST_LIBXSLT_DEPENDENCIES = host-libxml2
 
-- 
1.7.3.4
