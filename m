From: Martin Bark <martin@barkynet.com>
Date: Thu, 25 Feb 2016 13:23:34 +0000
Subject: [Buildroot] [PATCH 3/4] package/iputils: add support for libgcrypt
In-Reply-To: <1456406615-7324-1-git-send-email-martin@barkynet.com>
References: <1456406615-7324-1-git-send-email-martin@barkynet.com>
Message-ID: <1456406615-7324-3-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/iputils/iputils.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index efedf1f..92e2bc9 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -33,6 +33,13 @@ else
 IPUTILS_MAKE_OPTS += USE_CAP=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+IPUTILS_MAKE_OPTS += USE_GCRYPT=yes
+IPUTILS_DEPENDENCIES += libgcrypt
+else
+IPUTILS_MAKE_OPTS += USE_GCRYPT=no
+endif
+
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 IPUTILS_MAKE_OPTS += USE_NETTLE=yes
 IPUTILS_DEPENDENCIES += nettle
-- 
2.5.0
