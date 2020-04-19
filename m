From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 10:16:26 +0200
Subject: [Buildroot] [git commit] package/python-pysmb: use pyasn1 instead
 of pyasn
Message-ID: <20200419080313.0738C8F109@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=61cf38aadf2495844f8eed93262cd797e9fdea7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-pyasn and python-pyasn1 packages package the exact same
upstream Python module, pyasn1. However, python-pyasn uses an outdated
version, and shouldn't be used.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
