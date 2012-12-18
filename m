From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Dec 2012 09:08:22 -0300
Subject: [Buildroot] [PATCH 3/3] libidn: bump to version 1.26
In-Reply-To: <1355832502-3907-1-git-send-email-gustavo@zacarias.com.ar>
References: <1355832502-3907-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1355832502-3907-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libidn/libidn.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/libidn/libidn.mk b/package/libidn/libidn.mk
index b06b1ec..39f3973 100644
--- a/package/libidn/libidn.mk
+++ b/package/libidn/libidn.mk
@@ -4,12 +4,14 @@
 #
 #############################################################
 
-LIBIDN_VERSION = 1.25
+LIBIDN_VERSION = 1.26
 LIBIDN_SITE = $(BR2_GNU_MIRROR)/libidn
 LIBIDN_INSTALL_STAGING = YES
 LIBIDN_CONF_ENV = EMACS="no"
 LIBIDN_CONF_OPT = --disable-java --enable-csharp=no
 LIBIDN_DEPENDENCIES = host-pkgconf $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+LIBIDN_LICENSE = GPLv2+ GPLv3+ LGPLv3+
+LIBIDN_LICENSE_FILES = COPYINGv2 COPYINGv3 COPYING.LESSERv3
 
 define LIBIDN_REMOVE_BINARY
 	rm -f $(TARGET_DIR)/usr/bin/idn
-- 
1.7.8.6
