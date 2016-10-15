From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Oct 2016 10:15:53 +0200
Subject: [Buildroot] [PATCH 1/2] core/legal-info: save empty string when no
	license file
In-Reply-To: <cover.1476519329.git.yann.morin.1998@free.fr>
References: <cover.1476519329.git.yann.morin.1998@free.fr>
Message-ID: <4fdb0d67c86204e0a3048df9eaa86f9da98a4d12.1476519329.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is stored in the manifest file; it is perfectly possible to have
empty fields in there.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 68ead3d..92cc565 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -779,7 +779,6 @@ endif
 ifneq ($$($(2)_LICENSE_FILES),)
 $(2)_MANIFEST_LICENSE_FILES = $$($(2)_LICENSE_FILES)
 endif
-$(2)_MANIFEST_LICENSE_FILES ?= not saved
 
 # We need to extract and patch a package to be able to retrieve its
 # license files (if any) and the list of patches applied to it (if
-- 
2.7.4
