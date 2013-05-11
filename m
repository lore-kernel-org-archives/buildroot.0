From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 11 May 2013 20:09:35 -0300
Subject: [Buildroot] [PATCH] libnss/libnspr: unavailable comment should be
	OR and not AND
Message-ID: <1368313775-23313-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise the comment would only show up when both conditions are true
instead of any of them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnspr/Config.in | 2 +-
 package/libnss/Config.in  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnspr/Config.in b/package/libnspr/Config.in
index f4f24d4..f87b10c 100644
--- a/package/libnspr/Config.in
+++ b/package/libnspr/Config.in
@@ -11,4 +11,4 @@ config BR2_PACKAGE_LIBNSPR
 	  http://www.mozilla.org/projects/nspr/
 
 comment "libnspr requires a toolchain with LARGEFILE and threads support"
-	depends on !BR2_LARGEFILE && !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libnss/Config.in b/package/libnss/Config.in
index a070ffb..e8eec77 100644
--- a/package/libnss/Config.in
+++ b/package/libnss/Config.in
@@ -15,5 +15,5 @@ config BR2_PACKAGE_LIBNSS
 	  http://www.mozilla.org/projects/security/pki/nss/
 
 comment "libnss requires a toolchain with LARGEFILE and thread support"
-	depends on !BR2_LARGEFILE && !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
 
-- 
1.8.1.5
