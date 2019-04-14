From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Apr 2019 11:26:58 +0200
Subject: [Buildroot] [git commit] utils/genrandconfig: test configurations
 with BR2_SYSTEM_ENABLE_NLS
Message-ID: <20190414092339.B3ACF8E5B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=472e8808d928af9787abd3303fb0b2b4d5916946
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
