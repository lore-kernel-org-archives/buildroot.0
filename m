From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 8 Jun 2019 22:56:41 +0200
Subject: [Buildroot] [git commit] utils/genrandconfing: randomly enable
 BR2_REPRODUCIBLE 10% of the times
Message-ID: <20190608205629.19A128A37A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9355933afdb47e000080c7489b1d8a15cbba7e3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Initial patch to start reproducibility testing.

Also enable tar filesystem to compare images since diffoscope works well
with tar.

Signed-off-by: Atharva Lele <itsatharva@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/genrandconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 5f3fe23260..aa5e151b7f 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -366,6 +366,12 @@ def gen_config(args):
     if randint(0, 4) == 0:
         configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
 
+    # Randomly enable BR2_REPRODUCIBLE 10% of times
+    # also enable tar filesystem images for testing
+    if randint(0, 10) == 0:
+        configlines.append("BR2_REPRODUCIBLE=y\n")
+        configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
+
     # Write out the configuration file
     if not os.path.exists(args.outputdir):
         os.makedirs(args.outputdir)
