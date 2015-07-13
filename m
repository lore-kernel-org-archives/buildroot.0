From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 23:00:11 +0200
Subject: [Buildroot] [PATCH 4/4] pkg-generic: skeleton: Add dependency to all
In-Reply-To: <1436821211-4446-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1436821211-4446-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1436821211-4446-4-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All packages must depends on skeleton as it's the one that will create
the $(TARGET_DIR)

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ebaa48f..83d0c33 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -405,10 +405,11 @@ $(2)_REDISTRIBUTE		?= YES
 $(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES
 
 ifeq ($(4),host)
-$(2)_DEPENDENCIES ?= $$(filter-out  host-toolchain $(1),\
+$(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
 	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
 endif
 ifeq ($(4),target)
+$(2)_DEPENDENCIES += skeleton
 ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
 $(2)_DEPENDENCIES += toolchain
 endif
-- 
2.1.4
