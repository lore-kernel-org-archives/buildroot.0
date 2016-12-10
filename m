From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 10 Dec 2016 16:50:46 +0100
Subject: [Buildroot] [PATCH] package/enlightenment: remove uClibc (legacy)
	workaround
Message-ID: <1481385046-5643-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Buildroot doesn't support uClibc (legacy) since 2016.02 release, so
this workaround is not needed anymore.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 01448ee..7037afe 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -30,11 +30,6 @@ else
 ENLIGHTENMENT_CONF_OPTS += --disable-systemd
 endif
 
-# uClibc has an old incomplete sys/ptrace.h for powerpc & sparc
-ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_powerpc)$(BR2_sparc),yy)
-ENLIGHTENMENT_CONF_ENV += ac_cv_header_sys_ptrace_h=no
-endif
-
 # alsa backend needs mixer support
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER),yy)
 ENLIGHTENMENT_DEPENDENCIES += alsa-lib
-- 
2.5.5
