From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 May 2019 22:03:45 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/haproxy: enable on microblaze
 with gcc >= 8
Message-ID: <20190514200345.23182-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/haproxy/Config.in b/package/haproxy/Config.in
index 670de5a3ee..17bbe911fd 100644
--- a/package/haproxy/Config.in
+++ b/package/haproxy/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_HAPROXY_ARCH_SUPPORTS
 	bool
 	default y
 	# internal compiler error: in do_output_reload, at reload1.c:7978
-	depends on !BR2_microblaze
+	depends on !BR2_microblaze || BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	# src/proto_http.c:6330:1: internal compiler error: Segmentation fault
 	depends on !BR2_nios2
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60040
-- 
2.20.1
