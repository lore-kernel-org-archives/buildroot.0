From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:14:41 +0100
Subject: [Buildroot] [PATCH 03/23] manual: set toc depth to 4 for html
	outputs
In-Reply-To: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1352639701-27829-4-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 83d2fcb..0043ebf 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -33,8 +33,8 @@ endef
 # The variable <DOCUMENT_NAME>_SOURCES defines the dependencies.
 ################################################################################
 define GENDOC
-$(call GENDOC_INNER,$(1),xhtml,html,html,HTML)
-$(call GENDOC_INNER,$(1),chunked,split-html,chunked,Split HTML)
+$(call GENDOC_INNER,$(1),xhtml,html,html,HTML,--xsltproc-opts "--stringparam toc.section.depth 4")
+$(call GENDOC_INNER,$(1),chunked,split-html,chunked,Split HTML,--xsltproc-opts "--stringparam toc.section.depth 4")
 $(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
 $(call GENDOC_INNER,$(1),text,txt,text,Text)
 $(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
-- 
1.8.0
