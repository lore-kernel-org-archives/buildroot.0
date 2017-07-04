From: Romain Naour <romain.naour@smile.fr>
Date: Wed,  5 Jul 2017 01:08:55 +0200
Subject: [Buildroot] [PATCH 1/3] package/kvazaar: add host-pkgconf dependency
Message-ID: <20170704230857.7916-1-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The build system use PKG_CHECK_MODULES.

checking pkg-config is at least version 0.9.0... ./configure: line 16886: output/host/usr/bin/pkg-config: No such file or directory
no

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/kvazaar/kvazaar.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kvazaar/kvazaar.mk b/package/kvazaar/kvazaar.mk
index 30b8bda..f9149a7 100644
--- a/package/kvazaar/kvazaar.mk
+++ b/package/kvazaar/kvazaar.mk
@@ -10,6 +10,7 @@ KVAZAAR_LICENSE = LGPL-2.1+
 KVAZAAR_LICENSE_FILES = COPYING
 KVAZAAR_AUTORECONF = YES
 KVAZAAR_INSTALL_STAGING = YES
+KVAZAAR_DEPENDENCIES = host-pkgconf
 KVAZAAR_CONF_OPTS = --without-cryptopp
 
 $(eval $(autotools-package))
-- 
2.9.4
