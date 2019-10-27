From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:20:41 +0100
Subject: [Buildroot] [git commit] utils/genrandconfig: test full set of
 hardening options
Message-ID: <20191027191741.6F7968A4FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=17eb6ae92a06e0389b439c499bb962e673bf5724
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the remaining ssp and relro cases plus both of the
fortify options. The randomization was left consistant between the
options but the order of the conditions placed the most restrictive
hardening options with more priority.

Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 4308261932..aaba6c4204 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -370,8 +370,18 @@ def gen_config(args):
         configlines.append("BR2_PIC_PIE=y\n")
     if randint(0, 4) == 0:
         configlines.append("BR2_RELRO_FULL=y\n")
+    elif randint(0, 4) == 0:
+        configlines.append("BR2_RELRO_PARTIAL=y\n")
     if randint(0, 4) == 0:
         configlines.append("BR2_SSP_ALL=y\n")
+    elif randint(0, 4) == 0:
+        configlines.append("BR2_SSP_REGULAR=y\n")
+    elif randint(0, 4) == 0:
+        configlines.append("BR2_SSP_STRONG=y\n")
+    if randint(0, 4) == 0:
+        configlines.append("BR2_FORTIFY_SOURCE_2=y\n")
+    elif randint(0, 4) == 0:
+        configlines.append("BR2_FORTIFY_SOURCE_1=y\n")
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
     # also enable tar filesystem images for testing
