From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Dec 2012 08:52:36 -0300
Subject: [Buildroot] [PATCH 2/2] gnutls: fix legal-info
In-Reply-To: <1356781956-19977-1-git-send-email-gustavo@zacarias.com.ar>
References: <1356781956-19977-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1356781956-19977-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index e27c1a3..0166a74 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -8,7 +8,7 @@ GNUTLS_VERSION = 3.1.5
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = $(BR2_GNU_MIRROR)/gnutls
 GNUTLS_LICENSE = GPLv3+ LGPLv3
-GNUTLS_LICENSE_FILES = COPYING lib/COPYING
+GNUTLS_LICENSE_FILES = COPYING COPYING.LESSER
 GNUTLS_DEPENDENCIES = host-pkgconf nettle $(if $(BR2_PACKAGE_ZLIB),zlib)
 GNUTLS_CONF_OPT = --with-libnettle-prefix=$(STAGING_DIR)/usr --disable-rpath
 GNUTLS_CONF_ENV = gl_cv_socket_ipv6=$(if $(BR2_INET_IPV6),yes,no) \
-- 
1.7.8.6
