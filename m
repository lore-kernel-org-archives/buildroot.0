From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 14:21:06 +0200
Subject: [Buildroot] [PATCH] utils/genrandconfig: test configurations with
 BR2_SYSTEM_ENABLE_NLS
Message-ID: <20190331122106.4090-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a2190d6d25..6cb1bed214 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -360,6 +360,8 @@ def gen_config(args):
         configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
     if randint(0, 5) == 0:
         configlines.append("BR2_OPTIMIZE_2=y\n")
+    if randint(0, 4) == 0:
+        configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
 
     # Write out the configuration file
     if not os.path.exists(args.outputdir):
-- 
2.20.1
