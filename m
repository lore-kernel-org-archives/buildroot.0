From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 22:25:42 +0100
Subject: [Buildroot] [git commit] utils/genrandconfig: fix flake8 warnings
Message-ID: <20181203212232.215088A59F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e6a10b0284d746809330e2011df83e72491a45fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

utils/genrandconfig:369:17: E231 missing whitespace after ','
utils/genrandconfig:370:1: E101 indentation contains mixed spaces and tabs
utils/genrandconfig:370:1: W191 indentation contains tabs
utils/genrandconfig:372:1: E101 indentation contains mixed spaces and tabs

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 35c7cbd14c..047740a411 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -366,8 +366,8 @@ def gen_config(args):
         configlines.append("BR2_STATIC_LIBS=y\n")
     if randint(0, 20) == 0:
         configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
-    if randint(0,5) == 0:
-	configlines.append("BR2_OPTIMIZE_2=y\n")
+    if randint(0, 5) == 0:
+        configlines.append("BR2_OPTIMIZE_2=y\n")
 
     # Write out the configuration file
     if not os.path.exists(args.outputdir):
