From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 May 2018 22:30:28 +0200
Subject: [Buildroot] [PATCH v2 for-next 4/4] package/gcc: switch to gcc 6.x
 as the default
In-Reply-To: <20180527203028.26146-1-romain.naour@gmail.com>
References: <20180527203028.26146-1-romain.naour@gmail.com>
Message-ID: <20180527203028.26146-4-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even if gcc 6 is still maintained for some time (gcc 6.5 is pending),
switch to gcc 7.x since it has been released since 2017-05-02 and
gcc 8.x is available since 2018-05-02.

We have been having toolchains in the autobuilders with gcc
7.x for a while, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 59a93595cc..982be26b38 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_OR1K if BR2_or1k
-	default BR2_GCC_VERSION_6_X
+	default BR2_GCC_VERSION_7_X
 	help
 	  Select the version of gcc you wish to use.
 
-- 
2.14.3
