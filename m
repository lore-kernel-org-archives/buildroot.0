From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Dec 2014 12:39:27 +0100
Subject: [Buildroot] [PATCH 1/6 v3] pacakge/freerdp: disable building the
	manpages
In-Reply-To: <cover.1417952276.git.yann.morin.1998@free.fr>
References: <cover.1417952276.git.yann.morin.1998@free.fr>
Message-ID: <80f81c6f8018e94d43c0a7ed7eec3ea3c50110ee.1417952276.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building the manpages requires xsltproc, which might not be available.
Also, who needs the manpages on the target anyway? ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
---
 package/freerdp/freerdp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index cb745ec..d2e51f8 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -12,6 +12,8 @@ FREERDP_DEPENDENCIES = openssl zlib \
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
+FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF
+
 ifeq ($(BR2_PACKAGE_CUPS),y)
 FREERDP_CONF_OPTS += -DWITH_CUPS=ON
 FREERDP_DEPENDENCIES += cups
-- 
1.9.1
