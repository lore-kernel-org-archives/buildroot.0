From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Dec 2016 10:11:59 +0100
Subject: [Buildroot] [git commit] linux-headers: cleanup dead custom-local
	option
Message-ID: <20161220091252.56D6480AD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05125810b5d21d92ee12c386b5fcb41a5383f6b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The option `BR2_LINUX_KERNEL_CUSTOM_LOCAL` no longer exists (see commit
e782cd5b1bc231dda527d5d0a04e6a338669b92c [1]); removing the option. Note
that this legacy option has already been handled (Config.in.legacy) in
the mentioned commit.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
