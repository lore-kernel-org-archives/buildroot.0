From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 15:05:34 +0100
Subject: [Buildroot] [git commit] python-dominate: bump to version 2.3.1
Message-ID: <20161217140817.0A5E2817BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c817ee6053e927a301e3604936fc9b22033bccaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use PyPI as download location.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-dominate/python-dominate.hash | 5 +++--
 package/python-dominate/python-dominate.mk   | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-dominate/python-dominate.hash b/package/python-dominate/python-dominate.hash
index 1d763ac..2480b00 100644
--- a/package/python-dominate/python-dominate.hash
+++ b/package/python-dominate/python-dominate.hash
@@ -1,2 +1,3 @@
-# sha256 locally computed
-sha256 318063a9b600cdc13f84592ad515db0fd3a2816a2433e2a2fad55a5398ae05da  python-dominate-acb02c7c71e353e5dfbc905d506b54908533027e.tar.gz
+# md5 from https://pypi.python.org/pypi/dominate/json, sha256 locally computed
+md5     45bd97e6f7888aac24ae86013c57638e  dominate-2.3.1.tar.gz
+sha256  4b8ce6f33633c9dd9175b228d21c00c801b6bd0327747cd5e17fc2da934c3a69  dominate-2.3.1.tar.gz
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
index 170553f..3e264ca 100644
--- a/package/python-dominate/python-dominate.mk
+++ b/package/python-dominate/python-dominate.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOMINATE_VERSION = acb02c7c71e353e5dfbc905d506b54908533027e
-PYTHON_DOMINATE_SITE = $(call github,Knio,dominate,$(PYTHON_DOMINATE_VERSION))
+PYTHON_DOMINATE_VERSION = 2.3.1
+PYTHON_DOMINATE_SOURCE = dominate-$(PYTHON_DOMINATE_VERSION).tar.gz
+PYTHON_DOMINATE_SITE = https://pypi.python.org/packages/43/b2/3b7d67dd59dab93ae08569384b254323516e8868b453eea5614a53835baf
 PYTHON_DOMINATE_SETUP_TYPE = setuptools
 PYTHON_DOMINATE_LICENSE = LGPLv3+
 PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
