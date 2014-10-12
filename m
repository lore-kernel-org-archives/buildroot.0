From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:26 +0200
Subject: [Buildroot] [git commit] docs/manual: simplify generation
	dependencies
Message-ID: <20141012072419.95E2BB1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3243609fd026bc499c23529dd18b6e12021d5bb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The document's main file is already part of MANUAL_SOURCES, so no need
to explicitly depend on it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/manual.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

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
