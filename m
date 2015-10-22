From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Oct 2015 22:34:12 +0200
Subject: [Buildroot] [PATCH 17/21 v2] core: br2-external trees without ID
	can't be used with other trees
In-Reply-To: <cover.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <b782f8f3bf189cef3f173e129394f29f8fb26b0f.1445545973.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Inform users who use a single br2-external tree without an ID that this
br2-external tree will not be useable in conjunction with other
br2-external trees.

This is only an informative message, not even a warning, since we do
want to continue to accept that situation for the forseeable future.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 141b173..b827323 100644
--- a/Makefile
+++ b/Makefile
@@ -188,6 +188,9 @@ define BR2_EXTERNAL_VALIDATE
     ifeq ($(BR2_EXTERNAL_NEED_ID),strict)
       $$(error BR2_EXTERNAL='$(1)' has no ID (in file 'external.id'),\
                mandatory to use more than one br2-external tree at once)
+    else
+      $$(info BR2_EXTERNAL='$(1)' has no ID (in file 'external.id');\
+              it will not be useable with other br2-external trees.)
     endif # BR2_EXTERNAL_NEED_ID strict
   endif # No ID
   ifneq ($$(filter $$(_BR_EXT_ID),$$(BR_EXTERNAL_IDS)),)
-- 
1.9.1
