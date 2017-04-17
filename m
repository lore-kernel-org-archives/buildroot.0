From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 17 Apr 2017 12:29:50 +0200
Subject: [Buildroot] [PATCH] package/xenomai: add host-pkgconf dependency
Message-ID: <20170417102950.4040-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without pkg-config PKG_CHECK_MODULES won't be expanded
and ./configure script produces following error message:

./configure: line 13810: syntax error near unexpected token `FUSE,'
./configure: line 13810: `	PKG_CHECK_MODULES(FUSE, fuse)'

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/xenomai/xenomai.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index f68ff90..7c0ad34 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -17,6 +17,8 @@ XENOMAI_LICENSE = GPL-2.0+ with exception (headers), LGPL-2.1+ (libraries), GPL-
 # GFDL is not included but refers to gnu.org
 XENOMAI_LICENSE_FILES = debian/copyright include/COPYING lib/trank/COPYING kernel/cobalt/COPYING
 
+XENOMAI_DEPENDENCIES = host-pkgconf
+
 # 0002-boilerplate-build-obstack-support-conditionally.patch
 XENOMAI_AUTORECONF = YES
 
-- 
2.9.3
