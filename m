From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Apr 2018 23:37:19 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] python-watchdog: add
 missing runtime dependency
Message-ID: <20180501073418.AFC668271A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c6f7fe46fc054318349c7721e19aa6cdce069798
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Script watchmedo requires python-setuptools.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 7a801da8eaa0f4c45d20519afd6d653c2ed76248)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
