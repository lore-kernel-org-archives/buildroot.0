From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Aug 2016 15:21:32 +0200
Subject: [Buildroot] [git commit] python-meld3: fix setup type
Message-ID: <20160825132139.0247E82210@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=162e7471a69fe919d363a52befda28a902c1ad34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

meld3 relies on setuptools instead of distutils.

Fixes:
http://autobuild.buildroot.net/results/f9e/f9ef01d2cb1d32cb13743e83c7fc9c0d354fc571/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-meld3/python-meld3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
index 268263d..529425c 100644
--- a/package/python-meld3/python-meld3.mk
+++ b/package/python-meld3/python-meld3.mk
@@ -9,6 +9,6 @@ PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
 PYTHON_MELD3_SITE = https://pypi.python.org/packages/45/a0/317c6422b26c12fe0161e936fc35f36552069ba8e6f7ecbd99bbffe32a5f
 PYTHON_MELD3_LICENSE = ZPLv2.1
 PYTHON_MELD3_LICENSE_FILES = COPYRIGHT.txt LICENSE.txt
-PYTHON_MELD3_SETUP_TYPE = distutils
+PYTHON_MELD3_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
