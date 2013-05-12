From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 12 May 2013 09:23:25 +0200
Subject: [Buildroot] [git commit] libnss/libnspr: unavailable comment should
	be OR and not AND
Message-ID: <20130512072420.47AB09A0F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13cdffe529684402dacd4c5438b5f46bba9cc170
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise the comment would only show up when both conditions are true
instead of any of them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libnspr/Config.in |    2 +-
 package/libnss/Config.in  |    2 +-
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
 
