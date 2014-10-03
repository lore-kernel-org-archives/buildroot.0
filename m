From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  3 Oct 2014 19:01:40 +0200
Subject: [Buildroot] [PATCH 06/25 v7] docs/manual: simplify generation
	dependencies
In-Reply-To: <cover.1412355549.git.yann.morin.1998@free.fr>
References: <cover.1412355549.git.yann.morin.1998@free.fr>
Message-ID: <f1d49415a06d0962ef73a445f65610c8e002a6d3.1412355549.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The document's main file is already part of MANUAL_SOURCES, so no need
to explicitly depend on it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index dd6f0ea..56dff56 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -98,8 +98,7 @@ $$(O)/docs/$(1)/$(1).$(4):
 		to make through the command line: \
 		'PATH=/path/to/custom-xsltproc/bin:$$$${PATH} make manual-pdf')
 else
-$$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
-			   $$($$(call UPPERCASE,$(1))_SOURCES) \
+$$(O)/docs/$(1)/$(1).$(4): $$($$(call UPPERCASE,$(1))_SOURCES) \
 			   manual-check-dependencies \
 			   manual-check-dependencies-$(3) \
 			   manual-prepare-sources
-- 
1.9.1
