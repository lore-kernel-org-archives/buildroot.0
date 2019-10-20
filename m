From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 20 Oct 2019 22:01:42 +0300
Subject: [Buildroot] [PATCH 1/1] package/python-reentry: add host variant
In-Reply-To: <20191020190142.18672-1-asafka7@gmail.com>
References: <20191020190142.18672-1-asafka7@gmail.com>
Message-ID: <20191020190142.18672-2-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add needed host variants to relevant dependencies.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-click/python-click.mk       | 1 +
 package/python-pathlib2/python-pathlib2.mk | 1 +
 package/python-reentry/python-reentry.mk   | 5 +++++
 3 files changed, 7 insertions(+)

diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 12539f557b..1c8c28449a 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -12,3 +12,4 @@ PYTHON_CLICK_LICENSE_FILES = LICENSE.rst
 PYTHON_CLICK_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python-pathlib2/python-pathlib2.mk b/package/python-pathlib2/python-pathlib2.mk
index d813b77d7e..5fa885235b 100644
--- a/package/python-pathlib2/python-pathlib2.mk
+++ b/package/python-pathlib2/python-pathlib2.mk
@@ -12,3 +12,4 @@ PYTHON_PATHLIB2_LICENSE_FILES = LICENSE.rst
 PYTHON_PATHLIB2_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python-reentry/python-reentry.mk b/package/python-reentry/python-reentry.mk
index 428dbf2b1b..b4bd33d846 100644
--- a/package/python-reentry/python-reentry.mk
+++ b/package/python-reentry/python-reentry.mk
@@ -10,5 +10,10 @@ PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/ee/3f/a90789e01c4d
 PYTHON_REENTRY_SETUP_TYPE = setuptools
 PYTHON_REENTRY_LICENSE = MIT
 PYTHON_REENTRY_LICENSE_FILES = LICENSE
+HOST_PYTHON_REENTRY_DEPENDENCIES = \
+	host-python-six
+	host-python-click
+	$(if $(BR2_PACKAGE_PYTHON),host-python-pathlib2,)
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.20.1
