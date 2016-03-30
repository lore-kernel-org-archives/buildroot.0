From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Mar 2016 12:39:17 -0300
Subject: [Buildroot] [PATCH 1/4] python-pycrypto: add host variant
Message-ID: <1459352360-12927-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will be used by the crda python3-enabling patch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
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
-- 
2.7.3
