From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Dec 2016 17:09:38 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] python-bottle: security
	bump to 0.12.11
Message-ID: <20161221161130.804847FE69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5c78f258a2e1b2ba5cf38f662e7464c793d7712
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

"\r\n" sequences were not properly filtered when handling redirections.
This allowed an attacker to perform CRLF attacks such as HTTP header
injection:

https://github.com/bottlepy/bottle/issues/913

Python-bottle now uses setuptools instead of distutils.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aa64e33c5176f89ddd1d505b8237e9f4718c2f71)
---
 package/python-bottle/python-bottle.hash | 4 ++--
 package/python-bottle/python-bottle.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bottle/python-bottle.hash b/package/python-bottle/python-bottle.hash
index 5a589f1..357391d 100644
--- a/package/python-bottle/python-bottle.hash
+++ b/package/python-bottle/python-bottle.hash
@@ -1,3 +1,3 @@
 # md5 from https://pypi.python.org/pypi/bottle/json, sha256 locally computed
-md5	f5850258a86224a791171e8ecbb66d99  bottle-0.12.9.tar.gz
-sha256	fe0a24b59385596d02df7ae7845fe7d7135eea73799d03348aeb9f3771500051  bottle-0.12.9.tar.gz
+md5	6c38912f4755ba71d852fbe320bdd61c  bottle-0.12.11.tar.gz
+sha256	a1958f9725042a9809ebe33d7eadf90d1d563a8bdd6ce5f01849bff7e941a731  bottle-0.12.11.tar.gz
diff --git a/package/python-bottle/python-bottle.mk b/package/python-bottle/python-bottle.mk
index ec09398..4757062 100644
--- a/package/python-bottle/python-bottle.mk
+++ b/package/python-bottle/python-bottle.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_BOTTLE_VERSION = 0.12.9
+PYTHON_BOTTLE_VERSION = 0.12.11
 PYTHON_BOTTLE_SOURCE = bottle-$(PYTHON_BOTTLE_VERSION).tar.gz
-PYTHON_BOTTLE_SITE = http://pypi.python.org/packages/source/b/bottle
+PYTHON_BOTTLE_SITE = https://pypi.python.org/packages/a1/f6/0db23aeeb40c9a7c5d226b1f70ce63822c567178eee5b623bca3e0cc3bef
 PYTHON_BOTTLE_LICENSE = MIT
 # README.rst refers to the file "LICENSE" but it's not included
-PYTHON_BOTTLE_SETUP_TYPE = distutils
+PYTHON_BOTTLE_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
