From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Jun 2017 15:13:50 +0200
Subject: [Buildroot] [PATCH/buildroot-test 1/1] autobuild-run: randomly add
	BR2_PACKAGE_PYTHON_PY_ONLY
Message-ID: <20170605131350.31383-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This should allow build-testing Kodi after
https://git.buildroot.net/buildroot/commit/package/kodi?id=95bf21910899dd0bcd7df6ecdff13914f7aa99ef

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 scripts/autobuild-run | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 24cdf58..f0bb135 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -547,6 +547,8 @@ def gen_config(**kwargs):
         configlines.append("BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y\n")
     if randint(0, 20) == 0:
         configlines.append("BR2_STATIC_LIBS=y\n")
+    if randint(0, 20) == 0:
+        configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
 
     # Write out the configuration file
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
-- 
2.11.0
