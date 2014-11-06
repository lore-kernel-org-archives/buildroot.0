From: Pedro Aguilar <paguilar@paguilar.org>
Date: Thu,  6 Nov 2014 22:48:03 +0100
Subject: [Buildroot] [PATCH v4 1/4] libatomic_ops: Add host-autotools-package
In-Reply-To: <1415310486-25904-1-git-send-email-paguilar@paguilar.org>
References: <1415310486-25904-1-git-send-email-paguilar@paguilar.org>
Message-ID: <1415310486-25904-2-git-send-email-paguilar@paguilar.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The host-libatomic_ops is needed by host-bdwgc that is needed
in turn by guile.

bdwgc bundles its own version of libatomic_ops, but it's prefered
to use the external one that is the default.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>

---
Changes v1 -> v2:
- Add host-libatomic_ops (suggested by Yann Morin)

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
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
