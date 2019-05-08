From: Romain Naour <romain.naour@gmail.com>
Date: Wed,  8 May 2019 17:07:13 +0200
Subject: [Buildroot] [PATCH v2 08/15] package/gcc: switch to gcc 8.x as the
 default
In-Reply-To: <20190508150720.27946-1-romain.naour@gmail.com>
References: <20190508150720.27946-1-romain.naour@gmail.com>
Message-ID: <20190508150720.27946-9-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even if gcc 7 is still maintained for some time (gcc 7.5 is pending),
switch to gcc 8.x since it has been released since 2018-05-02 and
gcc 9.x is available since 2019-05-03.

We have been having toolchains in the autobuilders with gcc
8.x for a while, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a9f8492399..1d3af73e69 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,7 +4,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_OR1K if BR2_or1k
-	default BR2_GCC_VERSION_7_X
+	default BR2_GCC_VERSION_8_X
 	help
 	  Select the version of gcc you wish to use.
 
-- 
2.14.5
