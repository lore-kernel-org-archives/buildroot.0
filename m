From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Feb 2014 22:47:53 +0100
Subject: [Buildroot] [git commit branch/next] python-distutilscross: remove
	package that is no longer needed
Message-ID: <20140218220743.488259CA01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70b86189c9278ffb19526292c4a85b9a96a67ea8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Thanks to the previous commit that makes distutilscross unecessary for
setuptools packages, the host-distutilscross package can now be
removed. There is no need for any Config.in.legacy handling, since
there is no target variant, or visible Config.in option for
host-distutilscross.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../python-distutilscross/python-distutilscross.mk |   12 ------------
 1 files changed, 0 insertions(+), 12 deletions(-)

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
