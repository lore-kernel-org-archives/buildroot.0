From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 14:32:41 +0200
Subject: [Buildroot] [git commit] python-pyparsing: bump to version 2.0.2,
	enable on Python 3
Message-ID: <20141005123249.A4A26B08F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fad1e2322fe0556ebf7e8887334a9d02712980a7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps the pyparsing package to version 2.0.2, and
therefore enables it usage with Python 3.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Christophe Vu-Brugier <cvubrugier@fastmail.fm>
---
 package/python-pyparsing/Config.in           |    2 +-
 package/python-pyparsing/python-pyparsing.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pyparsing/Config.in b/package/python-pyparsing/Config.in
index 49a474b..0408e5e 100644
--- a/package/python-pyparsing/Config.in
+++ b/package/python-pyparsing/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_PYPARSING
 	bool "python-pyparsing"
-	depends on BR2_PACKAGE_PYTHON
+	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
 	help
 	  The pyparsing module is an alternative approach to creating and
 	  executing simple grammars, vs. the traditional lex/yacc approach,
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index 07dda58..82a907b 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION         = 1.5.6
+PYTHON_PYPARSING_VERSION         = 2.0.2
 PYTHON_PYPARSING_SOURCE          = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
 PYTHON_PYPARSING_SITE            = http://downloads.sourceforge.net/project/pyparsing/pyparsing/pyparsing-$(PYTHON_PYPARSING_VERSION)
 PYTHON_PYPARSING_LICENSE         = MIT
