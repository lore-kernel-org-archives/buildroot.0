From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 15:11:01 +0200
Subject: [Buildroot] [git commit] boot/mxs-bootlets: do not check hash of
	custom tarball
Message-ID: <20150502131735.76B8A81770@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cfea5518dd387432f60c18764eb750e38ab39de7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/mxs-bootlets/mxs-bootlets.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
index 9b6bd7a..17af6dc 100644
--- a/boot/mxs-bootlets/mxs-bootlets.mk
+++ b/boot/mxs-bootlets/mxs-bootlets.mk
@@ -8,6 +8,7 @@ ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL),y)
 MXS_BOOTLETS_TARBALL = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL))
 MXS_BOOTLETS_SITE = $(patsubst %/,%,$(dir $(MXS_BOOTLETS_TARBALL)))
 MXS_BOOTLETS_SOURCE = $(notdir $(MXS_BOOTLETS_TARBALL))
+BR_NO_CHECK_HASH_FOR += $(MXS_BOOTLETS_SOURCE)
 else ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT),y)
 MXS_BOOTLETS_SITE = $(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL)
 MXS_BOOTLETS_SITE_METHOD = git
