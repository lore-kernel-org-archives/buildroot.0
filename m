From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 21:36:36 +0100
Subject: [Buildroot] [git commit] package/iputils: add support for nettle
Message-ID: <20160302202757.D037B7FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=73b56118f2a0d7039fda7a62380ff22d64adbfa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
