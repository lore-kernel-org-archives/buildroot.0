From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Tue, 20 Mar 2018 08:47:40 -0500
Subject: [Buildroot] [PATCH v2 1/3] python-decorator: Update to add host
 package
Message-ID: <1521553662-4115-1-git-send-email-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to add host package for python decorator

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
--
v1 -> v2: No change

---
 package/python-decorator/python-decorator.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index c0c43f6..f97365f 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -7,7 +7,10 @@
 PYTHON_DECORATOR_VERSION = 4.0.11
 PYTHON_DECORATOR_SITE = https://pypi.python.org/packages/cc/ac/5a16f1fc0506ff72fcc8fd4e858e3a1c231f224ab79bb7c4c9b2094cc570
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
+PYTHON_DECORATOR_DEPENDENCIES = python-setuptools
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_SETUP_TYPE = setuptools
+HOST_PYTHON_DECORATOR_DEPENDENCIES = host-python-setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
