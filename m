From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Wed, 21 Feb 2018 09:27:56 -0500
Subject: [Buildroot] [PATCH-FOR-NEXT v1 1/6] package: add libnpsr host
 package
In-Reply-To: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180221142801.28997-2-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/libnspr/Config.in.host | 10 ++++++++++
 package/libnspr/libnspr.mk     |  7 +++++++
 2 files changed, 17 insertions(+)
 create mode 100644 package/libnspr/Config.in.host

diff --git a/package/libnspr/Config.in.host b/package/libnspr/Config.in.host
new file mode 100644
index 0000000000..a80b55e122
--- /dev/null
+++ b/package/libnspr/Config.in.host
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_HOST_LIBNSPR
+	bool "host libnspr"
+	help
+	  NSPR is the Netscape Portable Runtime library which provides
+	  a platform-neutral API for system level and libc like
+	  functions. The library is used by the Mozilla project as well
+	  as others.
+
+	  http://www.mozilla.org/projects/nspr/
+
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 0c782ae309..c1662947f7 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -49,4 +49,11 @@ LIBNSPR_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) LIBRARY= install
 LIBNSPR_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LIBRARY= install
 endif
 
+ifeq ($(HOSTARCH),x86_64)
+HOST_LIBNSPR_CONF_OPTS += --enable-64bit
+else
+HOST_LIBNSPR_CONF_OPTS += --disable-64bit
+endif
+
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.16.1
