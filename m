From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 24 Dec 2015 22:30:39 +0100
Subject: [Buildroot] [PATCH 3/5] python-cffi: add host variant
In-Reply-To: <1450992641-8618-1-git-send-email-yegorslists@googlemail.com>
References: <1450992641-8618-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1450992641-8618-3-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Host variant is needed to build python-cryptography package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-cffi/python-cffi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-cffi/python-cffi.mk b/package/python-cffi/python-cffi.mk
index 70fbe02..a6e4107 100644
--- a/package/python-cffi/python-cffi.mk
+++ b/package/python-cffi/python-cffi.mk
@@ -11,5 +11,7 @@ PYTHON_CFFI_SETUP_TYPE = setuptools
 PYTHON_CFFI_DEPENDENCIES = host-pkgconf libffi
 PYTHON_CFFI_LICENSE = MIT
 PYTHON_CFFI_LICENSE_FILES = LICENSE
+HOST_PYTHON_CFFI_DEPENDENCIES = host-python-pycparser
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.1.4
