From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 8 May 2019 22:12:37 +0200
Subject: [Buildroot] [git commit] package/libsigrok: fix comment display
Message-ID: <20190508200824.5A9CD84014@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a62f9803ada590bdcf4c046b058ad0c9b8f75b37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 922b82bde9d554237769c21e50f6c5b4f73f41a8 added a dependency to
locale and updated comment text but forgot to add the !BR2_ENABLE_LOCALE
dependency to comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigrok/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libsigrok/Config.in b/package/libsigrok/Config.in
index bb76e09d2d..a4b9f66566 100644
--- a/package/libsigrok/Config.in
+++ b/package/libsigrok/Config.in
@@ -39,4 +39,5 @@ endif
 comment "libsigrok needs a toolchain w/ wchar, locale, threads, dynamic library, gcc >= 4.7"
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || BR2_STATIC_LIBS
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || BR2_STATIC_LIBS \
+		|| !BR2_ENABLE_LOCALE
