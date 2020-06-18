From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 23:30:09 +0200
Subject: [Buildroot] [git commit] package/python-web2py: needs python-yatl
Message-ID: <20200618212927.1DE2982655@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0e7ba0f3ec74a7ff8329dc6f2ffad4372c64b670
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-yatl is a mandatory dependency of python-web2py since version
2.18.4 and
https://github.com/web2py/web2py/commit/0663088d7f7c3257eaa9cdd8415483372d3c80b7

Fixes:
 - http://autobuild.buildroot.org/results/9d627152920973effeb48ad03c27a1c69fa83931

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-web2py/Config.in        | 1 +
 package/python-web2py/python-web2py.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
index b0320574de..a0452060ba 100644
--- a/package/python-web2py/Config.in
+++ b/package/python-web2py/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_WEB2PY
 	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON_SQLITE if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON_YATL # runtime
 	help
 	  web2py is a free open source full-stack framework for rapid
 	  development of fast, scalable, secure and portable
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 3372296bfd..07251ba53c 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -9,7 +9,7 @@ PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
 PYTHON_WEB2PY_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python) \
-	host-python-pydal
+	host-python-pydal host-python-yatl
 
 PYTHON_WEB2PY_EXCLUSIONS = \
 	welcome.w2p \
