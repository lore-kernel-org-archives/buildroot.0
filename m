From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  8 Oct 2014 14:32:55 -0300
Subject: [Buildroot] [PATCH] ulogd: only for kernels <= 3.16.x
Message-ID: <1412789575-31614-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ulog netfilter target has been deprecated for some time and removed
in kernels >= 3.17.x so limit it to older headers. Fixes:
http://autobuild.buildroot.net/results/9ca/9ca43764c7363f9a00b8a0c7df20a492c00088b5/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ulogd/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ulogd/Config.in b/package/ulogd/Config.in
index 04acf0c..c792973 100644
--- a/package/ulogd/Config.in
+++ b/package/ulogd/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_ULOGD
 	depends on BR2_LARGEFILE
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_MMU
+	# ulog support removed for kernels >= 3.17
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
 	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_LIBNETFILTER_ACCT
 	select BR2_PACKAGE_LIBNETFILTER_CONNTRACK
@@ -17,3 +19,4 @@ config BR2_PACKAGE_ULOGD
 comment "ulogd needs a toolchain w/ IPv6, largefile, dynamic library"
 	depends on !BR2_INET_IPV6 || !BR2_LARGEFILE || BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17
-- 
2.0.4
