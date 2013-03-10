From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 10 Mar 2013 06:27:02 -0300
Subject: [Buildroot] [PATCH] quota: select BR2_PACKAGE_UTIL_LINUX_BINARIES
Message-ID: <1362907622-27511-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Missed this one package that needs a util-linux binary, fixes:
http://autobuild.buildroot.net/results/bc3c75e7c60fe6db54ea56dd7c398ba7878bff83/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/quota/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/quota/Config.in b/package/quota/Config.in
index f6341d3..9f1704b 100644
--- a/package/quota/Config.in
+++ b/package/quota/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_QUOTA
 	depends on BR2_USE_WCHAR
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES
 	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
-- 
1.8.1.5
