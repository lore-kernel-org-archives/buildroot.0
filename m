From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 22:58:51 +0100
Subject: [Buildroot] [git commit] aoetools: fix aoe-stat script that was
 using /bin/bash in its shebang
Message-ID: <20180130215904.7D88D88107@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06407fdf31989e864de0fc851a67129bb99bab81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will make the script more portable, making it possible to run on
systems that do not have bash.

The script was tested with ash from BusyBox and checked for portability
issues and bashisms with shellcheck and checkbashisms tools.

The patch was already applied upstream [1] and should be removed in the
next version bump.

[1] https://github.com/OpenAoE/aoetools/commit/4ef42740538cefd3c1554aa4df5bcb1388ac927b

Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...l-script-interpreter-from-bin-bash-to-bin.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/package/aoetools/0001-Change-shell-script-interpreter-from-bin-bash-to-bin.patch b/package/aoetools/0001-Change-shell-script-interpreter-from-bin-bash-to-bin.patch
new file mode 100644
index 0000000000..00b24c8943
--- /dev/null
+++ b/package/aoetools/0001-Change-shell-script-interpreter-from-bin-bash-to-bin.patch
@@ -0,0 +1,26 @@
+From 4ef42740538cefd3c1554aa4df5bcb1388ac927b Mon Sep 17 00:00:00 2001
+From: Sergio Prado <sergio.prado@e-labworks.com>
+Date: Tue, 16 Jan 2018 22:28:32 -0200
+Subject: [PATCH] Change shell script interpreter from /bin/bash to /bin/sh
+
+This will make the script more portable, making it possible to run on
+systems that do not have bash.
+
+Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+---
+ aoe-stat.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/aoe-stat.in b/aoe-stat.in
+index 50e6ac674169..0c1d6f5ebe1e 100755
+--- a/aoe-stat.in
++++ b/aoe-stat.in
+@@ -1,4 +1,4 @@
+-#! /bin/bash
++#! /bin/sh
+ # aoe-stat - collate and present information about AoE storage
+ # Copyright 2012, CORAID, Inc., and licensed under GPL v.2.
+ 
+-- 
+1.9.1
+
