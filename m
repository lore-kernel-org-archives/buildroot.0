From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Mar 2019 21:28:51 +0100
Subject: [Buildroot] [PATCH 5/8] package/rpm: fix threads comment
In-Reply-To: <20190328202854.26337-1-fontaine.fabrice@gmail.com>
References: <20190328202854.26337-1-fontaine.fabrice@gmail.com>
Message-ID: <20190328202854.26337-5-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

rpm depends on pthreads because it uses it, not because of beecrypt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rpm/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index aa857ef2be..58451a9fcc 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_RPM
 	bool "rpm"
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	depends on BR2_TOOLCHAIN_HAS_THREADS # beecrypt
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_BEECRYPT if !BR2_PACKAGE_LIBNSS
 	select BR2_PACKAGE_BERKELEYDB
-- 
2.20.1
