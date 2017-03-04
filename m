From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Mar 2017 11:36:26 +0100
Subject: [Buildroot] [git commit] python-enum: fix license information
Message-ID: <20170304103820.41C858222B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4235a8372ccaa54bc8322361a41003837d005a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bump of python-enum to version 0.4.6 in commit
636df89872c7b6a6bed2c679cf65da41309ac652 forgot to update the license
information. Even though the PKG-INFO file still pretends it's GPLv2
or Python license, the only license file available is LICENSE.GPL-3
(which indicates a GPLv3 license), and the comment header in the
source code is pretty clear:

    This is free software: you may copy, modify, and/or distribute
    this work under the terms of the GNU General Public License as
    published by the Free Software Foundation; version 3 of that
    license or any later version.  No warranty expressed or
    implied. See the file ???LICENSE.GPL-3??? for details.

Fixes:

   http://autobuild.buildroot.net/results/7fec1c7cde710f523263e74b1849f1f4488b7d26/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-enum/python-enum.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-enum/python-enum.mk b/package/python-enum/python-enum.mk
index e1a55c3..aac9328 100644
--- a/package/python-enum/python-enum.mk
+++ b/package/python-enum/python-enum.mk
@@ -8,7 +8,7 @@ PYTHON_ENUM_VERSION = 0.4.6
 PYTHON_ENUM_SOURCE = enum-$(PYTHON_ENUM_VERSION).tar.gz
 PYTHON_ENUM_SITE = https://pypi.python.org/packages/0c/4e/1ea357e7783c756bb579333c1e4a026fb331371ee771f616ffedc781e531
 PYTHON_ENUM_SETUP_TYPE = setuptools
-PYTHON_ENUM_LICENSE = GPLv2+ or Python software foundation license v2
-PYTHON_ENUM_LICENSE_FILES = LICENSE.GPL LICENSE.PSF
+PYTHON_ENUM_LICENSE = GPLv3+
+PYTHON_ENUM_LICENSE_FILES = LICENSE.GPL-3
 
 $(eval $(python-package))
