From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 15 Nov 2012 23:07:28 +0100
Subject: [Buildroot] [PATCH 02/23] manual: make clean target consistent with
	others in buildroot
In-Reply-To: <87zk2i1qf3.fsf@dell.be.48ers.dk>
References: <87zk2i1qf3.fsf@dell.be.48ers.dk>
Message-ID: <1353017248-13356-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 1eaf73a..fd9091e 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -38,10 +38,10 @@ $(call GENDOC_INNER,$(1),chunked,split-html,chunked,Split HTML)
 $(call GENDOC_INNER,$(1),pdf,pdf,pdf,PDF,--dblatex-opts "-P latex.output.revhistory=0")
 $(call GENDOC_INNER,$(1),text,txt,text,Text)
 $(call GENDOC_INNER,$(1),epub,epub,epub,EPUB)
-clean: clean-$(1)
-clean-$(1):
+clean: $(1)-clean
+$(1)-clean:
 	$(Q)$(RM) -rf $(O)/docs/$(1)
-.PHONY: $(1) clean-$(1)
+.PHONY: $(1) $(1)-clean
 endef
 
 MANUAL_SOURCES = $(wildcard docs/manual/*.txt) $(wildcard docs/images/*)
-- 
1.8.0
