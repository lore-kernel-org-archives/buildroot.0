From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 2 Jul 2015 17:52:13 +0200
Subject: [Buildroot] [PATCH] valgrind: install to staging
Message-ID: <1435852333-19317-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is necessary for some packages depending on valgrind, such as
libdrm which will fail with an error like this one:

checking for VALGRIND... no
checking whether to enable Valgrind support... configure: error:
Valgrind support required but not present
package/pkg-generic.mk:146: recipe for target
'/br/output/build/libdrm-2.4.62/.stamp_configured' failed

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/valgrind/valgrind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index cfce8da..f8f205e 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -11,6 +11,7 @@ VALGRIND_LICENSE = GPLv2 GFDLv1.2
 VALGRIND_LICENSE_FILES = COPYING COPYING.DOCS
 VALGRIND_CONF_OPTS = --disable-tls
 VALGRIND_AUTORECONF = YES
+VALGRIND_INSTALL_STAGING = YES
 
 # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
 # host tuple to determine whether it's being built for ARMv7 or
-- 
2.3.6
