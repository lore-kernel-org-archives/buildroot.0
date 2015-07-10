From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jul 2015 20:31:47 +0200
Subject: [Buildroot] [git commit] enlightment: xtensa workaround no longer
	required
Message-ID: <20150710183153.F37977FF1B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b056944f5878304f51af3e9edb6d596f24fc370
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the update to uClibc-ng 1.0.3, this is no longer needed,
as the problem is fixed upstream.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/enlightenment/enlightenment.mk |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

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
