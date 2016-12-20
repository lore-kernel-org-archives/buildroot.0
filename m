From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 19 Dec 2016 19:03:51 -0500
Subject: [Buildroot] [PATCH 2/2] linux-headers: cleanup dead custom-local
	option
In-Reply-To: <20161220000351.8312-1-james.knight@rockwellcollins.com>
References: <20161220000351.8312-1-james.knight@rockwellcollins.com>
Message-ID: <20161220000351.8312-2-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option `BR2_LINUX_KERNEL_CUSTOM_LOCAL` no longer exists (see commit
e782cd5b1bc231dda527d5d0a04e6a338669b92c [1]); removing the option. Note
that this legacy option has already been handled (Config.in.legacy) in
the mentioned commit.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/linux-headers/linux-headers.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 0900778..8f339cf 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -17,9 +17,6 @@ LINUX_HEADERS_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
 LINUX_HEADERS_SITE = $(patsubst %/,%,$(dir $(LINUX_HEADERS_TARBALL)))
 LINUX_HEADERS_SOURCE = $(notdir $(LINUX_HEADERS_TARBALL))
 BR_NO_CHECK_HASH_FOR += $(LINUX_HEADERS_SOURCE)
-else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
-LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
-LINUX_HEADERS_SITE_METHOD = local
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
 LINUX_HEADERS_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_HEADERS_SITE_METHOD = git
-- 
2.8.4.windows.1
