From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 6 Jun 2013 16:50:01 +0200
Subject: [Buildroot] [git commit] p11-kit: fix __progname build failure
Message-ID: <20130606145220.B19219A987@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9c778689c4d443705f69ab0477747adc54aa5dbc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Even though we've got UCLIBC_HAS___PROGNAME=y in our internal toolchains
the build seems to fail under some circumstances.
Since program_invocation_short_name is equally as useful just disable
__progname usage. Fixes:
http://autobuild.buildroot.net/results/cc8/cc861f5a034a0922a90fb6f22835a1fe8205d497/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/p11-kit/p11-kit.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 
