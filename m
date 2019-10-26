From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 16:25:31 +0200
Subject: [Buildroot] [git commit] utils/genrandconfig: use randint instead
 of (undefined) randInt
Message-ID: <20191026141908.E3E7A88545@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fc6bfb4b858300f001e0f740c79f8a4dbd8d6c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/333788455

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 54d66e40d7..9567739252 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -366,7 +366,7 @@ def gen_config(args):
         configlines.append("BR2_OPTIMIZE_2=y\n")
     if randint(0, 4) == 0:
         configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
-    if randInt(0, 4) == 0:
+    if randint(0, 4) == 0:
         configlines.append("BR2_PIC_PIE=y\n")
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
