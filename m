From: Gilles Talis <gilles.talis@gmail.com>
Date: Wed, 15 May 2013 14:47:32 -0700
Subject: [Buildroot] [PATCH 2/2] libeXosip2: disable multi-thread support
	for toolchains without threads
In-Reply-To: <1368654452-16294-1-git-send-email-gilles.talis@gmail.com>
References: <1368654452-16294-1-git-send-email-gilles.talis@gmail.com>
Message-ID: <1368654452-16294-2-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also added license information

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libeXosip2/libeXosip2.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/libeXosip2/libeXosip2.mk b/package/libeXosip2/libeXosip2.mk
index d72ab61..7fef1a6 100644
--- a/package/libeXosip2/libeXosip2.mk
+++ b/package/libeXosip2/libeXosip2.mk
@@ -7,6 +7,8 @@
 LIBEXOSIP2_VERSION = 3.6.0
 LIBEXOSIP2_SITE = http://download.savannah.gnu.org/releases/exosip/
 LIBEXOSIP2_INSTALL_STAGING = YES
+LIBEXOSIP2_LICENSE = GPLv2+
+LIBEXOSIP2_LICENSE_FILES = COPYING
 
 LIBEXOSIP2_DEPENDENCIES = host-pkgconf libosip2
 
@@ -17,4 +19,7 @@ else
 LIBEXOSIP2_CONF_OPT += --disable-openssl
 endif
 
+LIBEXOSIP2_CONF_OPT += \
+	--enable-mt=$(if $(BR2_TOOLCHAIN_HAS_THREADS),yes,no)
+
 $(eval $(autotools-package))
-- 
1.7.4.1
