From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:20:24 +0100
Subject: [Buildroot] [git commit] utils/genrandconfig: test configurations
 with BR2_RELRO_FULL
Message-ID: <20191027191741.5B88F8A4FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d36da5a5f551bc26ec7162dece6061cd78dd3266
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 9567739252..66f1ce6547 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -368,6 +368,8 @@ def gen_config(args):
         configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
     if randint(0, 4) == 0:
         configlines.append("BR2_PIC_PIE=y\n")
+    if randint(0, 4) == 0:
+        configlines.append("BR2_RELRO_FULL=y\n")
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
     # also enable tar filesystem images for testing
