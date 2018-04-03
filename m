From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Apr 2018 13:20:36 +0200
Subject: [Buildroot] [git commit] python-keyring: unbreak after download
 rework
Message-ID: <20180403112153.B007382DC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b23da4fe46b9ed284440c707a2d540b3e3bd6508
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

commit 514291f39ef06 (packages: use new $($PKG)_DL_DIR) variable) strangely
enough removed the PYTHON_KEYRING_SITE line, breaking the build.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-keyring/python-keyring.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 8ac18ae052..27db2802ed 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -6,6 +6,7 @@
 
 PYTHON_KEYRING_VERSION = 10.5.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
+PYTHON_KEYRING_SITE = https://pypi.python.org/packages/42/2e/51bd1739fe335095a2174db3f2f230346762e7e572471059540146a521f6
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
