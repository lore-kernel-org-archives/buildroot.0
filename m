From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 19 Sep 2013 12:47:13 +0200
Subject: [Buildroot] [PATCH 1 of 4] manual generation: change capitalization
	of messages
In-Reply-To: <patchbomb.1379587632@argentina>
References: <patchbomb.1379587632@argentina>
Message-ID: <4d78895bc1ab7d77560e.1379587633@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

---
 docs/manual/manual.mk |  6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
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
