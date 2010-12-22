From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 22 Dec 2010 22:26:57 +0100
Subject: [Buildroot] [git commit master 1/1] tslib: Enable raw module in
	ts.conf
Message-ID: <20101222213332.B9D288E252@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=250d2222baa74f5f5833a83716824f668fb7b958
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default there is no module activated in ts.conf. According to the
ts.conf previously attached in the tslib package dir (which was never
installed) the default module of choice was the raw module.

This patch enables the raw module in the ts.conf file in the tslib
source tree, which will be installed in the target.

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
Acked-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tslib/tslib-enable_raw_module.patch |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 package/tslib/tslib-enable_raw_module.patch

diff --git a/package/tslib/tslib-enable_raw_module.patch b/package/tslib/tslib-enable_raw_module.patch
new file mode 100644
index 0000000..cb89338
--- /dev/null
+++ b/package/tslib/tslib-enable_raw_module.patch
@@ -0,0 +1,14 @@
+Enable raw module by default
+
+Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
+
+diff -Naur tslib-e000d35a.orig/etc/ts.conf tslib-e000d35a/etc/ts.conf
+--- tslib-e000d35a.orig/etc/ts.conf	2010-12-21 18:54:45.000000000 +0100
++++ tslib-e000d35a/etc/ts.conf	2010-12-21 18:55:03.000000000 +0100
+@@ -1,5 +1,5 @@
+ # Uncomment if you wish to use the linux input layer event interface
+-# module_raw input
++module_raw input
+ 
+ # Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
+ # module_raw collie
-- 
1.7.2.2
