From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 17:45:53 +0200
Subject: [Buildroot] [git commit] python-pycrypto: add host variant
Message-ID: <20160330154725.8CC31819A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=37001b6f66b7d269e64af35dcc5a7b9e54188b52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Will be used by the crda python3-enabling patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/python-pycrypto/python-pycrypto.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
index bb69f41..20ff4a3 100644
--- a/package/python-pycrypto/python-pycrypto.mk
+++ b/package/python-pycrypto/python-pycrypto.mk
@@ -22,6 +22,7 @@ define PYTHON_PYCRYPTO_RENAME_LICENSE
 	mv $(@D)/LEGAL/copy/LICENSE.orig $(@D)/LEGAL/copy/LICENSE.original
 endef
 PYTHON_PYCRYPTO_POST_EXTRACT_HOOKS += PYTHON_PYCRYPTO_RENAME_LICENSE
+HOST_PYTHON_PYCRYPTO_POST_EXTRACT_HOOKS += PYTHON_PYCRYPTO_RENAME_LICENSE
 PYTHON_PYCRYPTO_LICENSE_FILES += LEGAL/copy/LICENSE.original
 
 PYTHON_PYCRYPTO_DEPENDENCIES = gmp
@@ -44,3 +45,4 @@ define PYTHON_PYCRYPTO_CONFIGURE_CMDS
 endef
 
 $(eval $(python-package))
+$(eval $(host-python-package))
