From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 15 Nov 2012 23:49:48 +0100
Subject: [Buildroot] [git commit] manual: make clean target consistent with
	others in buildroot
Message-ID: <20121115230536.9CBD699E3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b566e8cb56b65d1b86f3502abf19d4f7304100bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/manual.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
