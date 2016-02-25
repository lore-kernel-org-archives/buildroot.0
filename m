From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 21:36:49 +0100
Subject: [Buildroot] [git commit] package/iputils: add support for libgcrypt
Message-ID: <20160302202757.DAAE77FA0E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca99ed18025d3ad42575cb23a8c284a8d64abef3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
