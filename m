From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:37:45 +0200
Subject: [Buildroot] [PATCHv2 01/21] pkg-kconfig: declare phony targets as
	such
In-Reply-To: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1428856685-4403-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like the previous commit did for the pkg-generic infrastructure,
this commit improves the pkg-kconfig infrastructure to declare its
custom <pkg>-<something> targets as PHONY.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-kconfig.mk | 6 ++++++
 1 file changed, 6 insertions(+)

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
-- 
2.1.0
