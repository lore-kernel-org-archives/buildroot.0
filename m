From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 15:02:57 +0200
Subject: [Buildroot] [git commit] utils/genrandconfig: test configurations
 with BR2_PIC_PIE
Message-ID: <20191026125713.BF05C8838F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f24bb4ee4f744c1cf209bac9da710dffd69f7052
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index d6b7fd56b7..54d66e40d7 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -366,6 +366,8 @@ def gen_config(args):
         configlines.append("BR2_OPTIMIZE_2=y\n")
     if randint(0, 4) == 0:
         configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
+    if randInt(0, 4) == 0:
+        configlines.append("BR2_PIC_PIE=y\n")
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
     # also enable tar filesystem images for testing
