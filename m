From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 23:01:36 +0100
Subject: [Buildroot] [git commit] package/python-pydal: bump to version
 v18.09
Message-ID: <20181202071601.746E6815BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cf1b1cc0d8b958eee7b4f582d95578e8f3c3e5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch bumps pydal to version v18.09 and moves its download location
to github cause the version on pypi is not updated anymore.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pydal/python-pydal.hash | 3 ++-
 package/python-pydal/python-pydal.mk   | 5 ++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 8e6fa90e6a..27f2e6c7a2 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,2 +1,3 @@
 # sha256 from https://pypi.org/project/pyDAL/#files
-sha256 59b28cbad92743c76134fc078b62f49d5c02b86c55cbdee527f75995d2681735  pyDAL-17.11.tar.gz
+sha256 763ed017f431fc3d9fa9243f6be2519ff49b8a260d15763c4733762d9c086904  python-pydal-v18.09.tar.gz
+sha256 ae7d7b6888bb72f26af2bcbee69ae6f8a49e12f66c99e78f2a8b806effc5219d  LICENSE
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 9de56bff61..4ff58def69 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 17.11
-PYTHON_PYDAL_SOURCE = pyDAL-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/d2/64/a119cb70ed91a6273aad811fd250b8a55d4bc8b0d900757723ec5a4f0ba9
+PYTHON_PYDAL_VERSION = v18.09
+PYTHON_PYDAL_SITE = $(call github,web2py,pydal,$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE
 PYTHON_PYDAL_SETUP_TYPE = setuptools
