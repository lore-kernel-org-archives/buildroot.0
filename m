From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 21:41:49 +0100
Subject: [Buildroot] [git commit] p11-kit: add missing comment for dynamic
	library support
Message-ID: <20131219204307.169EA9C0E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd6f2371a2ba4cf6b8cd5e353c30cf04cd6af191
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/p11-kit/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/p11-kit/Config.in b/package/p11-kit/Config.in
index 8d0cf38..c72006f 100644
--- a/package/p11-kit/Config.in
+++ b/package/p11-kit/Config.in
@@ -11,6 +11,6 @@ config BR2_PACKAGE_P11_KIT
 
 	  http://p11-glue.freedesktop.org/p11-kit.html
 
-comment "p11-kit needs a toolchain w/ threads"
+comment "p11-kit needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_PREFER_STATIC_LIB
