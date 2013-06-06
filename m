From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  6 Jun 2013 11:42:18 -0300
Subject: [Buildroot] [PATCH] p11-kit: fix __progname build failure
Message-ID: <1370529738-5275-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Even though we've got UCLIBC_HAS___PROGNAME=y in our internal toolchains
the build seems to fail under some circumstances.
Since program_invocation_short_name is equally as useful just disable
__progname usage. Fixes:
http://autobuild.buildroot.net/results/cc8/cc861f5a034a0922a90fb6f22835a1fe8205d497/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/p11-kit/p11-kit.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 89774dc..6cb81ee 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -10,7 +10,7 @@ P11_KIT_DEPENDENCIES = host-pkgconf libtasn1
 P11_KIT_INSTALL_STAGING = YES
 P11_KIT_CONF_OPT = --disable-static
 P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
-	ac_cv_have_decl___progname=yes
+	ac_cv_have_decl___progname=no
 P11_KIT_LICENSE = BSD-3c
 P11_KIT_LICENSE_FILES = COPYING
 
-- 
1.8.1.5
