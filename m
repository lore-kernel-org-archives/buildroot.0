From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 19:25:42 +0200
Subject: [Buildroot] [PATCH] gcc: switch to gcc 5.x as the default
Message-ID: <1474392342-22755-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc 4.9.4 was the last release of the 4.9.x branch, and the gcc
developes will now only be maintaining gcc 5.x and 6.x:

  https://gcc.gnu.org/ml/gcc-announce/2016/msg00002.html

Therefore, it is time to use gcc 5.x as the default version in
Buildroot. We have been having toolchains in the autobuilders with gcc
5.x for a while, so the vast majority of the problems should have
already been solved.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 134b16c..7484e7f 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -9,7 +9,7 @@ config BR2_GCC_SUPPORTS_GRAPHITE
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_8_ARC if BR2_arc
-	default BR2_GCC_VERSION_4_9_X
+	default BR2_GCC_VERSION_5_X
 	help
 	  Select the version of gcc you wish to use.
 
-- 
2.7.4
