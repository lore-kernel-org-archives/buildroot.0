From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 14 Jul 2021 10:53:45 +0200
Subject: [Buildroot] [PATCH 2/3] package/libmodsecurity: drop AC_CHECK_FILE
 workaround
In-Reply-To: <20210714085346.2464634-1-fontaine.fabrice@gmail.com>
References: <20210714085346.2464634-1-fontaine.fabrice@gmail.com>
Message-ID: <20210714085346.2464634-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop AC_CHECK_FILE workaround as it is not needed since version 3.0.4:
https://github.com/SpiderLabs/ModSecurity/commit/8af8cad90779a64af87d29b3a44f3ea2e0a270c2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmodsecurity/libmodsecurity.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index a84cd27b34..605f7eb03e 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -14,9 +14,6 @@ LIBMODSECURITY_CPE_ID_VENDOR = trustwave
 LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
 # 0002-test-for-uClinux-in-configure-script.patch
 LIBMODSECURITY_AUTORECONF = YES
-# libinjection uses AC_CHECK_FILE, not available in cross-compile
-LIBMODSECURITY_CONF_ENV = \
-	ac_cv_file_others_libinjection_src_libinjection_html5_c=yes
 
 LIBMODSECURITY_DEPENDENCIES = pcre
 LIBMODSECURITY_CONF_OPTS = \
-- 
2.30.2
