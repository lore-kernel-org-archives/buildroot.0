From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Aug 2010 15:36:30 +0200
Subject: [Buildroot] [git commit master 1/1] packages/atk: fix Makefile
Message-ID: <20100830133726.EAC158A332@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4973632207fd496199298191ada01c8c8ec2bee7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: "James J. Dines" <jdines@jdines.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    6 ++++++
 Config.in          |    2 +-
 package/atk/atk.mk |    2 +-
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 152ffa5..d9607c2 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,9 @@
+2010.08: Not yet released:
+
+	Fixes all over the tree.
+
+	Updated/fixed packages: atk
+
 2010.08-rc2, Released August 30th, 2010:
 
 	Fixes all over the tree.
diff --git a/Config.in b/Config.in
index d541358..7d32a2f 100644
--- a/Config.in
+++ b/Config.in
@@ -8,7 +8,7 @@ config BR2_HAVE_DOT_CONFIG
 
 config BR2_VERSION
 	string
-	default "2010.08-rc2"
+	default "2010.08-rc2-git"
 
 source "target/Config.in.arch"
 source "target/device/Config.in"
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index 6f3a3b6..71937a9 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -41,7 +41,7 @@ ATK_CONF_ENV = ac_cv_func_posix_getpwuid_r=yes \
 		gl_cv_c_restrict=no ac_cv_prog_F77=no
 
 ATK_CONF_OPT =  --enable-shared \
-		--enable-static
+		--enable-static \
 		--disable-glibtest --enable-explicit-deps=no \
 		--disable-debug
 
-- 
1.7.1
