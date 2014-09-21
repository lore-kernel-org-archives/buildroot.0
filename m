From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 20:11:02 +0200
Subject: [Buildroot] [git commit] gendoc infra: cosmetic fixes
Message-ID: <20140921181109.941CD9D6E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64982ce4fa7c5131e90ea18ef761940435d8873a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- wrap lines to 80 characters
- fix space/tab mixup

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[yann.morin.1998 at free.fr: tested all but PDF]
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/manual.mk |   13 ++++++++-----
 1 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 8d401a2..136f725 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -70,8 +70,8 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 	$$(Q)mkdir -p $$(@D)/.build
 	$$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
 	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
-	        -D $$(@D) $$(@D)/.build/$(1).txt \
-	        --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)"
+		--asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)" \
+		-D $$(@D) $$(@D)/.build/$(1).txt
 	-$$(Q)rm -rf $$(@D)/.build
 endef
 
@@ -84,9 +84,12 @@ endef
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 ################################################################################
 define GENDOC
-$(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 1")
-$(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 1")
-$(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
+$(call GENDOC_INNER,$(pkgname),xhtml,html,html,HTML,\
+	--xsltproc-opts "--stringparam toc.section.depth 1")
+$(call GENDOC_INNER,$(pkgname),chunked,split-html,chunked,split HTML,\
+	--xsltproc-opts "--stringparam toc.section.depth 1")
+$(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,\
+	--dblatex-opts "-P latex.output.revhistory=0")
 $(call GENDOC_INNER,$(pkgname),text,text,text,text)
 $(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
 clean: $(pkgname)-clean
