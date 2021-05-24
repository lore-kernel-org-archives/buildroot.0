From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 May 2021 15:29:26 +0200
Subject: [Buildroot] [git commit] utils/genrandconfig: drop hardening Config
 enables
Message-ID: <20210524130055.5E5D58130B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e55bc8a4dc31c6c848631d1034a6dbbe140492b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since 810ba387bec3c5b, some form of these options are enable
by default. Specifically:

- Kept FORTIFY level 2 option as the default is now level 1.
- Removed all SSP options as the default now uses the best
  option based on toolchain support.
- Similar to SSP, for RELRO, the default now uses the best
  option based on toolchain support.
- Completely drop PIC PIE as it defaults =y

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/genrandconfig | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 93dc6d898b..e1655655fa 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -371,22 +371,8 @@ def gen_config(args):
         configlines.append("BR2_OPTIMIZE_2=y\n")
     if randint(0, 4) == 0:
         configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
-    if randint(0, 4) == 0:
-        configlines.append("BR2_PIC_PIE=y\n")
-    if randint(0, 4) == 0:
-        configlines.append("BR2_RELRO_FULL=y\n")
-    elif randint(0, 4) == 0:
-        configlines.append("BR2_RELRO_PARTIAL=y\n")
-    if randint(0, 4) == 0:
-        configlines.append("BR2_SSP_ALL=y\n")
-    elif randint(0, 4) == 0:
-        configlines.append("BR2_SSP_REGULAR=y\n")
-    elif randint(0, 4) == 0:
-        configlines.append("BR2_SSP_STRONG=y\n")
     if randint(0, 4) == 0:
         configlines.append("BR2_FORTIFY_SOURCE_2=y\n")
-    elif randint(0, 4) == 0:
-        configlines.append("BR2_FORTIFY_SOURCE_1=y\n")
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
     # also enable tar filesystem images for testing
