From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Oct 2020 21:27:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/makedumpfile: add threads
 dependency in comment
Message-ID: <20201003192706.176697-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit adb64a97e79bcb4e28450dd858654003ec8706c3 forgot to add threads
dependency in comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/makedumpfile/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/makedumpfile/Config.in b/package/makedumpfile/Config.in
index e41c4641a2..d5af38b598 100644
--- a/package/makedumpfile/Config.in
+++ b/package/makedumpfile/Config.in
@@ -7,9 +7,10 @@ config BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	default y if BR2_s390x
 	default y if BR2_sparc64
 
-comment "makedumpfile needs a uClibc or glibc toolchain w/ wchar, dynamic library"
+comment "makedumpfile needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads"
 	depends on BR2_PACKAGE_MAKEDUMPFILE_ARCH_SUPPORTS
 	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS \
+		|| !BR2_TOOLCHAIN_HAS_THREADS \
 		|| !(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC)
 
 config BR2_PACKAGE_MAKEDUMPFILE
-- 
2.28.0
