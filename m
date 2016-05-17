From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 May 2016 23:19:14 +0200
Subject: [Buildroot] [PATCH v4 2/4] python-pyftpdlib: bump version to 1.5.1,
	fixing Python 3 issue
In-Reply-To: <1463519956-5599-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1463519956-5599-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1463519956-5599-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumpds the version of python-pyftpdlib to fix a
byte-compilation problem occuring with Python 3. The current version of
pyftpdlib contained a file that had mistakenly been added to the
release, and which wasn't Python 3 compliant. The new 1.5.1 version has
been released specifically to address this problem, see:

  https://github.com/giampaolo/pyftpdlib/issues/381

Until now, this wasn't causing any problem as a byte-compilation problem
was not a fatal failure. But upcoming commits will make it a fatal
failure, so it needs to be fixed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Yegor: the URL is not the conventional pypi URL, but
https://pypi.python.org/packages/source/p/pyftpdlib/pyftpdlib-1.5.1.tar.gz
returns a 404, while the URL I've used is working. Any idea?
---
 package/python-pyftpdlib/python-pyftpdlib.hash | 6 +++---
 package/python-pyftpdlib/python-pyftpdlib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index b6d0cca..9726f9f 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,3 +1,3 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=0c6f7c447fb702af4d5ca0123003c9fd, sha256 locally computed
-md5     0c6f7c447fb702af4d5ca0123003c9fd  pyftpdlib-1.5.0.tar.gz
-sha256  0111127418e9012a8e9e6c05a0c64af1acef8c31128834805fb0f9a49c746261  pyftpdlib-1.5.0.tar.gz
+# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=61b23e2362df23d0dfa5fe76f6e2ab55, sha256 locally computed
+md5  61b23e2362df23d0dfa5fe76f6e2ab55  pyftpdlib-1.5.1.tar.gz
+sha256  7bcd7fc825123414a157718c6dcdcb0978208d3c865d4650564acef4acce3354  pyftpdlib-1.5.1.tar.gz
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index 11e24e2..85d0b56 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 1.5.0
+PYTHON_PYFTPDLIB_VERSION = 1.5.1
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://pypi.python.org/packages/source/p/pyftpdlib
+PYTHON_PYFTPDLIB_SITE = https://pypi.python.org/packages/a8/f8/0f6db156898616dbcbd7bf865660295c81479071ab0fcd1898fe1b3a4fc4
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
-- 
2.7.4
