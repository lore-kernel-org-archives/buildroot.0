From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Feb 2018 14:32:01 +0100
Subject: [Buildroot] [PATCH 2/2] python-watchdog: add missing runtime
 dependency
In-Reply-To: <1518787921-32089-1-git-send-email-yegorslists@googlemail.com>
References: <1518787921-32089-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1518787921-32089-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Script watchmedo requires python-setuptools.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-watchdog/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/python-watchdog/Config.in b/package/python-watchdog/Config.in
index e529089..18f569e 100644
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
 
-- 
2.1.4
