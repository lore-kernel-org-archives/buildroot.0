From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 15 Jul 2016 14:43:26 +0200
Subject: [Buildroot] [PATCH] package/libgpg-error: disable tests
Message-ID: <1468586606-31578-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tests are not usefull on an embedded device.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
2.7.4
