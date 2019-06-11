From: Esben Haabendal <esben@geanix.com>
Date: Tue, 11 Jun 2019 10:44:10 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/openblas: Handle new westmere
 target architecture
In-Reply-To: <20190611084410.4422-1-esben@geanix.com>
References: <20190611084410.4422-1-esben@geanix.com>
Message-ID: <20190611084410.4422-2-esben@geanix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nehalem, the predecessor to westmere, is best match for westmere
architecture in current openblas.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 package/openblas/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openblas/Config.in b/package/openblas/Config.in
index 8e71a43f982c..c8a516bb9f93 100644
--- a/package/openblas/Config.in
+++ b/package/openblas/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_OPENBLAS_DEFAULT_TARGET
 	default "PRESCOTT"     if BR2_x86_prescott || BR2_x86_nocona
 	default "BANIAS"       if BR2_x86_pentium_m
 	default "CORE2"        if BR2_x86_core2
-	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_silvermont
+	default "NEHALEM"      if BR2_x86_corei7 || BR2_x86_westmere || BR2_x86_silvermont
 	default "SANDYBRIDGE"  if BR2_x86_corei7_avx
 	default "HASWELL"      if BR2_x86_core_avx2
 	default "ATOM"         if BR2_x86_atom
-- 
2.21.0
