From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Dec 2014 12:39:30 +0100
Subject: [Buildroot] [PATCH 4/6 v3] package/freerdp: also install to staging
In-Reply-To: <cover.1417952276.git.yann.morin.1998@free.fr>
References: <cover.1417952276.git.yann.morin.1998@free.fr>
Message-ID: <14ff3ccbfd5ca3961cd9c04c078504c1d031125b.1417952276.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

freerdp installs a library that other packages may use, so
we must also install it to staging.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Samuel Martin <s.martin49@gmail.com>
---
 package/freerdp/freerdp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index df6b034..67f9960 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -11,6 +11,8 @@ FREERDP_DEPENDENCIES = openssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
+FREERDP_INSTALL_STAGING = YES
+
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF
 
 ifeq ($(BR2_PACKAGE_CUPS),y)
-- 
1.9.1
