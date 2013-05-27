From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 May 2013 01:01:01 +0200
Subject: [Buildroot] [PATCH 3/6] binutils: apply post-patch hook on both the
	host and target builds
In-Reply-To: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369695664-5670-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a Xtensa specific patch needs to be applied, it should be applied
both when doing the target and the host build.

This change is part of the effort to remove the differences between
host and target post-extract and post-patch hooks, that are
problematic for the out-of-tree support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/binutils/binutils.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 081be6a..a2c4150 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -81,6 +81,7 @@ define BINUTILS_XTENSA_PRE_PATCH
 	tar xf $(BR2_XTENSA_OVERLAY_DIR)/xtensa_$(XTENSA_CORE_NAME).tar \
 		-C $(@D) --strip-components=1 binutils
 endef
+BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 HOST_BINUTILS_PRE_PATCH_HOOKS += BINUTILS_XTENSA_PRE_PATCH
 endif
 
-- 
1.7.9.5
