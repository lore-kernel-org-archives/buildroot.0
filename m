From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Aug 2020 23:04:06 +0200
Subject: [Buildroot] [git commit] package/python-gunicorn: select
 python-setuptools
Message-ID: <20200813205754.2D3E785F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f242f9bad97be17e8ffb01d0aef7b88696ad6cc9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=13111

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
