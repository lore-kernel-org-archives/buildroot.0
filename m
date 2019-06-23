From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Jun 2019 23:09:01 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/openblas: Handle
 new westmere target architecture
Message-ID: <20190623210851.6F2FE867D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3a62cfb297693e4ee1e403c42d4a6b74e587e0cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Nehalem, the predecessor to westmere, is best match for westmere
architecture in current openblas.

Signed-off-by: Esben Haabendal <esben@geanix.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b04f1deab3ddf57db63490cdc5532fc7d448483e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openblas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 8e71a43f98..04538c2d7a 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "PRESCOTT"     if BR2_x86_prescott || BR2_x86_nocona
 	default "BANIAS"       if BR2_x86_pentium_m
 	default "CORE2"        if BR2_x86_core2
-	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_silvermont
+	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_silvermont || BR2_x86_westmere
 	default "SANDYBRIDGE"  if BR2_x86_corei7_avx
 	default "HASWELL"      if BR2_x86_core_avx2
 	default "ATOM"         if BR2_x86_atom
