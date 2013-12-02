From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  2 Dec 2013 09:22:57 -0300
Subject: [Buildroot] [PATCH] libtasn1: fix botched makeinfo/missing logic
Message-ID: <1385986977-12085-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The makeinfo/missing logic is botched leading to failures such as:
http://autobuild.buildroot.net/results/5f0/5f0e8f62be86b56813f5fc0510e83289ed2b0410/
Just disable documentation build the hard way.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libtasn1/libtasn1.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
index e58bcbc..122f775 100644
--- a/package/libtasn1/libtasn1.mk
+++ b/package/libtasn1/libtasn1.mk
@@ -10,5 +10,7 @@ LIBTASN1_DEPENDENCIES = host-bison
 LIBTASN1_LICENSE = GPLv3+ LGPLv2.1+
 LIBTASN1_LICENSE_FILES = COPYING COPYING.LIB
 LIBTASN1_INSTALL_STAGING = YES
+# 'missing' fallback logic botched so disable it completely
+LIBTASN1_CONF_ENV = MAKEINFO="true"
 
 $(eval $(autotools-package))
-- 
1.8.3.2
