From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 09:32:04 +0100
Subject: [Buildroot] [git commit branch/next] python-jaraco-classes: add
 missing dependency
Message-ID: <20171127082443.834B4811D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7500b615ff4b8d0669252acff61421763d6c4fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

python-jaraco-classes needs host-python-setuptools-scm.

Fixes:
http://autobuild.buildroot.net/results/3a7000002b86663a56c0341d192f131a4a8f4936
http://autobuild.buildroot.net/results/553d6fdeb6ea5359b1c7d4eeb844da7a588f02e7

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-jaraco-classes/python-jaraco-classes.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-jaraco-classes/python-jaraco-classes.mk b/package/python-jaraco-classes/python-jaraco-classes.mk
index 4251452..c361e97 100644
--- a/package/python-jaraco-classes/python-jaraco-classes.mk
+++ b/package/python-jaraco-classes/python-jaraco-classes.mk
@@ -10,5 +10,6 @@ PYTHON_JARACO_CLASSES_SITE = https://pypi.python.org/packages/b3/ce/031a6004619c
 PYTHON_JARACO_CLASSES_LICENSE = MIT
 PYTHON_JARACO_CLASSES_LICENSE_FILES = LICENSE
 PYTHON_JARACO_CLASSES_SETUP_TYPE = setuptools
+PYTHON_JARACO_CLASSES_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
