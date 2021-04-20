From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 20 Apr 2021 15:11:32 -0500
Subject: [Buildroot] [PATCH 11/25] package/libnl: add _CPE_ID_VENDOR
In-Reply-To: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
References: <20210420201146.42858-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210420201146.42858-11-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:libnl_project:libnl:* is a valid CPE identifier for this package:

 https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:libnl_project:libnl

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
---
 package/libnl/libnl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 795dfc2316..1deab7f8cb 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -10,6 +10,7 @@ LIBNL_LICENSE = LGPL-2.1+
 LIBNL_LICENSE_FILES = COPYING
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison host-flex host-pkgconf
+LIBNL_CPE_ID_VENDOR = libnl_project
 
 ifeq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
 LIBNL_CONF_OPTS += --enable-cli
-- 
2.17.1
