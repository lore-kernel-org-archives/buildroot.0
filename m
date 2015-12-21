From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 21 Dec 2015 11:50:23 +0100
Subject: [Buildroot] [PATCH 3/4] python-pyftpdlib: bump to 1.5.0
In-Reply-To: <1450695024-24875-1-git-send-email-yegorslists@googlemail.com>
References: <1450695024-24875-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1450695024-24875-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Change download location to pypi and add pypi MD5 checksum.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-pyftpdlib/python-pyftpdlib.hash | 5 +++--
 package/python-pyftpdlib/python-pyftpdlib.mk   | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index e1d2e94..b6d0cca 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,2 +1,3 @@
-# Locally computed:
-sha256  e2024de33024582ef26e30395225180048b98cab341f3e9f3a55f56397c9a4b5  python-pyftpdlib-1.4.0.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=0c6f7c447fb702af4d5ca0123003c9fd, sha256 locally computed
+md5     0c6f7c447fb702af4d5ca0123003c9fd  pyftpdlib-1.5.0.tar.gz
+sha256  0111127418e9012a8e9e6c05a0c64af1acef8c31128834805fb0f9a49c746261  pyftpdlib-1.5.0.tar.gz
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index af9423f..11e24e2 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 1.4.0
-PYTHON_PYFTPDLIB_SITE = $(call github,giampaolo,pyftpdlib,release-$(PYTHON_PYFTPDLIB_VERSION))
+PYTHON_PYFTPDLIB_VERSION = 1.5.0
+PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
+PYTHON_PYFTPDLIB_SITE = https://pypi.python.org/packages/source/p/pyftpdlib
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
-- 
2.1.4
