From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Thu,  1 Jul 2021 07:01:01 +0200
Subject: [Buildroot] [PATCH 2/2] package/gqrx: fix comment dependency
In-Reply-To: <20210701050101.23916-1-gwenj@trabucayre.com>
References: <20210701050101.23916-1-gwenj@trabucayre.com>
Message-ID: <20210701050101.23916-2-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

comment message for gqrx is always displayed. This is due to an invert
dependency: GQRX depends on !BR2_STATIC_LIBS so comment must depends on
BR2_STATIC_LIBS

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gqrx/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gqrx/Config.in b/package/gqrx/Config.in
index af4d69381e..60942c36c8 100644
--- a/package/gqrx/Config.in
+++ b/package/gqrx/Config.in
@@ -3,7 +3,7 @@ comment "gqrx needs a toolchain w/ C++, threads, wchar, dynamic library"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_USE_WCHAR || !BR2_STATIC_LIBS
+		!BR2_USE_WCHAR || BR2_STATIC_LIBS
 
 comment "gqrx needs qt5"
 	depends on !BR2_PACKAGE_QT5
-- 
2.20.1
