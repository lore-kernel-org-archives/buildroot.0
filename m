From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 19:09:52 +0200
Subject: [Buildroot] [PATCH 06/10] package/freerdp: also install to staging
In-Reply-To: <cover.1411232859.git.yann.morin.1998@free.fr>
References: <cover.1411232859.git.yann.morin.1998@free.fr>
Message-ID: <f423522587d066b65859746b8324cd714d974a1f.1411232859.git.yann.morin.1998@free.fr>
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
index 486a611..3dc257b 100644
--- a/package/freerdp/freerdp.mk
+++ b/package/freerdp/freerdp.mk
@@ -11,6 +11,8 @@ FREERDP_DEPENDENCIES = openssl zlib
 FREERDP_LICENSE = Apache-2.0
 FREERDP_LICENSE_FILES = LICENSE
 
+FREERDP_INSTALL_STAGING = YES
+
 FREERDP_CONF_OPT = -DWITH_MANPAGES=OFF
 
 ifeq ($(BR2_PACKAGE_FREERDP_NEEDS_XLIBS),y)
-- 
1.9.1
