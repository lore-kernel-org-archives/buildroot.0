From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Aug 2015 15:03:34 +0200
Subject: [Buildroot] [git commit] python-can: remove incorrect dependency
Message-ID: <20150828130517.DD39881F17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4c19d83ed5a8c2f1163e9ad84a74f3a75d3a5ba9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When using the python-package infrastructure, there is no need for
packages to declare a dependency on the Python interpreter: the
package infrastructure does it automatically.

Moreover, this is actually broken in the case of python-can, which can
be selected either with Python 2.x or Python 3.x. If the latter is
chosen, python-can will still trigger the build of Python 2.x, which
is incorrect.

This was discovered by Vicente Olivert Riera during the analysis of
the following build failure:

  http://autobuild.buildroot.net/results/aff/affb1d4a328c479be73b7818364db5914bf3d376/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-can/python-can.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/python-can/python-can.mk b/package/python-can/python-can.mk
index 8db5732..53d5e0f 100644
--- a/package/python-can/python-can.mk
+++ b/package/python-can/python-can.mk
@@ -9,7 +9,6 @@ PYTHON_CAN_SITE = https://bitbucket.org/hardbyte/python-can/get/
 PYTHON_CAN_SOURCE = $(PYTHON_CAN_VERSION).tar.bz2
 PYTHON_CAN_LICENSE = LGPLv3
 PYTHON_CAN_LICENSE_FILES = LICENSE.txt
-PYTHON_CAN_DEPENDENCIES = python
 PYTHON_CAN_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
