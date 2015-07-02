From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 23:42:28 +0200
Subject: [Buildroot] [git commit] valgrind: install to staging
Message-ID: <20150702214247.1A028805F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=20bf3fd33ef93b3c6164f93c36ea24f913f9bfd6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is necessary for some packages depending on valgrind, such as
libdrm which will fail with an error like this one:

checking for VALGRIND... no
checking whether to enable Valgrind support... configure: error:
Valgrind support required but not present
package/pkg-generic.mk:146: recipe for target
'/br/output/build/libdrm-2.4.62/.stamp_configured' failed

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/valgrind/valgrind.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
