From: =?utf-8?q?Ra=C3=BAl_S=C3=A1nchez_Siles?= <rasasi78@gmail.com>
Date: Thu, 6 Sep 2012 17:37:32 +0200
Subject: [Buildroot] [PATCH] Depend autotools targets on host-ccache when
	BR2_CCACHE is enabled.
Message-ID: <201209061737.32826.rasasi78@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In this case, autotools targets rely on $(TARGET_CONFIGURE_OPTS) which includes
ccached compiler.

Signed-off-by: Ra?l S?nchez Siles <rasasi78@gmail.com>
---
 package/pkg-autotools.mk |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 785daab..e858ffc 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -200,6 +200,10 @@ $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
 $(2)_DEPENDENCIES += host-automake host-autoconf host-libtool
 endif
 
+ifeq ($(BR2_CCACHE),y)
+$(2)_DEPENDENCIES += host-ccache
+endif
+
 #
 # Build step. Only define it if not already defined by the package .mk
 # file.
-- 
1.7.10.4
