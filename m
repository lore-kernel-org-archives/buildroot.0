From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 16:57:34 +0100
Subject: [Buildroot] [git commit] manual generation: rename manual-txt into
	manual-text
Message-ID: <20131104211054.DDF479BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=462e9915fd8115419654e43473591a0af625229c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The output extension and the generation messages refer to 'text', but the make
target was confusingly 'txt'. This patch changes the make target for
consistency.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile              |    4 ++--
 docs/manual/manual.mk |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index f266e2d..1496bd7 100644
--- a/Makefile
+++ b/Makefile
@@ -797,7 +797,7 @@ endif
 	@echo '  manual-html            - build manual in HTML'
 	@echo '  manual-split-html      - build manual in split HTML'
 	@echo '  manual-pdf             - build manual in PDF'
-	@echo '  manual-txt             - build manual in txt'
+	@echo '  manual-text            - build manual in text'
 	@echo '  manual-epub            - build manual in ePub'
 	@echo
 	@echo 'Miscellaneous:'
@@ -821,7 +821,7 @@ release: OUT=buildroot-$(BR2_VERSION)
 # documentation to the git output
 release:
 	git archive --format=tar --prefix=$(OUT)/ HEAD > $(OUT).tar
-	$(MAKE) O=$(OUT) manual-html manual-txt manual-pdf
+	$(MAKE) O=$(OUT) manual-html manual-text manual-pdf
 	tar rf $(OUT).tar $(OUT)
 	gzip -9 -c < $(OUT).tar > $(OUT).tar.gz
 	bzip2 -9 -c < $(OUT).tar > $(OUT).tar.bz2
diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index fcfe47b..aeafd10 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -75,7 +75,7 @@ define GENDOC
 $(call GENDOC_INNER,$(1),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 4")
 $(call GENDOC_INNER,$(1),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 4")
 $(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
-$(call GENDOC_INNER,$(1),text,txt,text,text)
+$(call GENDOC_INNER,$(1),text,text,text,text)
 $(call GENDOC_INNER,$(1),epub,epub,epub,ePUB)
 clean: $(1)-clean
 $(1)-clean:
