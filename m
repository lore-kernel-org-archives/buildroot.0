From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:02 +0200
Subject: [Buildroot] [PATCH 33/69] python-pycrypto: add explicit
	dependencies for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-34-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/python-pycrypto/python-pycrypto.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pycrypto/python-pycrypto.mk b/package/python-pycrypto/python-pycrypto.mk
index 71943fa2cdb1..927ba918ae19 100644
--- a/package/python-pycrypto/python-pycrypto.mk
+++ b/package/python-pycrypto/python-pycrypto.mk
@@ -26,6 +26,7 @@ HOST_PYTHON_PYCRYPTO_POST_EXTRACT_HOOKS += PYTHON_PYCRYPTO_RENAME_LICENSE
 PYTHON_PYCRYPTO_LICENSE_FILES += LEGAL/copy/LICENSE.original
 
 PYTHON_PYCRYPTO_DEPENDENCIES = gmp
+HOST_PYTHON_PYCRYPTO_DEPENDENCIES = host-gmp
 
 # The configure step needs to be run outside of the setup.py since it isn't
 # run correctly for cross-compiling
-- 
2.1.0
