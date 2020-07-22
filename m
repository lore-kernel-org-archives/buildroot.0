From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 13:38:51 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] Config.in: update
 BR2_OPTIMIZE_FAST prompt and help text
Message-ID: <20200722114333.20EC087B52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b947b730902e5c476fd2849f60c38b0796d6d9ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Update label as suggested by St??phane Veyret, as -Ofast is potentially
dangerous, and may break packages.

Fixes:

 - https://bugs.buildroot.org/show_bug.cgi?id=13046

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3e186cee008f94f6a33adeac329b13087ab11ddb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 48fd36ff98..e2c1d26148 100644
--- a/Config.in
+++ b/Config.in
@@ -516,13 +516,14 @@ config BR2_OPTIMIZE_S
 	  This is the default.
 
 config BR2_OPTIMIZE_FAST
-	bool "optimize for fast"
+	bool "optimize for fast (may break packages!)"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_6
 	help
 	  Optimize for fast. Disregard strict standards
 	  compliance. -Ofast enables all -O3 optimizations. It also
 	  enables optimizations that are not valid for all
-	  standard-compliant programs. It turns on -ffast-math and the
+	  standard-compliant programs, so be careful, as it may break
+	  some packages. It turns on -ffast-math and the
 	  Fortran-specific -fstack-arrays, unless -fmax-stack-var-size
 	  is specified, and -fno-protect-parens.
 
