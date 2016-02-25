From: Martin Bark <martin@barkynet.com>
Date: Thu, 25 Feb 2016 13:23:33 +0000
Subject: [Buildroot] [PATCH 2/4] package/iputils: add support for nettle
In-Reply-To: <1456406615-7324-1-git-send-email-martin@barkynet.com>
References: <1456406615-7324-1-git-send-email-martin@barkynet.com>
Message-ID: <1456406615-7324-2-git-send-email-martin@barkynet.com>
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
index 953f1f5..efedf1f 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -33,6 +33,13 @@ else
 IPUTILS_MAKE_OPTS += USE_CAP=no
 endif
 
+ifeq ($(BR2_PACKAGE_NETTLE),y)
+IPUTILS_MAKE_OPTS += USE_NETTLE=yes
+IPUTILS_DEPENDENCIES += nettle
+else
+IPUTILS_MAKE_OPTS += USE_NETTLE=no
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 IPUTILS_MAKE_OPTS += USE_CRYPTO=yes
 IPUTILS_DEPENDENCIES += openssl
-- 
2.5.0
