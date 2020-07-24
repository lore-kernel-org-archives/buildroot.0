From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Jul 2020 13:40:25 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/cdrkit: fix build
 with GCC 10
Message-ID: <20200724113603.6723B8845B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f21717f07222baaf07c7492e2c7a75fd94726ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

This patch adds a missing extern on the outfile
variable in genisoimage.h.

Signed-off-by: Urja Rannikko <urjaman@gmail.com>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7d50d04729361ab93423a68d0c930b695bf98c00)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...to-char-outfile-declaration-to-fix-build-.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch b/package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch
new file mode 100644
index 0000000000..30f4c8d01d
--- /dev/null
+++ b/package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch
@@ -0,0 +1,30 @@
+From eabcc8a6e39dc3c28faee3e04aa56cc65a38d65a Mon Sep 17 00:00:00 2001
+From: Urja Rannikko <urjaman@gmail.com>
+Date: Sun, 19 Jul 2020 20:28:27 +0300
+Subject: [PATCH] Add extern to char* outfile declaration to fix build with gcc
+ 10
+
+Without this linking fails with a rather long spew of
+"multiple definition of `outfile'".
+
+Signed-off-by: Urja Rannikko <urjaman@gmail.com>
+---
+ genisoimage/genisoimage.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/genisoimage/genisoimage.h b/genisoimage/genisoimage.h
+index bbedfb0..82c859b 100644
+--- a/genisoimage/genisoimage.h
++++ b/genisoimage/genisoimage.h
+@@ -376,7 +376,7 @@ extern int	use_fileversion;
+ extern int	split_SL_component;
+ extern int	split_SL_field;
+ extern char	*trans_tbl;
+-char		*outfile;
++extern char	*outfile;
+ 
+ #define	JMAX		64	/* maximum Joliet file name length (spec) */
+ #define	JLONGMAX	103	/* out of spec Joliet file name length */
+-- 
+2.27.0
+
