From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Sep 2013 12:47:16 +0200
Subject: [Buildroot] [PATCH 4 of 4] manual generation: rename manual-txt
	into manual-text
In-Reply-To: <patchbomb.1379587632@argentina>
References: <patchbomb.1379587632@argentina>
Message-ID: <a2b05987569c1439422b.1379587636@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The output extension and the generation messages refer to 'text', but the make
target was confusingly 'txt'. This patch changes the make target for
consistency.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/manual.mk |  2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
--- a/Makefile
+++ b/Makefile
@@ -815,7 +815,7 @@ endif
 	@echo '  manual-html            - build manual in HTML'
 	@echo '  manual-split-html      - build manual in split HTML'
 	@echo '  manual-pdf             - build manual in PDF'
-	@echo '  manual-txt             - build manual in txt'
+	@echo '  manual-text            - build manual in text'
 	@echo '  manual-epub            - build manual in ePub'
 	@echo
 	@echo 'Miscellaneous:'
diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -56,7 +56,7 @@ define GENDOC
 $(call GENDOC_INNER,$(1),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 4")
 $(call GENDOC_INNER,$(1),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 4")
 $(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
-$(call GENDOC_INNER,$(1),text,txt,text,text)
+$(call GENDOC_INNER,$(1),text,text,text,text)
 $(call GENDOC_INNER,$(1),epub,epub,epub,ePUB)
 clean: $(1)-clean
 $(1)-clean:
