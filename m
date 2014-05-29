From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 29 May 2014 06:18:53 +0300
Subject: [Buildroot] [PATCH] libfribidi: depend on host-pkgconf
Message-ID: <e29e05429fd22afb4a69057e36d7e26402845764.1401333533.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libfribidi needs macros from pkgconf to generate its configure script. Since
commit 5693f236a2a0 (libfribidi: bump version) we AUTORECONF, so host-pkgconf
is also needed.

Fixes:
http://autobuild.buildroot.net/results/5d7/5d76a8333fb05e903460ad51dc0737c18431d033/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libfribidi/libfribidi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index c9130fe48580..32f414e911a0 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -12,5 +12,6 @@ LIBFRIBIDI_LICENSE_FILES = COPYING
 LIBFRIBIDI_INSTALL_STAGING = YES
 # BR's libtool patch doesn't apply
 LIBFRIBIDI_AUTORECONF = YES
+LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
-- 
2.0.0.rc2
