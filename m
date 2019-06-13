From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Jun 2019 21:11:32 +0200
Subject: [Buildroot] [git commit] package/openblas: Handle new westmere
 target architecture
Message-ID: <20190613191301.7A69C826DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b04f1deab3ddf57db63490cdc5532fc7d448483e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Nehalem, the predecessor to westmere, is best match for westmere
architecture in current openblas.

Signed-off-by: Esben Haabendal <esben@geanix.com>
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
