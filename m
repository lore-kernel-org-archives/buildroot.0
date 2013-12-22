From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Dec 2013 18:04:58 +0100
Subject: [Buildroot] [PATCH] python-pycrypto: ignore LICENSE.orig for the
	moment
Message-ID: <1387731898-14058-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LICENSE.orig gets removed from the source tree by the apply-patches.sh
script. Until this is fixed in apply-patches.sh, remove LICENSE.orig
from <pkg>_LICENSE_FILES to fix the autobuilder issues.

Fixes:

  http://autobuild.buildroot.org/results/122/1225850e3c3a95021403adae1db1d34f9f3e955b/build-end.log

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pycrypto/python-pycrypto.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
index eda48bd..9d9d77e 100644
--- a/package/python-pycrypto/python-pycrypto.mk
+++ b/package/python-pycrypto/python-pycrypto.mk
@@ -10,8 +10,12 @@ PYTHON_PYCRYPTO_SITE = http://ftp.dlitz.net/pub/dlitz/crypto/pycrypto
 PYTHON_PYCRYPTO_SETUP_TYPE = distutils
 
 PYTHON_PYCRYPTO_LICENSE = Public Domain, Python 2.2 License (HMAC.py, setup.py)
+
+# LEGAL/copy/LICENSE.orig should also be part of LICENSE_FILES below,
+# but our apply-patches.sh script removes all .orig files. Until this
+# is fixed, ignore LICENSE.orig.
 PYTHON_PYCRYPTO_LICENSE_FILES = COPYRIGHT LEGAL/copy/LICENSE.libtom \
-		LEGAL/copy/LICENSE.orig LEGAL/copy/LICENSE.python-2.2
+		LEGAL/copy/LICENSE.python-2.2
 
 PYTHON_PYCRYPTO_DEPENDENCIES = gmp
 
-- 
1.8.3.2
