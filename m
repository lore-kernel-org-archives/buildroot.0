From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 28 Apr 2018 23:34:45 +0200
Subject: [Buildroot] [git commit] python-watchdog: add missing runtime
 dependency
Message-ID: <20180428213749.67C8B890DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7a801da8eaa0f4c45d20519afd6d653c2ed76248
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Script watchmedo requires python-setuptools.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-watchdog/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-watchdog/Config.in b/package/python-watchdog/Config.in
index e5290897e8..18f569ee44 100644
--- a/package/python-watchdog/Config.in
+++ b/package/python-watchdog/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_PYTHON_WATCHDOG
 	bool "python-watchdog"
-	select BR2_PACKAGE_PYTHON_PYYAML
-	select BR2_PACKAGE_PYTHON_ARGH
-	select BR2_PACKAGE_PYTHON_PATHTOOLS
+	select BR2_PACKAGE_PYTHON_ARGH # runtime
+	select BR2_PACKAGE_PYTHON_PATHTOOLS # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	help
 	  Python API and shell utilities to monitor file system events.
 
