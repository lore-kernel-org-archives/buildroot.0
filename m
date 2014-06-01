From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 19:40:36 +0200
Subject: [Buildroot] [PATCH 02/12] pkg-infra: also set PKGDIR for the
	download step
In-Reply-To: <cover.1401644349.git.yann.morin.1998@free.fr>
References: <cover.1401644349.git.yann.morin.1998@free.fr>
Message-ID: <3965ca16b80e3ae311350ffdaf717fc802a5af4c.1401644349.git.yann.morin.1998@free.fr>
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
index 5116ed9..b97e43c 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -571,6 +571,7 @@ $$($(2)_TARGET_PATCH):			RAWNAME=$(patsubst host-%,%,$(1))
 $$($(2)_TARGET_PATCH):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_EXTRACT):		PKG=$(2)
 $$($(2)_TARGET_SOURCE):			PKG=$(2)
+$$($(2)_TARGET_SOURCE):			PKGDIR=$(pkgdir)
 $$($(2)_TARGET_DIRCLEAN):		PKG=$(2)
 
 # Compute the name of the Kconfig option that correspond to the
-- 
1.8.3.2
