From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Feb 2014 21:39:55 +0100
Subject: [Buildroot] [PATCH v2 02/20] python-distutilscross: remove package
	that is no longer needed
In-Reply-To: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1392756013-27757-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1392756013-27757-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks to the previous commit that makes distutilscross unecessary for
setuptools packages, the host-distutilscross package can now be
removed. There is no need for any Config.in.legacy handling, since
there is no target variant, or visible Config.in option for
host-distutilscross.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-distutilscross/python-distutilscross.mk | 12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 package/python-distutilscross/python-distutilscross.mk

diff --git a/package/python-distutilscross/python-distutilscross.mk b/package/python-distutilscross/python-distutilscross.mk
deleted file mode 100644
index cfe2811..0000000
--- a/package/python-distutilscross/python-distutilscross.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# python-distutilscross
-#
-################################################################################
-
-PYTHON_DISTUTILSCROSS_VERSION = 0.1
-PYTHON_DISTUTILSCROSS_SOURCE  = distutilscross-$(PYTHON_DISTUTILSCROSS_VERSION).tar.gz
-PYTHON_DISTUTILSCROSS_SITE    = http://pypi.python.org/packages/source/d/distutilscross
-PYTHON_DISTUTILSCROSS_SETUP_TYPE = setuptools
-
-$(eval $(host-python-package))
-- 
1.8.3.2
