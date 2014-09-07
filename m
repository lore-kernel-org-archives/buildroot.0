From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  8 Sep 2014 01:39:06 +0200
Subject: [Buildroot] [PATCH 07/18 v4] docs/manual: simplify generation
	dependencies
In-Reply-To: <cover.1410132603.git.yann.morin.1998@free.fr>
References: <cover.1410132603.git.yann.morin.1998@free.fr>
Message-ID: <b9faea4d154763b88f932b62c7bafb1256c37887.1410132603.git.yann.morin.1998@free.fr>
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
---
 docs/manual/manual.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index bae517b..135ab3d 100644
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
