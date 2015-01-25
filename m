From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Jan 2015 23:37:08 +0100
Subject: [Buildroot] [PATCH 4/6 v4] package/freerdp: also install to staging
In-Reply-To: <cover.1422225347.git.yann.morin.1998@free.fr>
References: <cover.1422225347.git.yann.morin.1998@free.fr>
Message-ID: <b5467ee85c5467c665c4f1c07d6357e6976c72c1.1422225347.git.yann.morin.1998@free.fr>
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
index 742ced7..f0b6e92 100644
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
