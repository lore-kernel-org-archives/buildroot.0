From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Aug 2016 23:51:29 +0200
Subject: [Buildroot] [git commit] squeezelite: needs NPTL
Message-ID: <20160818215205.2313481D3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c1276aacd2b0c1dc52b02bacd4b4c7c50a4b26fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It uses PTHREAD_PRIO_INHERIT, which isn't available in Linuxthreads.

Fixes:
  http://autobuild.buildroot.net/results/455465c332d291929c1612d18a9e7448d9c76e73/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
[Thomas: drop comment about the NPTL dependency being related to
alsa-lib, as it's not the case. Suggested by Baruch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/squeezelite/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/squeezelite/Config.in b/package/squeezelite/Config.in
index 79d2947..63b9183 100644
--- a/package/squeezelite/Config.in
+++ b/package/squeezelite/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SQUEEZELITE
 	bool "squeezelite"
 	depends on BR2_USE_WCHAR # flac
-	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # mpg123
 	depends on !BR2_STATIC_LIBS # dlopen
 	select BR2_PACKAGE_ALSA_LIB
@@ -36,7 +36,7 @@ config BR2_PACKAGE_SQUEEZELITE_VISEXPORT
 
 endif
 
-comment "squeezelite needs a toolchain w/ wchar, threads, dynamic library"
+comment "squeezelite needs a toolchain w/ wchar, NPTL, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS \
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| BR2_STATIC_LIBS
