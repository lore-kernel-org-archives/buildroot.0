From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Feb 2014 08:59:27 +0100
Subject: [Buildroot] [git commit] python-pyasn: use the real upstream
Message-ID: <20140228133414.BF1C09BA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5aa4f71b51a3713d765b0e430fc34abecd0bea93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The https://code.google.com/p/pyasn/ project is not really the real
upstream for PyASN, and at least not the upstream for the PyASN
implementation recommended by the PySNMP developers.

Instead, the real upstream is
https://pypi.python.org/packages/source/p/pyasn1/, which has had much
more regular releases than the other PyASN implementation.

Therefore, we switch to using this implementation, as recommended by
the PySNMP developers on http://pysnmp.sourceforge.net/download.html.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyasn/python-pyasn.mk |   12 +++---------
 1 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/python-pyasn/python-pyasn.mk b/package/python-pyasn/python-pyasn.mk
index b007222..43fabe9 100644
--- a/package/python-pyasn/python-pyasn.mk
+++ b/package/python-pyasn/python-pyasn.mk
@@ -4,16 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYASN_VERSION = 1.2
-PYTHON_PYASN_SOURCE = PyASN-$(PYTHON_PYASN_VERSION).zip
-PYTHON_PYASN_SITE = https://pyasn.googlecode.com/files
+PYTHON_PYASN_VERSION = 0.17
+PYTHON_PYASN_SOURCE = pyasn1-$(PYTHON_PYASN_VERSION).tar.gz
+PYTHON_PYASN_SITE = https://pypi.python.org/packages/source/p/pyasn1/
 PYTHON_PYASN_LICENSE = LGPLv3+ (pyasn.cpp), GPLv2+ (libgds)
 PYTHON_PYASN_SETUP_TYPE = distutils
 
-define PYTHON_PYASN_EXTRACT_CMDS
-	unzip -d $(@D) $(DL_DIR)/$(PYTHON_PYASN_SOURCE)
-	mv $(@D)/PyASN-$(PYTHON_PYASN_VERSION)/* $(@D)
-	$(RM) -r $(@D)/PyASN-$(PYTHON_PYASN_VERSION)
-endef
-
 $(eval $(python-package))
