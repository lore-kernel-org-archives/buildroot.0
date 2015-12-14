From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 14 Dec 2015 09:25:57 +0100
Subject: [Buildroot] [PATCH 2/2] python-webpy: add a hash file and use pypi
	download location
In-Reply-To: <1450081557-29241-1-git-send-email-yegorslists@googlemail.com>
References: <1450081557-29241-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1450081557-29241-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-webpy/python-webpy.hash | 3 +++
 package/python-webpy/python-webpy.mk   | 3 ++-
 2 files changed, 5 insertions(+), 1 deletion(-)
 create mode 100644 package/python-webpy/python-webpy.hash

diff --git a/package/python-webpy/python-webpy.hash b/package/python-webpy/python-webpy.hash
new file mode 100644
index 0000000..05ee808
--- /dev/null
+++ b/package/python-webpy/python-webpy.hash
@@ -0,0 +1,3 @@
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=93375e3f03e74d6bf5c5096a4962a8db, sha256 locally computed
+md5     93375e3f03e74d6bf5c5096a4962a8db  web.py-0.37.tar.gz
+sha256  748c7e99ad9e36f62ea19f7965eb7dd7860b530e8f563ed60ce3e53e7409a550  web.py-0.37.tar.gz
diff --git a/package/python-webpy/python-webpy.mk b/package/python-webpy/python-webpy.mk
index ef5b6b3..2074b39 100644
--- a/package/python-webpy/python-webpy.mk
+++ b/package/python-webpy/python-webpy.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_WEBPY_VERSION = 0.37
-PYTHON_WEBPY_SITE = $(call github,webpy,webpy,webpy-$(PYTHON_WEBPY_VERSION))
+PYTHON_WEBPY_SOURCE = web.py-$(PYTHON_WEBPY_VERSION).tar.gz
+PYTHON_WEBPY_SITE = https://pypi.python.org/packages/source/w/web.py
 PYTHON_WEBPY_SETUP_TYPE = distutils
 PYTHON_WEBPY_LICENSE = Public Domain, CherryPy License
 PYTHON_WEBPY_LICENSE_FILES = LICENSE.txt web/wsgiserver/LICENSE.txt
-- 
2.1.4
