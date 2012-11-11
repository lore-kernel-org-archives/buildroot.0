From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 11 Nov 2012 14:14:40 +0100
Subject: [Buildroot] [PATCH 02/23] manual: make clean target consistent with
	others in buildroot
In-Reply-To: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1352639701-27829-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 1eaf73a..83d2fcb 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -38,10 +38,10 @@ $(call GENDOC_INNER,$(1),chunked,split-html,chunked,Split HTML)
 $(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
 $(call GENDOC_INNER,$(1),text,txt,text,Text)
 $(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
-clean: clean-$(1)
-clean-$(1):
+clean clean-$(1): $(1)-clean
+$(1)-clean:
 	$(Q)$(RM) -rf $(O)/docs/$(1)
-.PHONY: $(1) clean-$(1)
+.PHONY: $(1) $(1)-clean
 endef
 
 MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)
-- 
1.8.0
