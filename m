From: Patrick Gerber <kpa_info@yahoo.fr>
Date: Tue, 12 Feb 2013 13:24:08 +0100
Subject: [Buildroot] [PATCH 4/5] python-bottle: Convert package to be used
	with python2 or python3
In-Reply-To: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
References: <1360671849-7621-1-git-send-email-kpa_info@yahoo.fr>
Message-ID: <1360671849-7621-5-git-send-email-kpa_info@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Patrick Gerber <kpa_info@yahoo.fr>
---
 package/python-bottle/Config.in        |    1 +
 package/python-bottle/python-bottle.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-bottle/Config.in b/package/python-bottle/Config.in
index f9b60ca..e6f2f3b 100644
--- a/package/python-bottle/Config.in
+++ b/package/python-bottle/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_BOTTLE
 	bool "python-bottle"
+	depends on (BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3)
 	help
 	  Bottle is a fast, simple and lightweight WSGI micro web-framework
 	  for Python. It is distributed as a single file module and has no
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index 370b31b..d24e0ec 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -7,7 +7,7 @@
 PYTHON_BOTTLE_VERSION = 0.11.4
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
 PYTHON_BOTTLE_SITE = http://pypi.python.org/packages/source/b/bottle
-PYTHON_BOTTLE_DEPENDENCIES = python
+PYTHON_BOTTLE_DEPENDENCIES = $(PYTHON_GENERIC_DEPENDENCIES)
 PYTHON_BOTTLE_LICENSE = MIT
 # README.rst refers to the file "LICENSE" but it's not included
 
-- 
1.7.10.4
