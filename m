From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 19:33:29 +0200
Subject: [Buildroot] [PATCH 15/35] pkg-kconfig: declare phony targets as such
In-Reply-To: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1427650429-9293-16-git-send-email-thomas.petazzoni@free-electrons.com>
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
 package/pkg-kconfig.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index 04ac37d..69e7dc5 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -100,6 +100,8 @@ $(1)-update-defconfig: $(1)-savedefconfig
 
 endif # package enabled
 
+.PHONY: $(1)-update-config $$(addprefix $(1)-,$$($(2)_KCONFIG_EDITORS))
+
 endef # inner-kconfig-package
 
 ################################################################################
-- 
2.1.0
