From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 20 Aug 2014 12:03:19 +0200
Subject: [Buildroot] [PATCH 1/6] gendoc infra: cosmetic fixes
In-Reply-To: <1408529004-18632-1-git-send-email-s.martin49@gmail.com>
References: <1408529004-18632-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1408529004-18632-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- wrap lines to 80 characters
- fix space/tab mixup

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 8d401a2..13ed0b4 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -71,8 +71,8 @@ $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt \
 	$$(Q)rsync -au docs/$(1)/*.txt $$(@D)/.build
 	$$(Q)a2x $(6) -f $(2) -d book -L -r $$(TOPDIR)/docs/images \
 	        -D $$(@D) $$(@D)/.build/$(1).txt \
-	        --asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)"
 	-$$(Q)rm -rf $$(@D)/.build
+		--asciidoc-opts="$$(MANUAL_$(2)_ASCIIDOC_OPTS)"
 endef
 
 ################################################################################
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
-- 
2.0.4
