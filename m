From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:20:37 +0100
Subject: [Buildroot] [git commit] utils/genrandconfig: test configurations
 with BR2_SSP_ALL
Message-ID: <20191027191741.669AC8A4FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22d37003c796daff98e63be61144814f8221df87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 66f1ce6547..4308261932 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -370,6 +370,8 @@ def gen_config(args):
         configlines.append("BR2_PIC_PIE=y\n")
     if randint(0, 4) == 0:
         configlines.append("BR2_RELRO_FULL=y\n")
+    if randint(0, 4) == 0:
+        configlines.append("BR2_SSP_ALL=y\n")
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
     # also enable tar filesystem images for testing
