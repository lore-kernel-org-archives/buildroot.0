From: Spenser Gilliland <spenser@gillilanding.com>
Date: Thu, 26 Sep 2013 18:21:47 -0500
Subject: [Buildroot] [PATCH v3 04/11] libdrm: remove x11 dependency.
In-Reply-To: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
References: <1380237714-2470-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1380237714-2470-5-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/libdrm/Config.in |    3 +--
 package/libdrm/libdrm.mk |    3 +++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 533e985..d67a6c2 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_LIBDRM
 	bool "libdrm"
-	select BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
-	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBPTHREAD_STUBS
 	depends on BR2_LARGEFILE
 	help
 	  Direct Rendering Manager
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index da3a87c..f9438cd 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -19,6 +19,9 @@ LIBDRM_CONF_OPT = \
 	--disable-cairo-tests \
 	--disable-manpages
 
+LIBDRM_CONF_ENV = \
+	LIBS="-lrt -lpthread"
+
 ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
 LIBDRM_CONF_OPT += --enable-intel
 LIBDRM_DEPENDENCIES += libatomic_ops xlib_libpciaccess
-- 
1.7.1
