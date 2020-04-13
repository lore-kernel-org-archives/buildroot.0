From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 13 Apr 2020 17:12:30 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-pysmb: select pyasn1 instead
 of pyasn
Message-ID: <20200413231230.123828-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The python-pyasn package is an outdated version of python-pyasn1 and
should not be used.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pysmb/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pysmb/Config.in b/package/python-pysmb/Config.in
index 32a6878fbf..61d7c2a03e 100644
--- a/package/python-pysmb/Config.in
+++ b/package/python-pysmb/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYSMB
 	bool "python-pysmb"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_PYTHON_PYASN
+	select BR2_PACKAGE_PYTHON_PYASN1
 	help
 	  pysmb is an experimental SMB/CIFS library written in Python.
 	  It implements the client-side SMB/CIFS protocol (SMB1 and
-- 
2.20.1
