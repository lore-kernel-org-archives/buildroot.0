From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 18:58:54 +0200
Subject: [Buildroot] [git commit] package/supervisor: can now run on Python 3
Message-ID: <20191026165243.659A98869D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3267377c7086781926e6490633ff7f620b5fd22e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Supervisor introduced support for Python3 starting with version 4.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/supervisor/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
index 2ab0e048f6..623c3a836e 100644
--- a/package/supervisor/Config.in
+++ b/package/supervisor/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_SUPERVISOR
 	bool "supervisor"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_MELD3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime dependency
 	help
@@ -9,5 +9,6 @@ config BR2_PACKAGE_SUPERVISOR
 
 	  http://supervisord.org/
 
-comment "supervisor needs the python interpreter"
+comment "supervisor needs a python interpreter"
 	depends on !BR2_PACKAGE_PYTHON
+	depends on !BR2_PACKAGE_PYTHON3
