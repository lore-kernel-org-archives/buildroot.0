From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Apr 2020 10:16:53 +0200
Subject: [Buildroot] [git commit] package/python-coherence: use pyasn1
 instead of pyasn
Message-ID: <20200419080313.0FA428F139@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fc2c1caf7fd16087c74c5de0abe417f39f80e30
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The python-pyasn and python-pyasn1 packages package the exact same
upstream Python module, pyasn1. However, python-pyasn uses an outdated
version, and shouldn't be used.

We no longer need to depend on BR2_INSTALL_LIBSTDCPP as python-pyasn1
does not depend on it.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-coherence/Config.in | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/package/python-coherence/Config.in b/package/python-coherence/Config.in
index 63427964a7..0f50080e67 100644
--- a/package/python-coherence/Config.in
+++ b/package/python-coherence/Config.in
@@ -1,15 +1,10 @@
 config BR2_PACKAGE_PYTHON_COHERENCE
 	bool "python-coherence"
 	depends on BR2_PACKAGE_PYTHON
-	depends on BR2_INSTALL_LIBSTDCPP # python-pyasn
 	select BR2_PACKAGE_PYTHON_TWISTED
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE
-	select BR2_PACKAGE_PYTHON_PYASN
+	select BR2_PACKAGE_PYTHON_PYASN1
 	help
 	  A DLNA/UPnP Media Server and Framework for the Digital Living.
 
 	  https://github.com/coherence-project/Coherence
-
-comment "python-coherence needs a toolchain w/ C++"
-	depends on BR2_PACKAGE_PYTHON
-	depends on !BR2_INSTALL_LIBSTDCPP
