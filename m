From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:18:11 -0400
Subject: [Buildroot] [PATCH v2 25/25] fix ordering on configs starting with
	'y'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-25-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter y in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter y.
  
 package/ympd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ympd/Config.in b/package/ympd/Config.in
index d0901c7..39b3a86 100644
--- a/package/ympd/Config.in
+++ b/package/ympd/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_YMPD
 	bool "ympd"
-	select BR2_PACKAGE_LIBMPDCLIENT
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBMPDCLIENT
 	help
 	  ympd, a standalone MPD Web GUI written in C, utilizing
 	  Websockets and Bootstrap/JS
-- 
2.9.3
