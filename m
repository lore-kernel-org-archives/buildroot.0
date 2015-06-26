From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 26 Jun 2015 20:41:50 +0200
Subject: [Buildroot] [PATCH] enlightment: xtensa workaround no longer
	required
Message-ID: <20150626184150.GA26274@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the update to uClibc-ng 1.0.3, this is no longer needed,
as the problem is fixed upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/enlightenment/enlightenment.mk |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index ac15642..ddebe06 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -34,11 +34,6 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_powerpc)$(BR2_sparc),yy)
 ENLIGHTENMENT_CONF_ENV += ac_cv_header_sys_ptrace_h=no
 endif
 
-# uClibc-ng has an old incomplete sys/ptrace.h for xtensa
-ifeq ($(BR2_UCLIBC_VERSION_NG)$(BR2_xtensa),yy)
-ENLIGHTENMENT_CONF_ENV += ac_cv_header_sys_ptrace_h=no
-endif
-
 # alsa backend needs mixer support
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
 ENLIGHTENMENT_DEPENDENCIES += alsa-lib
-- 
1.7.10.4
