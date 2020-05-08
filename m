From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 May 2020 09:26:06 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/openjdk: Remove
 sparc support
Message-ID: <20200508080227.789D090FE3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e00fb250616937d92d1735c398c14e301c462107
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Sparc support is deprecated and may be removed in future releases. There are
two choices to fix this issue:

1) Set --enable-deprecated-ports=yes in the CONF_OPTS to supress the error.
2) Remove support for Sparc.

Because this port is deprecated, it's safer to remove support alltogether.

Fixes:
    http://autobuild.buildroot.net/results/692820b4b6d4da42cd557fa7badbbd11806bbeba/

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6ee7de3d2f0a9c33622008a10b65db019e2cfa3d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openjdk/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 61294ec49f..df769bbb35 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -11,7 +11,6 @@ config BR2_PACKAGE_OPENJDK_ARCH_SUPPORTS
 	default y if BR2_m68k
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	default y if BR2_sh
-	default y if BR2_sparc || BR2_sparc64
 
 config BR2_PACKAGE_OPENJDK
 	bool "openjdk"
