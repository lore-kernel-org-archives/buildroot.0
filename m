From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 May 2016 15:22:05 +0200
Subject: [Buildroot] [git commit] python-coherence: fix twisted detection
Message-ID: <20160511132215.2E4A081744@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a9407a5fceefa26fa34fe6ea0558805babfd3f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Apply upstream patch, that provides proper twisted detection.

Fixes:
http://autobuild.buildroot.net/results/d09/d09a6604414ed79205d95b164e32dbd72268e05c
http://autobuild.buildroot.net/results/a97/a974f3f075fb22adde720856ec4c9d11d8151da7

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Fix-twisted-detection.patch               | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/python-coherence/0001-Fix-twisted-detection.patch b/package/python-coherence/0001-Fix-twisted-detection.patch
new file mode 100644
index 0000000..c0e51b9
--- /dev/null
+++ b/package/python-coherence/0001-Fix-twisted-detection.patch
@@ -0,0 +1,29 @@
+From 3cf8d89cbb44b5c7a0693d0b5d665e68acc3927c Mon Sep 17 00:00:00 2001
+From: Thomas Klausner <wiz@NetBSD.org>
+Date: Tue, 10 May 2016 00:14:33 +0200
+Subject: [PATCH] Fix twisted detection.
+
+Addresses https://github.com/coherence-project/Coherence/issues/25
+
+Signed-off-by: Thomas Klausner <wiz@NetBSD.org>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ coherence/__init__.py | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/coherence/__init__.py b/coherence/__init__.py
+index 2e4e8f1..4c4d73d 100644
+--- a/coherence/__init__.py
++++ b/coherence/__init__.py
+@@ -24,8 +24,6 @@ try:
+     if twisted_version < Version("twisted", 2, 5, 0):
+         raise ImportError("Twisted >= 2.5 is required. Please install it.")
+ 
+-    if twisted_web_version < Version("twisted.web", 2, 5, 0):
+-        raise ImportError("Twisted.Web >= 2.5 is required. Please install it")
+ except ImportError, exc:
+     # log error to stderr, might be useful for debugging purpose
+     for arg in exc.args:
+-- 
+2.8.1
+
