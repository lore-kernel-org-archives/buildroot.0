From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 18:23:34 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/python-gunicorn:
 select python-setuptools
Message-ID: <20200828164650.053BF862C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3d5c530da5b1a7cd6df00c0b83eb9ab464dcf113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13111

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f242f9bad97be17e8ffb01d0aef7b88696ad6cc9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-gunicorn/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-gunicorn/Config.in b/package/python-gunicorn/Config.in
index 518157bf93..b3d11cf199 100644
--- a/package/python-gunicorn/Config.in
+++ b/package/python-gunicorn/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_GUNICORN
 	bool "python-gunicorn"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
 	help
