From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2020 11:37:11 +0200
Subject: [Buildroot] [git commit] package/makedumpfile: add threads
 dependency in comment
Message-ID: <20201004094312.B40358125A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=049e4fc9d852eef1d947a3ed2e72d12bcd8f3b14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit adb64a97e79bcb4e28450dd858654003ec8706c3 forgot to add threads
dependency in comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
