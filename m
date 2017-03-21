From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 21 Mar 2017 01:07:09 +0100
Subject: [Buildroot] [PATCH 13/16] at91bootstrap3: exclude from hash when
	downloading from git
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321000712.26500-14-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since we will enable hash checks for git downloads soon, the hash check
for the custom git download should be disabled.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 boot/at91bootstrap3/at91bootstrap3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 32732f4758..685be5bbd7 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -9,6 +9,7 @@ AT91BOOTSTRAP3_VERSION = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_VERSION))
 ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
 AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
 AT91BOOTSTRAP3_SITE_METHOD = git
+BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
 else
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
 endif
-- 
2.11.0
