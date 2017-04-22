From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 22 Apr 2017 13:18:08 -0400
Subject: [Buildroot] [PATCH v2 22/25] fix ordering on configs starting with
	'v'
In-Reply-To: <20170422171811.1346-1-Adamduskett@outlook.com>
References: <20170422171811.1346-1-Adamduskett@outlook.com>
Message-ID: <20170422171811.1346-22-Adamduskett@outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter v in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
---
v1 -> v2:
  - Broke package up into just packages starting with the letter v.
  
 package/vtun/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/vtun/Config.in b/package/vtun/Config.in
index c1f6d38..bb8919c 100644
--- a/package/vtun/Config.in
+++ b/package/vtun/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_VTUN
 	bool "vtun"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LZO
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_USE_MMU # fork()
 	help
 	  Tool for easily creating Virtual Tunnels over TCP/IP networks
 	  with traffic shaping, compression, and encryption.
-- 
2.9.3
