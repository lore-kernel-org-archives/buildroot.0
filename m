From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Thu, 25 Aug 2016 07:58:04 +0200
Subject: [Buildroot] [PATCH] python-meld3: fix setup type
Message-ID: <1472104684-3151-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

meld3 relies on setuptools instead of distutils.

Fixes:
http://autobuild.buildroot.net/results/f9e/f9ef01d2cb1d32cb13743e83c7fc9c0d354fc571/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
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
-- 
2.8.1
