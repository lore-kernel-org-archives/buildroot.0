From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 16 Jan 2017 22:24:17 +0100
Subject: [Buildroot] [PATCH 2/2] package/git: remove optional dependency to
	libiconv
In-Reply-To: <20170116212417.30415-1-bernd.kuhls@t-online.de>
References: <20170116212417.30415-1-bernd.kuhls@t-online.de>
Message-ID: <20170116212417.30415-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested using this minimal defconfig:

BR2_PACKAGE_GIT=y

$ grep BR2_ENABLE_LOCALE= .config
$

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/git/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/git/Config.in b/package/git/Config.in
index 9babbecf0..1f90e1180 100644
--- a/package/git/Config.in
+++ b/package/git/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_GIT
 	bool "git"
 	depends on BR2_USE_MMU # uses fork()
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  Git is a free and open source distributed version control system
 	  designed to handle everything from small to very large projects.
-- 
2.11.0
