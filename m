From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 8 Jun 2019 22:59:32 +0200
Subject: [Buildroot] [git commit] linux/linux-ext-xenomai: add check-package
 exclusion comment
Message-ID: <20190608205915.BF9428D1FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=571f692631ecdf041ea7efdd306a1c37d16d571b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

check-package wrongly warns against LINUX_EXTRA_DOWNLOADS var:

 linux/linux-ext-xenomai.mk:15: possible typo: LINUX_EXTRA_DOWNLOADS -> *XENOMAI*
 34 lines processed
 1 warnings generated

Add a TypoInPackageVariable exclusion comment to remove this warning.

Signed-off-by: S??bastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/linux-ext-xenomai.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux/linux-ext-xenomai.mk b/linux/linux-ext-xenomai.mk
index c7c112dac3..5ec6891bbf 100644
--- a/linux/linux-ext-xenomai.mk
+++ b/linux/linux-ext-xenomai.mk
@@ -12,6 +12,7 @@ XENOMAI_ADEOS_PATCH = $(call qstrip,$(BR2_LINUX_KERNEL_EXT_XENOMAI_ADEOS_PATCH))
 ifneq ($(filter ftp://% http://% https://%,$(XENOMAI_ADEOS_PATCH)),)
 XENOMAI_ADEOS_PATCH_NAME = $(notdir $(XENOMAI_ADEOS_PATCH))
 XENOMAI_ADEOS_PATCH_PATH = $(LINUX_DL_DIR)/$(XENOMAI_ADEOS_PATCH_NAME)
+# check-package TypoInPackageVariable
 LINUX_EXTRA_DOWNLOADS += $(XENOMAI_ADEOS_PATCH)
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_ADEOS_PATCH_NAME)
 else
