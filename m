From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 9 Apr 2017 22:51:26 +0200
Subject: [Buildroot] [PATCH/autobuild 6/8] autobuild-run: remove check for
	glibc
In-Reply-To: <20170409205128.11560-1-arnout@mind.be>
References: <20170409205128.11560-1-arnout@mind.be>
Message-ID: <20170409205128.11560-6-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we check the validity of the toolchain config after running
'make olddefconfig', it is no longer necessary to have an explicit
check of glibc before enabling BR2_STATIC_LIBS.

This will be necessary to be able to use the in-tree toolchain configs.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 50808b6..2aa89b4 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -559,7 +559,7 @@ def gen_config(**kwargs):
         configlines.append("BR2_INIT_SYSTEMD=y\n")
     elif randint(0, 20) == 0:
         configlines.append("BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y\n")
-    if config["libc"] != "glibc" and randint(0, 20) == 0:
+    if randint(0, 20) == 0:
         configlines.append("BR2_STATIC_LIBS=y\n")
 
     # Write out the configuration file
-- 
2.11.0
