From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 30 Mar 2019 15:49:47 +0100
Subject: [Buildroot] [PATCH v2,
 8/8] package/rpm: add optional zstd dependency
In-Reply-To: <20190330144947.27638-1-fontaine.fabrice@gmail.com>
References: <20190330144947.27638-1-fontaine.fabrice@gmail.com>
Message-ID: <20190330144947.27638-8-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zstd support has been in version 4.14.0 and
https://github.com/rpm-software-management/rpm/commit/3684424fe297c996bb05bb64631336fa2903df12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Put bump as the first patch in the serie

 package/rpm/rpm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 626e6bf94c..5fd7256618 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -92,6 +92,13 @@ ifeq ($(BR2_PACKAGE_BINUTILS),y)
 RPM_DEPENDENCIES += binutils
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+RPM_DEPENDENCIES += zstd
+RPM_CONF_OPTS += --enable-zstd
+else
+RPM_CONF_OPTS += --disable-zstd
+endif
+
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
-- 
2.20.1
