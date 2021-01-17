From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jan 2021 11:06:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/resiprocate: resiprocate-apps need
 openssl
Message-ID: <20210117100612.1210505-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/7ac/7ac82a3ac4b06cb5ad44e92548d66a0f79d149a6/

In file included from Server.cxx:19:
../../resip/stack/ssl/Security.hxx:32:10: fatal error: openssl/ssl.h: No such file or directory

clicktoall needs openssl:
https://github.com/resiprocate/resiprocate/blob/resiprocate-1.12/apps/clicktocall/Makefile.am#L16

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/resiprocate/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/resiprocate/Config.in b/package/resiprocate/Config.in
index ed57e09c1b..509c11ffda 100644
--- a/package/resiprocate/Config.in
+++ b/package/resiprocate/Config.in
@@ -41,6 +41,7 @@ config BR2_PACKAGE_RESIPROCATE_REND
 
 config BR2_PACKAGE_RESIPROCATE_APPS
 	bool "resiprocate-apps"
+	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_PCRE
 	help
 	  Build apps clicktocall and sipdial
-- 
2.29.2
