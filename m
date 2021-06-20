From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 20 Jun 2021 19:03:22 +0200
Subject: [Buildroot] [git commit] package/gcc: switch to gcc 10.x as the
 default
Message-ID: <20210621055325.675228DED5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eacf7a1d0b952d8df8829b6bad9b08cd94e8bf0f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even if gcc 9.x is still maintained for some time (gcc 9.5 will be the
last), switch to gcc 10.x since it has been released since 2020-05-07
and gcc 11.x is available since 2021-04-27.

We have been having toolchains in the autobuilders with gcc 10.x since
mid-January 2021, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index f9c3cf5493..2b3c296463 100644
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
 
