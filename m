From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:15:25 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/openblas: fix
 jaguar openblas target
Message-ID: <20190902151121.B81498A2D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d50674a7ce567171934ace94aa678f2ce9932264
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

In commit [1] Peter said he will use BOBCAT for
jaguar cpus. But JAGUAR was used instead.

Use BOBCAT as openblas target for JAGUAR cpus since
it is not listed in openblas's target list [2].

[1] 5e6fa93483caac317ab8844feb2ae9c07078a6c8
[2] https://github.com/xianyi/OpenBLAS/blob/release-0.3.0/TargetList.txt

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ac9c865a10f47fcc311f2badb1abe9cf279def57)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openblas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 04538c2d7a..3f658c862a 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "OPTERON"      if BR2_x86_opteron
 	default "OPTERON_SSE3" if BR2_x86_opteron_sse3
 	default "BARCELONA"    if BR2_x86_barcelona
-	default "JAGUAR"       if BR2_x86_jaguar
+	default "BOBCAT"       if BR2_x86_jaguar
 	default "STEAMROLLER"  if BR2_x86_steamroller
 	default "VIAC3"        if BR2_x86_c3 || BR2_x86_c32
 	default "POWER4"       if BR2_powerpc_power4
