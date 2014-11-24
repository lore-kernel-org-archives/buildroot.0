From: Pedro Aguilar <paguilar@paguilar.org>
Date: Mon, 24 Nov 2014 23:56:27 +0100
Subject: [Buildroot] [PATCH v5 1/4] libatomic_ops: Add host-libatomic_ops
In-Reply-To: <1416869790-12988-1-git-send-email-paguilar@paguilar.org>
References: <1416869790-12988-1-git-send-email-paguilar@paguilar.org>
Message-ID: <1416869790-12988-2-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-libatomic_ops is needed by host-bdwgc that is needed
in turn by guile.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

---
Changes v1 -> v2:
- Add host-libatomic_ops (suggested by Yann Morin)

---
 package/libatomic_ops/libatomic_ops.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index d473901..6a26775 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -20,3 +20,4 @@ LIBATOMIC_OPS_LICENSE_FILES = doc/LICENSING.txt COPYING
 LIBATOMIC_OPS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.9.1
