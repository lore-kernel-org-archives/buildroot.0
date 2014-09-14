From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Sep 2014 13:07:41 +0200
Subject: [Buildroot] [PATCH 07/23 v5] docs/manual: simplify generation
	dependencies
In-Reply-To: <cover.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <7dc3e2f0cf37f042723a473e1de04e5e432f7c75.1410692670.git.yann.morin.1998@free.fr>
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
