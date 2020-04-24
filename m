From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 24 Apr 2020 11:18:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtasn1: needs autoreconf
Message-ID: <20200424091824.17492-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 6e1fde98e4deda8506e694c6d3ffba3fbd4d1d0e forgot to set
LIBTASN1_AUTORECONF

Fixes:
 - http://autobuild.buildroot.org/results/383e3cba56894df0e3dd53bfe9cee3f4bb80d412

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libtasn1/libtasn1.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index d721e79a6a..e61741043f 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -12,5 +12,7 @@ LIBTASN1_LICENSE_FILES = LICENSE doc/COPYING doc/COPYING.LESSER
 LIBTASN1_INSTALL_STAGING = YES
 # 'missing' fallback logic botched so disable it completely
 LIBTASN1_CONF_ENV = MAKEINFO="true"
+# We're patching fuzz/Makefile.am
+LIBTASN1_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.25.1
