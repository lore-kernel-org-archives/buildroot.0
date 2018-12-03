From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 22:06:12 +0100
Subject: [Buildroot] [git commit] utils/genrandconfig: test with
 BR2_OPTIMIZE_2=y
Message-ID: <20181203210405.863168A590@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aa556e2035c023d4328185a46e15df532e566067
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently all random defconfigs which are used in autobuilder use size
optimizaion (-Os), since BR2_OPTIMIZE_S=y is the default.

Adding "-O2" optimization will give better test coverage.

In many cases software gets built with speed optimization rather than
size optimization. So let's add Level 2 optimizaion option to be
generated in random defconfigs, so we could be able to test how
packages are built with "-O2" in autobuilder.

Signed-off-by: Evgeniy Didin <Evgeniy.Didin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: arc-buildroot at synopsys.com
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 1d6ff990f5..35c7cbd14c 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -366,6 +366,8 @@ def gen_config(args):
         configlines.append("BR2_STATIC_LIBS=y\n")
     if randint(0, 20) == 0:
         configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
+    if randint(0,5) == 0:
+	configlines.append("BR2_OPTIMIZE_2=y\n")
 
     # Write out the configuration file
     if not os.path.exists(args.outputdir):
