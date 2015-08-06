From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 20:51:07 +0200
Subject: [Buildroot] [git commit] c-icap: fix incorrect dependency on
	BR2_PREFER_STATIC_LIB
Message-ID: <20150806185227.09CBA818A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7f616617846fd43a44c2543e03dc5fe4aeded75
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PREFER_STATIC_LIB has been changed/renamed quite some time ago to
BR2_STATIC_LIBS, but the c-icap submission was done before that, and
during the review/merge of the patch, this rename was forgotten.

This commit therefore fixes the c-icap dependency on BR2_STATIC_LIBS,
which should fix:

  http://autobuild.buildroot.net/results/cb623460de30dd7c4ef3275fe13220c1ca0642a5/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/c-icap/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-icap/Config.in b/package/c-icap/Config.in
index 8121a26..8f7963c 100644
--- a/package/c-icap/Config.in
+++ b/package/c-icap/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_C_ICAP
 	bool "c-icap"
-	depends on !BR2_PREFER_STATIC_LIB
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	help
@@ -15,4 +15,4 @@ config BR2_PACKAGE_C_ICAP
 
 comment "c-icap needs a toolchain w/ threads and dynamic library"
 	depends on BR2_USE_MMU
-	depends on BR2_PREFER_STATIC_LIB  || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
