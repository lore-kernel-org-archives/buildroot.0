From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Nov 2015 23:47:00 +0100
Subject: [Buildroot] [PATCH 05/21 RFC] core/pkg-virtual: ignore from
	legal-info output
In-Reply-To: <cover.1447713615.git.yann.morin.1998@free.fr>
References: <cover.1447713615.git.yann.morin.1998@free.fr>
Message-ID: <e3506e59aa801227a1e47ccace2ef664fdaf0eca.1447713615.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Virtual packages really have nothing to save for legal-info, so we just
ignore them.

Following patches will always extract-and-aptch non-ignored packages, so
we would potentially see spurious "extracting" and "patching" messages
on the console, which would be a bit strange. Ignoring virtual packages
will get us a cleaner log.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/pkg-virtual.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-virtual.mk b/package/pkg-virtual.mk
index 9c68b51..1471b95 100644
--- a/package/pkg-virtual.mk
+++ b/package/pkg-virtual.mk
@@ -57,6 +57,8 @@ endif
 # Add dependency against the provider
 $(2)_DEPENDENCIES += $$(call qstrip,$$(BR2_PACKAGE_PROVIDES_$(2)))
 
+$(2)_REDISTRIBUTE = IGNORE
+
 # Call the generic package infrastructure to generate the necessary
 # make targets
 $(call inner-generic-package,$(1),$(2),$(3),$(4))
-- 
1.9.1
