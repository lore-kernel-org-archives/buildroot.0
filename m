From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 May 2014 21:42:41 +0300
Subject: [Buildroot] [PATCH] libunwind: depend on libatomic_ops when
	available
Message-ID: <85ff00479bda328ec3fa5dd9c7d7f3d0dce4d77d.1400179361.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libunwind/libunwind.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk
index 48dd0ec5bb08..a75a88848be9 100644
--- a/package/libunwind/libunwind.mk
+++ b/package/libunwind/libunwind.mk
@@ -11,4 +11,8 @@ LIBUNWIND_LICENSE_FILES = COPYING
 LIBUNWIND_LICENSE = MIT
 LIBUNWIND_AUTORECONF = YES
 
+ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
+LIBUNWIND_DEPENDENCIES = libatomic_ops
+endif
+
 $(eval $(autotools-package))
-- 
2.0.0.rc0
