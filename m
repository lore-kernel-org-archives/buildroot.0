From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:37:51 +0200
Subject: [Buildroot] [git commit] package/python-protobuf: remove wheel
 dependency
Message-ID: <20200920132833.259608A60B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ed815305677a6d942d3a5290c5c2d488424a0f28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove unneeded wheel dependency which has been added in version 3.13.0

Fixes:
 - http://autobuild.buildroot.org/results/371c686a10d6870933011b46d36b1879d29046b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...setup.py-remove-unneeded-wheel-dependency.patch | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/python-protobuf/0001-python-setup.py-remove-unneeded-wheel-dependency.patch b/package/python-protobuf/0001-python-setup.py-remove-unneeded-wheel-dependency.patch
new file mode 100644
index 0000000000..1646f0808c
--- /dev/null
+++ b/package/python-protobuf/0001-python-setup.py-remove-unneeded-wheel-dependency.patch
@@ -0,0 +1,41 @@
+From 9f8a6ed7fda9abf474ce886dddf3ab5abc0ead0b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 20 Sep 2020 10:52:32 +0200
+Subject: [PATCH] python/setup.py: remove unneeded wheel dependency
+
+wheel is required since version 3.13.0 and
+https://github.com/protocolbuffers/protobuf/commit/ff92cee10bcae7533b573368f448e782fbd43f39
+
+This will result in the following build failure when cross-compiling:
+
+Download error on https://pypi.org/simple/wheel/: unknown url type: https -- Some packages may not be found!
+Couldn't find index page for 'wheel' (maybe misspelled?)
+Download error on https://pypi.org/simple/: unknown url type: https -- Some packages may not be found!
+No local packages or working download links found for wheel
+
+Remove wheel requirement from setup.py as it is only needed by
+release.sh, not by setup.py
+
+Fixes:
+ - http://autobuild.buildroot.org/results/371c686a10d6870933011b46d36b1879d29046b9
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ python/setup.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/python/setup.py b/python/setup.py
+index b44e88b2f..39eb18d4b 100755
+--- a/python/setup.py
++++ b/python/setup.py
+@@ -293,7 +293,6 @@ if __name__ == '__main__':
+           'build_py': build_py,
+           'test_conformance': test_conformance,
+       },
+-      setup_requires = ['wheel'],
+       install_requires=install_requires,
+       ext_modules=ext_module_list,
+   )
+-- 
+2.28.0
+
