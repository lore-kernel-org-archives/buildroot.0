From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Dec 2014 22:47:37 +0100
Subject: [Buildroot] [buildroot-test 1/2] Taking into account
	BR2_PREFER_STATIC_LIB rename
Message-ID: <1418852858-818-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In Buildroot, the BR2_PREFER_STATIC_LIB option was renamed to
BR2_STATIC_LIBS. This commit takes this into account when generating
the autobuild configurations.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 scripts/autobuild-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 4d9ef90..ce89e1e 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -348,7 +348,7 @@ def gen_config(instance, log, sysinfo):
     elif randint(0, 20) == 0:
         configlines.append("BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y\n")
     if config["libc"] != "glibc" and randint(0, 20) == 0:
-        configlines.append("BR2_PREFER_STATIC_LIB=y\n")
+        configlines.append("BR2_STATIC_LIBS=y\n")
 
     # Write out the configuration file
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
-- 
2.1.0
