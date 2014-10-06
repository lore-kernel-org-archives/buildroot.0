From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  7 Oct 2014 00:35:11 +0200
Subject: [Buildroot] [PATCH 5/7 v2] package/freerdp: also install to staging
In-Reply-To: <cover.1412634775.git.yann.morin.1998@free.fr>
References: <cover.1412634775.git.yann.morin.1998@free.fr>
Message-ID: <9a8e25046eacb4cdc4cacc5d21817e08762b008e.1412634775.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

freerdp installs a library that other packages may use, so
we must also install it to staging.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/freerdp/freerdp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
index 594bab3..ea590d1 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -11,6 +11,8 @@ FREERDP_DEPENDENCIES = openssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
+FREERDP_INSTALL_STAGING = YES
+
 FREERDP_CONF_OPTS = -DWITH_MANPAGES=OFF
 
 ifeq ($(BR2_PACKAGE_FREERDP_NEEDS_XLIBS),y)
-- 
1.9.1
