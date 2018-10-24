From: Asaf Kahlon <asafka7@gmail.com>
Date: Wed, 24 Oct 2018 19:22:15 +0300
Subject: [Buildroot] [PATCH 1/1] python-pip: select
 BR2_PACKAGE_PYTHON_SETUPTOOLS
Message-ID: <20181024162215.6758-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pip needs pkg_resources, which is installed with setuptools.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pip/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
index 4fcd55e5ab..c523c938ad 100644
--- a/package/python-pip/Config.in
+++ b/package/python-pip/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PIP
 	bool "python-pip"
+	select BR2_PACKAGE_PYTHON_SETUPTOOLS
 	help
 	  The PyPA recommended tool for installing Python packages.
 
-- 
2.17.1
