From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jun 2014 22:43:03 +0200
Subject: [Buildroot] [PATCH 02/12] pkg-infra: also set PKGDIR for the
	download step
In-Reply-To: <cover.1402260012.git.yann.morin.1998@free.fr>
References: <cover.1402260012.git.yann.morin.1998@free.fr>
Message-ID: <3196e95bc7be1dfe21bcae938ecad4c70c92f84e.1402260012.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

This will be needed to get the hash file, to check the
downloaded files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index ccd7f3b..5293a7a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -574,6 +574,7 @@ $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
+$$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 
 # Compute the name of the Kconfig option that correspond to the
-- 
1.8.3.2
