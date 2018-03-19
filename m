From: Jared Bents <jared.bents@rockwellcollins.com>
Date: Mon, 19 Mar 2018 10:23:10 -0500
Subject: [Buildroot] [PATCH v1 1/3] python-decorator: Update to add host
 package
Message-ID: <1521472992-42812-1-git-send-email-jared.bents@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to add host package for python decorator

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/python-decorator/python-decorator.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index c0c43f6..313ad97 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -7,7 +7,9 @@
 PYTHON_DECORATOR_VERSION = 4.0.11
 PYTHON_DECORATOR_SITE = https://pypi.python.org/packages/cc/ac/5a16f1fc0506ff72fcc8fd4e858e3a1c231f224ab79bb7c4c9b2094cc570
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
+PYTHON_DECORATOR_DEPENDENCIES = python-setuptools
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
1.9.1
