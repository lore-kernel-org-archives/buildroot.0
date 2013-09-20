From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 20 Sep 2013 15:16:02 +0200
Subject: [Buildroot] [git commit] manual generation: change capitalization
	of messages
Message-ID: <20130920132138.BA3EC9B810@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50a18b63c977ce5a04d92476ad5a6202009a2cb6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When generating the manual, you see following messages:

>>>   Generating HTML manual...
>>>   Generating Split HTML manual...
>>>   Generating PDF manual...
>>>   Generating Text manual...
>>>   Generating EPUB manual...

and with this patch the capitalization is changed so that it becomes:

>>>   Generating HTML manual...
>>>   Generating split HTML manual...
>>>   Generating PDF manual...
>>>   Generating text manual...
>>>   Generating ePUB manual...

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/manual.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index bcbedad..d092d3f 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -43,10 +43,10 @@ endef
 ################################################################################
 define GENDOC
 $(call GENDOC_INNER,$(1),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 4")
-$(call GENDOC_INNER,$(1),chunked,split-html,chunked,Split HTML,--xsltproc-opts "--stringparam toc.section.depth 4")
+$(call GENDOC_INNER,$(1),chunked,split-html,chunked,split HTML,--xsltproc-opts "--stringparam toc.section.depth 4")
 $(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
-$(call GENDOC_INNER,$(1),text,txt,text,Text)
-$(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
+$(call GENDOC_INNER,$(1),text,txt,text,text)
+$(call GENDOC_INNER,$(1),epub,epub,epub,ePUB)
 clean: $(1)-clean
 $(1)-clean:
 	$(Q)$(RM) -rf $(O)/docs/$(1)
