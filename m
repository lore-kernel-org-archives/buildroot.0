From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Oct 2013 01:11:26 +0200
Subject: [Buildroot] [PATCH 2/4] pkg-infra: add hook to log timing of steps
In-Reply-To: <cover.1381705600.git.yann.morin.1998@free.fr>
References: <cover.1381705600.git.yann.morin.1998@free.fr>
Message-ID: <5e5e05deee119ee4f15b0b9f7b42ba12d9ce82e3.1381705600.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index c4c7f8a..162c9ed 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -36,6 +36,12 @@ define step_end
 	$(foreach hook,$(STEP_HOOKS),$(call $(hook),end,$(1));)
 endef
 
+# Time steps
+define step_time
+	printf "%s:%-5.5s:%-20.20s: %s\n" "$$(date +%s)" "$(1)" "$(2)" "$($(PKG)_NAME)" >>"$(BUILD_DIR)/build.log"
+endef
+STEP_HOOKS += step_time
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
-- 
1.8.1.2
