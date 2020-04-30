From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2020 14:07:23 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/jpeg: properly
 indent in menuconfig
Message-ID: <20200430124925.3D51D8FBA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6b66c1f096605dcbf05afee394e519f62b41c79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Since there is a variable definition between the definition of
BR2_PACKAGE_JPEG and the choice depending on it, the choice is
not indented bewlo the "jpeg support" prompt, like we like to
have:

    [*] jpeg support
        jpeg variant (jpeg-turbo)  --->

Move the BR2_PACKAGE_JPEG right before the choice (really, move
BR2_PACKAGE_JPEG_SIMD_SUPPORT before BR2_PACKAGE_JPEG, but diff
finds the move of BR2_PACKAGE_JPEG is smaller to display):

    [*] jpeg support
          jpeg variant (jpeg-turbo)  --->

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7a48ac725f1829660641c348c062159d07519b45)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jpeg/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/jpeg/Config.in b/package/jpeg/Config.in
index 3d0fea83b1..97139c7849 100644
--- a/package/jpeg/Config.in
+++ b/package/jpeg/Config.in
@@ -1,8 +1,3 @@
-config BR2_PACKAGE_JPEG
-	bool "jpeg support"
-	help
-	  Select the desired JPEG library provider.
-
 # jpeg-turbo has simd support for some architectures
 config BR2_PACKAGE_JPEG_SIMD_SUPPORT
 	bool
@@ -11,6 +6,11 @@ config BR2_PACKAGE_JPEG_SIMD_SUPPORT
 	default y if BR2_POWERPC_CPU_HAS_ALTIVEC
 	default y if BR2_aarch64 || BR2_aarch64_be
 
+config BR2_PACKAGE_JPEG
+	bool "jpeg support"
+	help
+	  Select the desired JPEG library provider.
+
 if BR2_PACKAGE_JPEG
 
 choice
