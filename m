From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Mon,  4 May 2020 11:42:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/pigz: fix zlib dependency on
 host-pigz
Message-ID: <20200504094236.1113-1-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
---
 package/pigz/Config.in      | 1 -
 package/pigz/Config.in.host | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pigz/Config.in b/package/pigz/Config.in
index a76146d8fc..af229060cf 100644
--- a/package/pigz/Config.in
+++ b/package/pigz/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PIGZ
 	bool "pigz"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_HOST_ZLIB
 	help
 	  pigz, which stands for parallel implementation of gzip, is a
 	  fully functional replacement for gzip that exploits multiple
diff --git a/package/pigz/Config.in.host b/package/pigz/Config.in.host
index 9903cada7d..3e3e5ac656 100644
--- a/package/pigz/Config.in.host
+++ b/package/pigz/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_PIGZ
 	bool "host pigz"
+	select BR2_PACKAGE_HOST_ZLIB
 	help
 	  pigz, which stands for parallel implementation of gzip, is a
 	  fully functional replacement for gzip that exploits multiple
-- 
2.20.1
