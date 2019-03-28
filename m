From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Mar 2019 21:28:48 +0100
Subject: [Buildroot] [PATCH 2/8] package/rpm: add optional xz dependency
In-Reply-To: <20190328202854.26337-1-fontaine.fabrice@gmail.com>
References: <20190328202854.26337-1-fontaine.fabrice@gmail.com>
Message-ID: <20190328202854.26337-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is not --{disable,enable}-lzma option

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rpm/rpm.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index d5a808aaed..8bf08b47a1 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -14,6 +14,7 @@ RPM_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_BZIP2),bzip2) \
 	file \
 	popt \
+	$(if $(BR2_PACKAGE_XZ),xz) \
 	zlib \
 	$(TARGET_NLS_DEPENDENCIES)
 RPM_LICENSE = GPL-2.0 or LGPL-2.0 (library only)
-- 
2.20.1
