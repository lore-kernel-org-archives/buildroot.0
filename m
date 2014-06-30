From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Jul 2014 00:26:20 +0200
Subject: [Buildroot] [PATCH 02/14] pkg-infra: also set PKGDIR for the
	download step
In-Reply-To: <cover.1404167061.git.yann.morin.1998@free.fr>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
Message-ID: <ecaddb89ac198a88d1a678fee9b55c2c3b44bcca.1404167061.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This will be needed to get the hash file, to check the
downloaded files.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 54193d2..ab1f8d2 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -602,6 +602,7 @@ $$($(2)_TARGET_PATCH):			RAWNAME=$$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
+$$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 
 # Compute the name of the Kconfig option that correspond to the
-- 
1.9.1
