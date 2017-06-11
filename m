From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Jun 2017 14:27:48 +0200
Subject: [Buildroot] [git commit] mxs-bootlets: exclude from hash when
	downloading from git
Message-ID: <20170611123752.CEA91800FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f9c31f4d4c6e579474186b477e1c11c60aa5e3b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we will enable hash checks for git downloads soon, the hash check
for the custom git download should be disabled.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/mxs-bootlets/mxs-bootlets.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index 1955a37..bdecf41 100644
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
