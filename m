From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2020 22:32:38 +0100
Subject: [Buildroot] [git commit] package/python-lmdb: bump to version 0.99
Message-ID: <20201112211901.E670D8115B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b6bf8b2169b7de7c509a9312bc308c6bccd47f45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version fix the runtime issue with python 3.9 since _Py_ForgetReference()
was removed from the limited C API [1].

$ python sample_python_crossbar.py
/usr/bin/python3.9: symbol '_Py_ForgetReference': can't resolve symbol

python-lmbd 0.99 contain a refactoring removing _Py_ForgetReference()
from the code.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981961
https://gitlab.com/buildroot.org/buildroot/-/jobs/830981979

[1] https://docs.python.org/3/whatsnew/3.9.html#id3
[2] https://github.com/jnwatson/py-lmdb/commit/22a3724bdcda62853e8a250094f512eb20abe01f

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index 569d1d0bd6..cb28536d3f 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5	ae2efef18202e51c9e4a807a47900ce2  lmdb-0.98.tar.gz
-sha256	0625bc28bf0893e6000a83be7234f915ca078c32f9e73d8ae48b3508db7af708  lmdb-0.98.tar.gz
+md5	507049767b995c3c6a93b3bd97567c71  lmdb-0.99.tar.gz
+sha256	f9eb844aaaacc8a4bc175e1c1f8a8fb538c330e378fd9eb40e8708d4dca7dc89  lmdb-0.99.tar.gz
 # Locally computed sha256 checksums
 sha256	310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index f92c7f775b..bf98ba19c8 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 0.98
+PYTHON_LMDB_VERSION = 0.99
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/c0/5c/d56dbc2532ecf14fa004c543927500c0f645eaca8bd7ec39420c7546396a
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/3b/66/aa6f3a3e338a3ca263575ce6f722c2fdcd21039a03b55c722e0ae0b216db
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_SETUP_TYPE = setuptools
