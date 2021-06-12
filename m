From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 12 Jun 2021 11:40:15 +0200
Subject: [Buildroot] [PATCH 6/6] package/gcc: switch to gcc 10.x as the
 default
In-Reply-To: <20210612094015.6792-1-romain.naour@gmail.com>
References: <20210612094015.6792-1-romain.naour@gmail.com>
Message-ID: <20210612094015.6792-6-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even if gcc 9.x is still maintained for some time (gcc 9.5 will be the last),
switch to gcc 10.x since it has been released since 2020-05-07 and
gcc 11.x is available since 2021-04-27.

We have been having toolchains in the autobuilders with gcc
10.x for a while, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 5d66834301..40559e3253 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_CSKY if BR2_csky
-	default BR2_GCC_VERSION_9_X
+	default BR2_GCC_VERSION_10_X
 	help
 	  Select the version of gcc you wish to use.
 
-- 
2.31.1
