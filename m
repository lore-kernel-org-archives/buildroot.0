From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 10 Jun 2016 09:59:23 +0200
Subject: [Buildroot] [PATCH] python-dataproperty: fix package build
Message-ID: <1465545563-20130-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

DataProperty's setup.py requires test environment. So just comment this
line as test environment is not required for normal installation

Fixes:
http://autobuild.buildroot.net/results/0c8/0c8e0ceccc2d5f48138ec4f95e57729e33108f59
http://autobuild.buildroot.net/results/eab/eab2d2bf78ac943156a0b8698e63bdf6e63865bf
http://autobuild.buildroot.net/results/4d6/4d60c711e9c1da6dd5bb809bbe328e6252d2d747
http://autobuild.buildroot.net/results/ed1/ed1982367fa1531d772d29b35e333b34e5889cec
http://autobuild.buildroot.net/results/a0e/a0ebb6b155fa11c5886080f993c9aa9d596ac1c3
http://autobuild.buildroot.net/results/85e/85e5086401a314a2d3d24efa887ac0188add85fc
http://autobuild.buildroot.net/results/99e/99ea243303ae12aceb2fac3a5df5e3b552712eda

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-dataproperty/python-dataproperty.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/python-dataproperty/python-dataproperty.mk b/package/python-dataproperty/python-dataproperty.mk
index 0bbe680..6d0c659 100644
--- a/package/python-dataproperty/python-dataproperty.mk
+++ b/package/python-dataproperty/python-dataproperty.mk
@@ -11,4 +11,11 @@ PYTHON_DATAPROPERTY_SETUP_TYPE = setuptools
 PYTHON_DATAPROPERTY_LICENSE = MIT
 PYTHON_DATAPROPERTY_LICENSE_FILES = LICENSE
 
+# DataProperty's setup.py requires test environment. So just comment this
+# line as it is not required for normal installation
+define PYTHON_DATAPROPERTY_COMMENT_SETUP_REQUIRES
+	$(SED) '/setup_requires/ s/^#*/#/' $(@D)/setup.py
+endef
+PYTHON_DATAPROPERTY_POST_EXTRACT_HOOKS = PYTHON_DATAPROPERTY_COMMENT_SETUP_REQUIRES
+
 $(eval $(python-package))
-- 
2.1.4
