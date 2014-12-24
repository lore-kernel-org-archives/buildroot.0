From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Dec 2014 20:09:12 +0100
Subject: [Buildroot] [PATCH 1/2] package/guile: needs libtool
In-Reply-To: <cover.1419448003.git.yann.morin.1998@free.fr>
References: <cover.1419448003.git.yann.morin.1998@free.fr>
Message-ID: <cd0898e973d85fd66ca0df7c9d21f9501bda5e20.1419448003.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

guile build-depends on libtool, but forgot to select it Kconfig.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/guile/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/guile/Config.in b/package/guile/Config.in
index 8f86e9f..6859caf 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -8,6 +8,7 @@ config BR2_PACKAGE_GUILE
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_BDWGC
+	select BR2_PACKAGE_LIBTOOL
 	help
 	  Guile is an interpreter and compiler for the Scheme
 	  programming language, a clean and elegant dialect of Lisp.
-- 
1.9.1
