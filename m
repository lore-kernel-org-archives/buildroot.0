From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:07:10 +0100
Subject: [Buildroot] [PATCH 14/16] mxs-bootlets: exclude from hash when
	downloading from git
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-15-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we will enable hash checks for git downloads soon, the hash check
for the custom git download should be disabled.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
Since mxs-bootlets is simpler, it is easier to do the exclusion
explicitly for these two cases, and not use the more generic approach
like for linux and uboot.
---
 boot/mxs-bootlets/mxs-bootlets.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index 17af6dc158..c7dd534ec0 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -13,6 +13,7 @@ else ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT),y)
 MXS_BOOTLETS_SITE = $(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL)
 MXS_BOOTLETS_SITE_METHOD = git
 MXS_BOOTLETS_VERSION = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_VERSION))
+BR_NO_CHECK_HASH_FOR += $(MXS_BOOTLETS_SOURCE)
 else
 MXS_BOOTLETS_VERSION = 10.12.01
 MXS_BOOTLETS_SITE = http://download.ossystems.com.br/bsp/freescale/source
-- 
2.11.0
