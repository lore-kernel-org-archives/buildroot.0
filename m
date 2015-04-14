From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 10:12:24 +0200
Subject: [Buildroot] [git commit] pkg-kconfig: declare phony targets as such
Message-ID: <20150414081954.C6A327F9E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f1e843864f89b58f806af371e0a09b1c219c522e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like the previous commit did for the pkg-generic infrastructure,
this commit improves the pkg-kconfig infrastructure to declare its
custom <pkg>-<something> targets as PHONY.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-kconfig.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index fd9f19d..8361064 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -100,6 +100,12 @@ $(1)-update-defconfig: $(1)-savedefconfig
 
 endif # package enabled
 
+.PHONY: \
+	$(1)-update-config \
+	$(1)-update-defconfig \
+	$(1)-savedefconfig \
+	$$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
+
 endef # inner-kconfig-package
 
 ################################################################################
