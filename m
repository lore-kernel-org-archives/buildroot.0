From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 14:51:03 +0200
Subject: [Buildroot] [git commit] package/libgpg-error: disable tests
Message-ID: <20160715125224.37B1482257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5213fb332eea5e567bd075e0a2cb65723407490d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tests are not usefull on an embedded device.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libgpg-error/libgpg-error.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 4acd32c..e081b36 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -18,4 +18,6 @@ define LIBGPG_ERROR_FIX_CROSS_COMPILATION
 endef
 LIBGPG_ERROR_PRE_CONFIGURE_HOOKS += LIBGPG_ERROR_FIX_CROSS_COMPILATION
 
+LIBGPG_ERROR_CONF_OPTS = --disable-tests
+
 $(eval $(autotools-package))
