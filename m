From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Mar 2016 02:57:41 +0200
Subject: [Buildroot] [git commit] package/libxslt: fix static build
Message-ID: <20160329010042.BF5F6802A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0df5ced2ea4a294d140f48aa6959f29695dcb3b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set --with-libxml-libs-prefix so libtool finds the correct dependencies for
libxml2.

Fixes:
http://autobuild.buildroot.net/results/3f8/3f8d876ed6cfe6e73a75fa8904ebdd3f6f0fe53c/

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxslt/libxslt.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 2e5cc14..0cc4bb9 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -14,7 +14,8 @@ LIBXSLT_CONF_OPTS = \
 	--with-gnu-ld \
 	--without-debug \
 	--without-python \
-	--with-libxml-prefix=$(STAGING_DIR)/usr/
+	--with-libxml-prefix=$(STAGING_DIR)/usr/ \
+	--with-libxml-libs-prefix=$(STAGING_DIR)/usr/lib
 LIBXSLT_CONFIG_SCRIPTS = xslt-config
 LIBXSLT_DEPENDENCIES = libxml2
 
