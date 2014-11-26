From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 21:51:41 +0100
Subject: [Buildroot] [git commit branch/next] libatomic_ops: Add
	host-libatomic_ops
Message-ID: <20141126205154.7C8077FF25@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7522023a845f2bb20999c49eb52f1bb4d0aa22ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The host-libatomic_ops is needed by host-bdwgc that is needed
in turn by guile.

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libatomic_ops/libatomic_ops.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
index d473901..6a26775 100644
--- a/package/libatomic_ops/libatomic_ops.mk
+++ b/package/libatomic_ops/libatomic_ops.mk
@@ -20,3 +20,4 @@ LIBATOMIC_OPS_LICENSE_FILES = doc/LICENSING.txt COPYING
 LIBATOMIC_OPS_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
