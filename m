From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 29 Apr 2015 00:40:02 +0200
Subject: [Buildroot] [PATCH 5/7] boot/mxs-bootlets: do not check hash of
	custom tarball
In-Reply-To: <cover.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <bc53db66cfabb6adc0571eb614866bfdb68737ec.1430260630.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 boot/mxs-bootlets/mxs-bootlets.mk | 1 +
 1 file changed, 1 insertion(+)

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
-- 
1.9.1
