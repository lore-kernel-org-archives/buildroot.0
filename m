From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Dec 2013 21:42:27 +0100
Subject: [Buildroot] [git commit] gawk: add missing comment for toolchain
	option dependencies
Message-ID: <20131219204307.3698E9C0AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd72ecc0dbd7160df4cddfdd88d36ae1bbc14d77
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gawk/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index 31b97fa..d0213a7 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -10,6 +10,6 @@ config BR2_PACKAGE_GAWK
 
 	  http://www.gnu.org/software/gawk/
 
-comment "gawk needs a toolchain w/ wchar"
+comment "gawk needs a toolchain w/ wchar, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
+	depends on !BR2_USE_WCHAR || BR2_PREFER_STATIC_LIB
