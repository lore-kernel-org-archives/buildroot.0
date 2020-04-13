From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 13 Apr 2020 17:17:04 -0600
Subject: [Buildroot] [PATCH 1/1] package/python-coherence: select pyasn1
 instead of pyasn
Message-ID: <20200413231704.124258-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The python-pyasn package is an outdated version of python-pyasn1 and
should not be used.

We no longer need to depend on BR2_INSTALL_LIBSTDCPP as python-pyasn1
does not depend on it.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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
-- 
2.20.1
