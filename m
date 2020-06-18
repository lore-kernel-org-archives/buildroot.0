From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Jun 2020 23:29:37 +0200
Subject: [Buildroot] [git commit] package/python-web2py: python-pydal is
 only a runtime dependency
Message-ID: <20200618212927.0F8E282655@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad15cb19e58e5bd9c40a719c371eeb6e9b6444e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While host-python-pydal is needed at build time, the target variant of
this package is only needed at runtime.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-web2py/Config.in        | 2 +-
 package/python-web2py/python-web2py.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-web2py/Config.in b/package/python-web2py/Config.in
index bc2e6054e6..b0320574de 100644
--- a/package/python-web2py/Config.in
+++ b/package/python-web2py/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEB2PY
 	bool "python-web2py"
-	select BR2_PACKAGE_PYTHON_PYDAL
+	select BR2_PACKAGE_PYTHON_PYDAL # runtime
 	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
 	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
diff --git a/package/python-web2py/python-web2py.mk b/package/python-web2py/python-web2py.mk
index 9aebf4d19d..3372296bfd 100644
--- a/package/python-web2py/python-web2py.mk
+++ b/package/python-web2py/python-web2py.mk
@@ -9,7 +9,7 @@ PYTHON_WEB2PY_SITE = $(call github,web2py,web2py,v$(PYTHON_WEB2PY_VERSION))
 PYTHON_WEB2PY_LICENSE = LGPL-3.0
 PYTHON_WEB2PY_LICENSE_FILES = LICENSE
 PYTHON_WEB2PY_DEPENDENCIES = $(if $(BR2_PACKAGE_PYTHON3),host-python3 python3,host-python python) \
-	python-pydal host-python-pydal
+	host-python-pydal
 
 PYTHON_WEB2PY_EXCLUSIONS = \
 	welcome.w2p \
